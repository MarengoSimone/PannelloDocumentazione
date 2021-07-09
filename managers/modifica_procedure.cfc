<cfcomponent>
	<cfscript>
		managerDB = createObject('component', "PannelloDocumentazione/managersDB/DB_modifica_procedure");
		managerCSV = createObject('component', "PannelloDocumentazione/managersCSV/CSV_modifica_procedure");

		public string function scriviTabella(tipo, procedureID){
			if(tipo == "aggiungi"){
				return tabellaAggiungi();
			}else if(tipo == "modifica"){
				return tabellaModifica(procedureID);
			}else{
				return tabellaElimina(procedureID);
			}
		}

		public string function tabellaAggiungi(){
			return "<tbody>
					<td scope='row'><input type='text' name='txtNomeProcedura' required></td>
					<td scope='row'><textarea name='txtDescrizione' cols='60'></textarea></td>
					<td scope='row'><textarea name='txtNote' cols='60'></textarea></td>
					</tbody>";
		}

		public string function tabellaModifica(procedureID){
			allProcedureProcedureID = managerDB.getAllProcedureProcedureID(procedureID);
			//allProcedureProcedureID = managerCSV.getAllProcedureProcedureID(procedureID);
			return "<tbody>
					<td scope='row'><input type='text' name='txtNomeProcedura' value='#allProcedureProcedureID.nomeProcedura#' required></td>
					<td scope='row'><textarea name='txtDescrizione' cols='60'>#allProcedureProcedureID.descrizione#</textarea></td>
					<td scope='row'><textarea name='txtNote' cols='60'>#allProcedureProcedureID.note#</textarea></td>
					<input type='hidden' name='txtProcedureID' value='#allProcedureProcedureID.procedureID#'>
					</tbody>";
		}

		public string function tabellaElimina(procedureID){
			allProcedureProcedureID = managerDB.getAllProcedureProcedureID(procedureID);
			//allProcedureProcedureID = managerCSV.getAllProcedureProcedureID(procedureID);
			return "<tbody>
					<td scope='row'><input type='text' name='txtNomeProcedura' value='#allProcedureProcedureID.nomeProcedura#' readonly></td>
					<td scope='row'><textarea name='txtDescrizione' rows='5' cols='60' readonly disabled>#allProcedureProcedureID.descrizione#</textarea></td>
					<td scope='row'><textarea name='txtNote' rows='5' cols='60' readonly disabled>#allProcedureProcedureID.note#</textarea></td>
					<input type='hidden' name='txtProcedureID' value='#allProcedureProcedureID.procedureID#'>
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
				return "<a href='procedure.cfm'><input type='button' class='btn btn-warning' value='Indietro'></a>
						<input type = 'submit' class='btn btn-danger' name='btnEliminaProcedura' value='Elimina Procedura'>";
			}
		}

		public void function exportInCSV(){
			allProcedure = managerDB.getAllProcedure();
			managerCSV.inport(allProcedure);
		}

		public void function inportInDB(){
			allProcedure = managerCSV.getAllProcedure();
			managerDB.inport(allProcedure);
		}
	</cfscript>
</cfcomponent>