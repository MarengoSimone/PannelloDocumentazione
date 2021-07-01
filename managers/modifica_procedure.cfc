<cfcomponent>
	<cfscript>
		managerDB = createObject('component', "PannelloDocumentazione/managersDB/DB_modifica_procedure");
		public string function scriviTabella(tipo, procedureID){
			if(tipo == "aggiungi"){
				return tabellaAggiungi();
			}else if(tipo == "modifica"){
				return tabellaModifica(procedureID);
			}else{

			}
		}

		public string function tabellaAggiungi(){
			return "<tbody>
					<td scope='row'><input type='text' name='txtNomeProcedura' required></td>
					<td scope='row'><input type='text' name='txtDescrizione'></td>
					<td scope='row'><input type='text' name='txtNote'></td>
					</tbody>";
		}

		public string function tabellaModifica(procedureID){
			allProcedureProcedureID = managerDB.getAllProcedureProcedureID(procedureID);
			return "<tbody>
					<td scope='row'><input type='text' name='txtNomeProcedura' value='#allProcedureProcedureID.nomeProcedura#' required></td>
					<td scope='row'><input type='text' name='txtDescrizione' value='#allProcedureProcedureID.descrizione#'></td>
					<td scope='row'><input type='text' name='txtNote' value='#allProcedureProcedureID.note#'></td>
					<input type='hidden' name='txtProcedureID' value='#allProcedureProcedureID.procedureID#'>
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
				return "<a href='procedure.cfm'><input type='button' class='btn btn-warning' value='Indietro'></a>
						<input type = 'submit' class='btn btn-primary' name='btnAggiungiProcedura' value='Aggiungi Procedura'>";
			}else if(tipo == "modifica"){
				return "<a href='procedure.cfm'><input type='button' class='btn btn-warning' value='Indietro'></a>
						<input type = 'submit' class='btn btn-info' name='btnModificaProcedura' value='Aggiorna Procedura'>";
			}else{

			}
		}
	</cfscript>
</cfcomponent>