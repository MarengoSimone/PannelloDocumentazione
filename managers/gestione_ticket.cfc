<cfcomponent>
	<cfscript> 
		gestioneDB = createObject("component", "PannelloDocumentazione\managersDB\DB_gestione_ticket");
		public any function caricaTabella(mode,nome){
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
				q = gestioneDB.getTicket(#nome#);
				row = "<td scope='row'> <input type='text' name='txtNome' value=' #q.nomeTicket# ' readonly> </td>
					   <td scope='row'> <input type='text' name='txtDescrizione' value=' #q.descrizione# '> </td>
					   <td scope='row'> <input type='text' name='txtProblemi' value=' #q.problemi# '> </td>
					   <td scope='row'> <input type='text' name='txtTest' value=' #q.test# '> </td>
					   <td scope='row'> <input type='text' name='txtInstallazione' value=' #q.installazione# '> </td>";
			}
			else if(#mode# == "Elimina")
			{
				q = gestioneDB.getTicket(#nome#);
				row = "<td scope='row'> <input type='text' name='txtNome' value=' #q.nomeTicket# ' readonly> </td>
					   <td scope='row'> <input type='text' name='txtDescrizione' value=' #q.descrizione# 'readonly > </td>
					   <td scope='row'> <input type='text' name='txtProblemi' value=' #q.problemi# ' readonly> </td>
					   <td scope='row'> <input type='text' name='txtTest' value=' #q.test# ' readonly> </td>
					   <td scope='row'> <input type='text' name='txtInstallazione' value=' #q.installazione# ' readonly> </td>";
			}
			return row;
		}

		public void function uploadTicket(form,categoria){
			gestioneDB.uploadTicket(form,#categoria#);
		}

		public void function updateTicket(form,categoria){
			gestioneDB.updateTicket(form,#categoria#);
		}

		public void function deleteTicket(form,nome){
			gestioneDB.deleteTicket(form,nome);
		}					
	</cfscript>
</cfcomponent>