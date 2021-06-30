<cfcomponent>
	<cfscript>
		managerDB = createObject('component', "PannelloDocumentazione/managersDB/DB_pagine");
		public string function scriviTabella(){
			allPagine = managerDB.getAllPagine();
			local.righeTabella = "<tbody>";
			for(local.i = 1; local.i <= allPagine.recordCount; local.i++){
				local.righeTabella &= "<tr><td scope='row'>#allPagine.nomePagina#</td><td scope='row'>#allPagine.loc#</td><td scope='row'>#allPagine.funzioni#</td><td scope='row'>#allPagine.tabelle#</td><td scope = 'row'><input type='radio' name='radioModifica' value='#allPagine.nomePagina[local.i]#'></td><td scope = 'row'><input type='radio' name='radioElimina' value='#allPagine.nomePagina[local.i]#'></td></tr>";
			}
			local.righeTabella &= "</tbody>";

			return local.righeTabella;
		}

		public void function controlloForm(form){
			if(isDefined("form") && isDefined("form.btnAggiungiPagina") && form.btnAggiungiPagina == "Aggiungi Pagina"){
				managerDB.aggiungiFormDB(form);
			}
		}
	</cfscript>
</cfcomponent>;