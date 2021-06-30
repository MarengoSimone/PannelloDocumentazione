<cfcomponent>
	<cfscript>
		public string function scriviTabella(tipo){
			if(tipo == "aggiungi"){
				return tabellaAggiungi();
			}else if(tipo == "elimina"){
				return tabellaModifca(); //DA FINIREEEEEEEEEE
			}else{

			}
		}

		public string function tabellaAggiungi(){
			return "<tbody>
					<td scope='row'><input type='text' name='txtNomePagina'></td>
					<td scope='row'><input type='text' name='txtLocazione'></td>
					<td scope='row'><input type='text' name='txtFunzioni'></td>
					<td scope='row'><input type='text' name='txtTabelle'></td>
					</tbody>";
		}
	</cfscript>
</cfcomponent>