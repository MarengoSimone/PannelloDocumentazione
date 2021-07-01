<cfcomponent>
	<cfscript>
		managerDB = createObject('component', "PannelloDocumentazione/managersDB/DB_procedure");
		public string function scriviTabella(){
			allProcedure = managerDB.getAllProcedure();
			local.righeTabella = "<tbody>";
			for(local.i = 1; local.i <= allProcedure.recordCount; local.i++){
				local.righeTabella &= "<tr><td scope='row'>#allProcedure.nomeProcedura[local.i]#</td><td scope='row'>#allProcedure.descrizione[local.i]#</td><td scope='row'>#allProcedure.note[local.i]#</td><td scope = 'row'><input type='radio' name='radioModifica' value='#allProcedure.procedureID[local.i]#'></td><td scope = 'row'><input type='radio' name='radioElimina' value='#allProcedure.procedureID[local.i]#'></td></tr>";
			}
			local.righeTabella &= "</tbody>";

			return local.righeTabella;
		}

		public void function controlloForm(form){
			if(isDefined("form") && isDefined("form.btnAggiungiProcedura") && form.btnAggiungiProcedura == "Aggiungi Procedura"){
				managerDB.aggiungiFormDB(form);
			}else if(isDefined("form") && isDefined("form.btnModificaProcedura") && form.btnModificaProcedura == "Aggiorna Procedura"){
				managerDB.modificaFormDB(form);
			}
		}
	</cfscript>
</cfcomponent>;