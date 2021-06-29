<cfcomponent>
	<cfscript>
	managerDB = createObject('component', "PannelloDocumentazione/managersDB/DB_ambienti");

		public string function scriviElementiTabella(){
			allAmbienti = managerDB.getAllAmbienti();
			local.contenuto = "";
			//writeDump(allAmbienti);

			for(local.idx = 1; local.idx <= allAmbienti.recordCount; local.idx++){
				linkPortale = "<a href='#allAmbienti.portale[local.idx]#'>go</a>";
				if(#allAmbienti.administrator[local.idx]# != ""){
					linkAdministrator = "<a href='#allAmbienti.administrator[local.idx]#'>go</a>";
				}else{
					linkAdministrator = "/";
				}

				if(#allAmbienti.utils[local.idx]# != ""){
					linksUtils = linkUtils(local.idx, allAmbienti);
				}else{
					linksUtils = "/";
				}
				if(#allAmbienti.proced[local.idx]# != ""){
					linksProcedure = linkProcedure(local.idx, allAmbienti);
				}else{
					linksProcedure = "/";
				}
				local.contenuto &= "<tr><td scope = 'row'>#allAmbienti.ambiente[local.idx]#</td><td scope = 'row'>#linkPortale#</td><td scope = 'row'>#linkAdministrator#</td><td scope = 'row'>#linksUtils#</td><td scope = 'row'>#linksProcedure#</td><td scope = 'row'>#allAmbienti.versione[local.idx]#</td><td scope = 'row'><input type='radio' name='radioModifica'></td><td scope = 'row'><input type='radio' name='radioElimina'></td></tr>";
			}

			return local.contenuto;
		}

		public string function linkUtils(indice, allAmbienti){
			linkfine = "";
			links = listToArray(#allAmbienti.utils[indice]#, ';', false, false);
			for(i = 1; i <= links.len(); i++){
				nome = listToArray(#links[i]#, '/', false, false);
				linkFine &= "<a href='localhost:8500/#links[i]#'>#nome[3]#</a><br>";
			}
			return linkFine;
		}

		public string function linkProcedure(indice, allAmbienti){
			linkfine = "";
			links = listToArray(#allAmbienti.proced[indice]#, ';', false, false);
			for(i = 1; i <= links.len(); i++){
				nome = listToArray(#links[i]#, '/', false, false);
				linkFine &= "<a href='localhost:8500/#links[i]#'>#nome[3]#</a><br>";
			}
			return linkFine;
		}

		public void function controlloForm(form){
			if(isDefined("form") && isDefined("form.btnAggiungiAmbiente") && form.btnAggiungiAmbiente == "Aggiungi Ambiente"){
				managerDB.aggiungiFormDB(form);
			}
		}
	</cfscript>
</cfcomponent>