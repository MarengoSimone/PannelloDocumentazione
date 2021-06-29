<cfcomponent>
	<cfscript>
	managerDB = createObject('component', "PannelloDocumentazione/managersDB/DB_ambienti");

		public void function scriviHeaderTabella(){
			allAmbienti = managerDB.getAllAmbienti();
			ambientiColumns = allAmbienti.columnArray();
			writeOutput("<tr>");
			for(i = 1; i <= ambientiColumns.len(); i++){
				writeOutput("<th scope='col'>#ambientiColumns[i]#</th>");
			}
			writeOutput("</tr>");
		}

		public string function scriviElementiTabella(){
			allAmbienti = managerDB.getAllAmbienti();
			local.riga = "";
			//writeDump(allAmbienti);

			for(local.idx = 1; local.idx <= allAmbienti.recordCount; local.idx++){
				linkPortale = "<a href='#allAmbienti.portale[local.idx]#'>go</a>";
				//if(#allAmbienti.administrator[i]# != ""){
					linkAdministrator = "<a href='#allAmbienti.administrator[local.idx]#'>go</a>";
				//}else{
				//	linkAdministrator = "/";
				//}

				//if(#allAmbienti.utils[i]# != ""){
					linksUtils = linkUtils(local.idx, allAmbienti);
				//}else{
				//	linkUtils = "/";
				//}
				//writeDump(linkUtils(i, allAmbienti));

				//if(#allAmbienti.proced[i]# != ""){
					linksProcedure = linkProcedure(local.idx, allAmbienti);
				//}else{
				//	linkProcedure = "/";
				//}
				//writeDump(linkProcedure(i, allAmbienti));
				local.riga &= "<tr><td scope = 'row'>#allAmbienti.ambiente[local.idx]#</td><td scope = 'row'>#linkPortale#</td><td scope = 'row'>#linkAdministrator#</td><td scope = 'row'>#linksUtils#</td><td scope = 'row'>#linksProcedure#</td><td scope = 'row'>#allAmbienti.versione[local.idx]#</td></tr>";
				//local.riga = local.idx;
				//writeDump(local.riga);

			}

			return local.riga;
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
	</cfscript>
</cfcomponent>