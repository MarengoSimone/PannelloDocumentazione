<cfcomponent>
	<cfscript>
		managerDB = createObject('component', "PannelloDocumentazione/managersDB/DB_modifica_pagine");
		public string function scriviTabella(tipo, pagid){
			if(tipo == "aggiungi"){
				return tabellaAggiungi();
			}else if(tipo == "modifica"){
				return tabellaModifca(pagid);
			}else{
				return tabellaElimina(pagid);
			}
		}

		public string function tabellaAggiungi(){
			return "<tbody>
					<td scope='row'><input type='text' name='txtNomePagina' required></td>
					<td scope='row'><textarea name='txtLocazione' cols='50'></textarea></td>
					<td scope='row'><textarea name='txtFunzioni' cols='50'></textarea></td>
					<td scope='row'><textarea name='txtTabelle' cols='50'></textarea></td>
					</tbody>";
		}

		public string function tabellaModifca(pagid){
			allPaginePagID = managerDB.getAllPaginePagID(pagid);
			return "<tbody>
					<td scope='row'><input type='text' name='txtNomePagina' value='#allPaginePagID.nomePagina#' required></td>
					<td scope='row'><textarea name='txtLocazione' cols='50'>#allPaginePagID.loc#</textarea></td>
					<td scope='row'><textarea name='txtFunzioni' cols='50'>#allPaginePagID.funzioni#</textarea></td>
					<td scope='row'><textarea name='txtTabelle' cols='50'>#allPaginePagID.tabelle#</textarea></td>
					<input type='hidden' name='txtPagID' value='#allPaginePagID.pagID#'>
					</tbody>";
		}

		public string function tabellaElimina(pagid){
			allPaginePagID = managerDB.getAllPaginePagID(pagid);
			return "<tbody>
					<td scope='row'><input type='text' name='txtNomePagina' value='#allPaginePagID.nomePagina#' readonly></td>
					<td scope='row'><textarea name='txtLocazione' cols='50' readonly disabled>#allPaginePagID.loc#</textarea></td>
					<td scope='row'><textarea name='txtFunzioni' cols='50' readonly disabled>#allPaginePagID.funzioni#</textarea></td>
					<td scope='row'><textarea name='txtTabelle' cols='50' readonly disabled>#allPaginePagID.tabelle#</textarea></td>
					<input type='hidden' name='txtPagID' value='#allPaginePagID.pagID#'>
					</tbody>
					<h2>SICURO DI VOLER ELIMINARE?</h2>";	
		}

		public string function creaBottoni(tipo){
			if(tipo == "aggiungi"){
				return "<a href='pagine.cfm'><input type='button' class='btn btn-warning' value='Indietro'></a>
						<input type = 'submit' class='btn btn-primary' name='btnAggiungiPagina' value='Aggiungi Pagina'>";
			}else if(tipo == "modifica"){
				return "<a href='pagine.cfm'><input type='button' class='btn btn-warning' value='Indietro'></a>
						<input type = 'submit' class='btn btn-info' name='btnModificaPagina' value='Aggiorna Pagina'>";
			}else{
				return "<a href='pagine.cfm'><input type='button' class='btn btn-warning' value='Indietro'></a>
						<input type = 'submit' class='btn btn-danger' name='btnEliminaPagina' value='Elimina Pagina'>";
			}
		}
	</cfscript>
</cfcomponent>