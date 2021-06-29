<cfcomponent>
	<cfscript>
		manager = createObject('component', "PannelloDocumentazione/managersDB/DB_modifica_ambienti");

		public string function creaContenutoTabella(tipo){
			if(tipo == "aggiungi"){
				return tabellaAggiungi();
			}else if(tipo == "elimina"){
				return tabellaElimina();
			}else{
				return tabellaModifica();
			}
		}

		public string function tabellaAggiungi(){
			return "<td scope='row'><input type='text' name='txtAmbiente'></td>
					<td scope='row'><input type='text' name='txtPortale'></td>
					<td scope='row'><input type='text' name='txtAdministrator'></td>
					<td scope='row'><input type='text' name='txtUtils'></td>
					<td scope='row'><input type='text' name='txtProcedura'></td>
					<td scope='row'><input type='text' name='txtVersione'></td>";
		}

		public string function tabellaModifica(){

		}

	</cfscript>
</cfcomponent>