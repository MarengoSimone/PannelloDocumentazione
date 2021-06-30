<cfcomponent>
	<cfscript> 
		gestioneDB = createObject("component", "PannelloDocumentazione\managersDB\DB_gestione_ticket");
		public any function caricaTabella(mode){
			row = "";
			if(#mode# == "Aggiungi")
			{
				row = "<td scope='row'> <input type='text' name='txtNome'> </td>
					   <td scope='row'> <input type='text' name='txtDescrizione'> </td>
					   <td scope='row'> <input type='text' name='txtProblemi'> </td>
					   <td scope='row'> <input type='text' name='txtTest'> </td>
					   <td scope='row'> <input type='text' name='txtInstallazione'> </td>";
			}
			else if(#mode# == "Aggiorna"){
				row = "<td scope='row'> <input type='text' name='txtNome'> </td>
					   <td scope='row'> <input type='text' name='txtDescrizione'> </td>
					   <td scope='row'> <input type='text' name='txtProblemi'> </td>
					   <td scope='row'> <input type='text' name='txtTest'> </td>
					   <td scope='row'> <input type='text' name='txtInstallazione'> </td>";
			}
			return row;
		}


		public void function uploadTicket(form,categoria){
			gestioneDB.uploadTicket(form,#categoria#);
		}		
	</cfscript>
</cfcomponent>