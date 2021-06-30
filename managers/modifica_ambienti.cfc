<cfcomponent>
	<cfscript>
		managerDB = createObject('component', "PannelloDocumentazione/managersDB/DB_modifica_ambienti");

		public string function creaContenutoTabella(tipo, ambiente){
			if(tipo == "aggiungi"){
				return tabellaAggiungi();
			}else if(tipo == "elimina"){
				return tabellaElimina(ambiente);
			}else{
				return tabellaModifica(ambiente);
			}
		}

		public string function tabellaAggiungi(){
			return "<tbody>
					<td scope='row'><input type='text' name='txtAmbiente'></td>
					<td scope='row'><input type='text' name='txtPortale'></td>
					<td scope='row'><input type='text' name='txtAdministrator'></td>
					<td scope='row'><input type='text' name='txtUtils'></td>
					<td scope='row'><input type='text' name='txtProcedura'></td>
					<td scope='row'><input type='text' name='txtVersione'></td>
					</tbody>";
		}

		public string function tabellaElimina(ambiente){
			allAmbientiAmbiente = managerDB.getAllAmbientiAmbiente(ambiente);
			return "<tbody>
					<td scope='row'><input type='text' name='txtAmbiente' value='#allAmbientiAmbiente.ambiente#' readonly></td>
					<td scope='row'><input type='text' name='txtPortale' value='#allAmbientiAmbiente.portale#' readonly></td>
					<td scope='row'><input type='text' name='txtAdministrator' value='#allAmbientiAmbiente.administrator#' readonly></td>
					<td scope='row'><input type='text' name='txtUtils' value='#allAmbientiAmbiente.utils#' readonly></td>
					<td scope='row'><input type='text' name='txtProcedura' value='#allAmbientiAmbiente.proced#' readonly></td>
					<td scope='row'><input type='text' name='txtVersione' value='#allAmbientiAmbiente.versione#' readonly></td>
					</tbody>
					<h2>SICURO DI VOLER ELIMINARE L'AMBIENTE?<h2>";
		}

		public string function tabellaModifica(ambiente){
			allAmbientiAmbiente = managerDB.getAllAmbientiAmbiente(ambiente);
			return "<tbody>
					<td scope='row'><input type='text' name='txtAmbiente' value='#allAmbientiAmbiente.ambiente#' readonly></td>
					<td scope='row'><input type='text' name='txtPortale' value='#allAmbientiAmbiente.portale#'></td>
					<td scope='row'><input type='text' name='txtAdministrator' value='#allAmbientiAmbiente.administrator#'></td>
					<td scope='row'><input type='text' name='txtUtils' value='#allAmbientiAmbiente.utils#'></td>
					<td scope='row'><input type='text' name='txtProcedura' value='#allAmbientiAmbiente.proced#'></td>
					<td scope='row'><input type='text' name='txtVersione' value='#allAmbientiAmbiente.versione#'></td>
					</tbody>";
		}

		public string function creaBottoni(tipo){
			if(tipo == "aggiungi"){
				return "<a href='ambienti.cfm'><input type='button' value='Indietro' class='btn btn-warning'>
						<input type='submit' name='btnAggiungiAmbiente' class='btn btn-primary' value='Aggiungi Ambiente'>";
			}else if(tipo == "modifica"){
				return "<a href='ambienti.cfm'><input type='button' value='Indietro' class='btn btn-warning'>
						<input type='submit' name='btnModificaAmbiente' class='btn btn-info' value='Aggiorna Ambiente'>";
			}else{
				return "<a href='ambienti.cfm'><input type='button' value='Indietro' class='btn btn-warning'>
						<input type='submit' name='btnEliminaAmbiente' class='btn btn-danger' value='Elimina Ambiente'>";
			}
		}
	</cfscript>
</cfcomponent>