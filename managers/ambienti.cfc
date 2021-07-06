<cfcomponent>
	<cfscript>
	managerDB = createObject('component', "PannelloDocumentazione/managersDB/DB_ambienti");
	managerCSV = createObject('component', "PannelloDocumentazione/managersCSV/CSV_ambienti");

		public string function scriviElementiTabella(){
			//allAmbienti = managerDB.getAllAmbienti();
			allAmbienti = managerCSV.getAllAmbienti();
			local.contenuto = "<tbody>";

			for(local.idx = 1; local.idx <= allAmbienti.recordCount; local.idx++){
				if(#allAmbienti.portale[local.idx]# != ""){
					linkPortale = "<a href='#allAmbienti.portale[local.idx]#'>go</a>";
				}else{
					linkPortale = "/";
				}

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

				if(#allAmbienti.versione[local.idx]# != ""){
					versione = "#allAmbienti.versione[local.idx]#";
				}else{
					versione = "/";
				}
				local.contenuto &= "<tr><td scope = 'row'>#allAmbienti.ambiente[local.idx]#</td><td scope = 'row'>#linkPortale#</td><td scope = 'row'>#linkAdministrator#</td><td scope = 'row'>#linksUtils#</td><td scope = 'row'>#linksProcedure#</td><td scope = 'row'>#versione#</td><td scope = 'row'><input type='radio' name='radioModifica' value='#allAmbienti.ambiente[local.idx]#'></td><td scope = 'row'><input type='radio' name='radioElimina' value='#allAmbienti.ambiente[local.idx]#'></td></tr>";
			}
			local.contenuto &= "</tbody>";
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
				//managerDB.aggiungiFormDB(form);
				managerCSV.aggiungiFormCSV(form);
			}else if(isDefined("form") && isDefined("form.btnModificaAmbiente") && form.btnModificaAmbiente == "Aggiorna Ambiente"){
				//managerDB.modificaFormDB(form);
				managerCSV.modificaFormCSV(form);
			}else if(isDefined("form") && isDefined("form.btnEliminaAmbiente") && form.btnEliminaAmbiente == "Elimina Ambiente"){
				//managerDB.eliminaFormDB(form);
				managerCSV.eliminaFormCSV(form);
			}
		}

		public string function bottoneModifica(ambienteModifica){
			return "<a href='modifica_ambienti.cfm?tipo=modifica&ambienteModifica=#ambienteModifica#'>  <button class='btn btn-primary'>Modifica Ambiente</button> </a>";
		}
	</cfscript>
</cfcomponent>