<cfcomponent>
	<cfscript> 
		gestioneDB = createObject("component", "PannelloDocumentazione\managersDB\DB_gestione_tabelle");
		gestioneCSV = createObject("component", "PannelloDocumentazione\managersCSV\CSV_gestione_tabelle");
		public any function caricaTabella(mode,id){
			row = "";
			if(#mode# == "Aggiungi")
			{
				row = "<td scope='row'> <input type='text' name='txtNome'> </td>
					   <td scope='row'> <textarea name='txtFunzionalita' cols='30'> </textarea> </td>
					   <td scope='row'> <textarea name='txtPagine' cols='30'> </textarea> </td>
					   <td scope='row'> <textarea name='txtDescrizione' cols='30'> </textarea> </td>";
			}
			else if(#mode# == "Aggiorna"){
				q = gestioneDB.getTabella(#id#);
				row = "<td scope='row'> <textarea name='txtNome'> #q.nomeTabella# </textarea> </td>
					   <td scope='row'> <textarea name='txtFunzionalita'> #q.funzionalita# </textarea> </td>
					   <td scope='row'> <textarea name='txtPagine'> #q.pagineUtilizzo# </textarea> </td>
					   <td scope='row'> <textarea name='txtDescrizione'> #q.descrizione# </textarea> </td>";
			}
			else if(#mode# == "Elimina")
			{
				q = gestioneDB.getTabella(#id#);
				row = "<td scope='row'> <input type='text' name='txtNome' value=' #q.nomeTabella# ' readonly> </td>
					   <td scope='row'> <textarea name='txtFunzionalita' readonly> #q.funzionalita#  </textarea> </td>
					   <td scope='row'> <textarea name='txtPagine' readonly> #q.pagineUtilizzo# </textarea> </td>
					   <td scope='row'> <textarea name='txtDescrizione' readonly> #q.descrizione# </textarea> </td>";
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

		public void function exportTabella(){
			tabelle = gestioneDB.queryTabelle();
			app = "nomeTabella-funzionalita-pagineUtilizzo-descrizione-" & chr(10);

			for(i=1;i<=tabelle.recordCount;i++)
			{
				app &= "#tabelle.nomeTabella[i]#-#tabelle.funzionalita[i]#-#tabelle.pagineUtilizzo[i]#-#tabelle.descrizione[i]#-" & chr(10);
			}
			fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaTabelle.csv", "write");
			fileWrite(fw, app);
			fileClose(fw);	
			cflocation( url="tabelle.cfm" );
		}					
	</cfscript>
</cfcomponent>