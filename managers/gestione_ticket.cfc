<cfcomponent>
	<cfscript> 
		gestioneDB = createObject("component", "PannelloDocumentazione\managersDB\DB_gestione_ticket");
		gestioneCSV = createObject("component", "PannelloDocumentazione\managersCSV\CSV_gestione_ticket");

		public any function caricaTabella(mode,id){
			row = "";
			if(#mode# == "Aggiungi")
			{
				row = "<td scope='row'> <input type='text' name='txtNome'> </td>
					   <td scope='row'> <textarea name='txtDescrizione' cols='40'> </textarea> </td>
					   <td scope='row'> <textarea name='txtProblemi' cols='20'> </textarea> </td>
					   <td scope='row'> <textarea name='txtTest' cols='40'> </textarea> </td>
					   <td scope='row'> <textarea name='txtInstallazione' cols='40'> </textarea> </td>";
			}
			else if(#mode# == "Aggiorna"){
				q = gestioneDB.getTicket(#id#);
				row = "<td scope='row'> <textarea name='txtNome'> #q.nomeTicket# </textarea>  </td>
					   <td scope='row'> <textarea name='txtDescrizione'> #q.descrizione# </textarea> </td>
					   <td scope='row'> <textarea name='txtProblemi'> #q.problemi# </textarea> </td>
					   <td scope='row'> <textarea name='txtTest'> #q.test# </textarea> </td>
					   <td scope='row'> <textarea name='txtInstallazione'> #q.installazione# </textarea> </td>";
			}
			else if(#mode# == "Elimina")
			{
				q = gestioneDB.getTicket(#id#);
				row = "<td scope='row'> <input type='text' name='txtNome' value=' #q.nomeTicket# ' readonly> </td>
					   <td scope='row'> <textarea name='txtDescrizione' readonly> #q.descrizione# </textarea> </td>
					   <td scope='row'> <textarea name='txtProblemi' readonly> #q.problemi# </textarea> </td>
					   <td scope='row'> <textarea name='txtTest' readonly > #q.test# </textarea> </td>
					   <td scope='row'> <textarea name='txtInstallazione' readonly> #q.installazione# </textarea> </td>";
			}
			return row;
		}

		public void function uploadTicket(form,categoria){
			gestioneDB.uploadTicket(form,#categoria#);
		}

		public void function updateTicket(form,id){
			gestioneDB.updateTicket(form,#id#);
		}

		public void function deleteTicket(form,id){
			gestioneDB.deleteTicket(form,id);
		}					
	</cfscript>
</cfcomponent>