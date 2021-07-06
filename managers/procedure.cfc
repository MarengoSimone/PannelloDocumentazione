<cfcomponent>
	<cfscript>
		managerDB = createObject('component', "PannelloDocumentazione/managersDB/DB_procedure");
		managerCSV = createObject('component', "PannelloDocumentazione/managersCSV/CSV_procedure");

		public string function scriviTabella(){
			//allProcedure = managerDB.getAllProcedure();
			allProcedure = managerCSV.getAllProcedure();
			local.righeTabella = "<tbody>";
			for(local.i = 1; local.i <= allProcedure.recordCount; local.i++){
				if(allProcedure.descrizione[local.i] != ""){
					local.descrizione = allProcedure.descrizione[local.i];
				}else{
					local.descrizione = "/";
				}

				if(allProcedure.note[local.i] != ""){
					local.note = allProcedure.note[local.i];
				}else{
					local.note = "/";
				}

				local.righeTabella &= "<tr><td scope='row'>#allProcedure.nomeProcedura[local.i]#</td><td scope='row'><textarea rows='5' cols='60' style='resize: none;' readonly disabled>#local.descrizione#</textarea></td><td scope='row'><textarea rows='5' cols='60' style='resize: none;' readonly disabled>#local.note#</textarea></td><td scope = 'row'><input type='radio' name='radioModifica' value='#allProcedure.procedureID[local.i]#'></td><td scope = 'row'><input type='radio' name='radioElimina' value='#allProcedure.procedureID[local.i]#'></td></tr>";
			}
			local.righeTabella &= "</tbody>";

			return local.righeTabella;
		}

		public void function controlloForm(form){
			if(isDefined("form") && isDefined("form.btnAggiungiProcedura") && form.btnAggiungiProcedura == "Aggiungi Procedura"){
				//managerDB.aggiungiFormDB(form);
				managerCSV.aggiungiFormCSV(form);
			}else if(isDefined("form") && isDefined("form.btnModificaProcedura") && form.btnModificaProcedura == "Aggiorna Procedura"){
				//managerDB.modificaFormDB(form);
				managerCSV.modificaFormCSV(form);
			}else if(isDefined("form") && isDefined("form.btnEliminaProcedura") && form.btnEliminaProcedura == "Elimina Procedura"){
				//managerDB.eliminaFormDB(form);
				managerCSV.eliminaFormCSV(form);
			}
		}
	</cfscript>
</cfcomponent>;