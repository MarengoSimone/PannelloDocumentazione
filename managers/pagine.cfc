<cfcomponent>
	<cfscript>
		managerDB = createObject('component', "PannelloDocumentazione/managersDB/DB_pagine");
		public string function scriviTabella(){
			allPagine = managerDB.getAllPagine();
			local.righeTabella = "<tbody>";
			for(local.i = 1; local.i <= allPagine.recordCount; local.i++){
				if(allPagine.loc[local.i] != "")
					local.locazione = allPagine.loc[local.i];
				else
					local.locazione = "/";

				if(allPagine.funzioni[local.i] != "")
					local.funzioni = allPagine.funzioni[local.i];
				else
					local.funzioni = "/";

				if(allPagine.tabelle[local.i] != "")
					local.tabelle = allPagine.tabelle[local.i];
				else
					local.tabelle = "/";

				local.righeTabella &= "<tr><td scope='row'>#allPagine.nomePagina[local.i]#</td><td scope='row'><textarea rows='5' cols='40' readonly disabled>#local.locazione#</textarea></td><td scope='row'><textarea rows='5' cols='40' readonly disabled>#local.funzioni#</textarea></td><td scope='row'><textarea rows='5' cols='40' readonly disabled>#local.tabelle#</textarea></td><td scope = 'row'><input type='radio' name='radioModifica' value='#allPagine.pagID[local.i]#'></td><td scope = 'row'><input type='radio' name='radioElimina' value='#allPagine.pagID[local.i]#'></td></tr>";
			}
			local.righeTabella &= "</tbody>";

			return local.righeTabella;
		}

		public void function controlloForm(form){
			if(isDefined("form") && isDefined("form.btnAggiungiPagina") && form.btnAggiungiPagina == "Aggiungi Pagina"){
				managerDB.aggiungiFormDB(form);
			}else if(isDefined("form") && isDefined("form.btnModificaPagina") && form.btnModificaPagina == "Aggiorna Pagina"){
				managerDB.updateFormDB(form);
			}else if(isDefined("form") && isDefined("form.btnEliminaPagina") && form.btnEliminaPagina == "Elimina Pagina"){
				managerDB.eliminaFormDB(form);
			}
		}
	</cfscript>
</cfcomponent>;