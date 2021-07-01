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
					<td scope='row'><input type='text' name='txtLocazione'></td>
					<td scope='row'><input type='text' name='txtFunzioni'></td>
					<td scope='row'><input type='text' name='txtTabelle'></td>
					</tbody>";
		}

		public string function tabellaModifca(pagid){
			allPaginePagID = managerDB.getAllPaginePagID(pagid);
			return "<tbody>
					<td scope='row'><input type='text' name='txtNomePagina' value='#allPaginePagID.nomePagina#' required></td>
					<td scope='row'><input type='text' name='txtLocazione' value='#allPaginePagID.loc#'></td>
					<td scope='row'><input type='text' name='txtFunzioni' value='#allPaginePagID.funzioni#'></td>
					<td scope='row'><input type='text' name='txtTabelle' value='#allPaginePagID.tabelle#'></td>
					<input type='hidden' name='txtPagID' value='#allPaginePagID.pagID#'>
					</tbody>";
		}

		public string function tabellaElimina(pagid){
			allPaginePagID = managerDB.getAllPaginePagID(pagid);
			return "<tbody>
					<td scope='row'><input type='text' name='txtNomePagina' value='#allPaginePagID.nomePagina#' readonly></td>
					<td scope='row'><input type='text' name='txtLocazione' value='#allPaginePagID.loc#' readonly></td>
					<td scope='row'><input type='text' name='txtFunzioni' value='#allPaginePagID.funzioni#' readonly></td>
					<td scope='row'><input type='text' name='txtTabelle' value='#allPaginePagID.tabelle#' readonly></td>
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