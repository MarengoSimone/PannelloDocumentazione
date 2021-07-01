<cfcomponent>
	<cfscript> 
		gestioneDB = createObject("component", "PannelloDocumentazione\managersDB\DB_gestione_tabelle");
		public any function caricaTabella(mode,id){
			row = "";
			if(#mode# == "Aggiungi")
			{
				row = "<td scope='row'> <input type='text' name='txtNome'> </td>
					   <td scope='row'> <input type='text' name='txtFunzionalita'> </td>
					   <td scope='row'> <input type='text' name='txtPagine'> </td>
					   <td scope='row'> <input type='text' name='txtDescrizione'> </td>";
			}
			else if(#mode# == "Aggiorna"){
				q = gestioneDB.getTabella(#id#);
				row = "<td scope='row'> <input type='text' name='txtNome' value=' #q.nomeTabella# ' readonly> </td>
					   <td scope='row'> <input type='text' name='txtFunzionalita' value=' #q.funzionalita# '> </td>
					   <td scope='row'> <input type='text' name='txtPagine' value=' #q.pagineUtilizzo# '> </td>
					   <td scope='row'> <input type='text' name='txtDescrizione' value=' #q.descrizione# '> </td>";
			}
			else if(#mode# == "Elimina")
			{
				q = gestioneDB.getTabella(#id#);
				row = "<td scope='row'> <input type='text' name='txtNome' value=' #q.nomeTabella# ' readonly> </td>
					   <td scope='row'> <input type='text' name='txtFunzionalita' value=' #q.funzionalita# 'readonly > </td>
					   <td scope='row'> <input type='text' name='txtPagine' value=' #q.pagineUtilizzo# ' readonly> </td>
					   <td scope='row'> <input type='text' name='txtDescrizione' value=' #q.descrizione# ' readonly> </td>";
			}
			return row;
		}

		public void function uploadTabella(form){
			gestioneDB.uploadTabella(form);
		}

		public void function updateTabella(form,id){
			gestioneDB.updateTabella(form,id);
		}

		public void function deleteTabella(id){
			gestioneDB.deleteTabella(id);
		}					
	</cfscript>
</cfcomponent>