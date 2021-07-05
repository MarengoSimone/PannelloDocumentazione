<cfcomponent>
	<cfscript>
		tabDB = createObject("component", "PannelloDocumentazione\managersDB\DB_tabelle");
		tabCSV = createObject("component", "PannelloDocumentazione\managersCSV\CSV_tabelle");
		public any function creaRighe(){
			tabelle = tabCSV.queryTabelle();
			app = " ";
			for(i=1;i<=tabelle.recordCount;i++)
			{	
				app &= "<tr> <input class='id' type='hidden' value='#tabelle.tabId[i]#'> <th scope='row'>#tabelle.nomeTabella[i]#</th> <th scope='row'> <textarea readonly> #tabelle.funzionalita[i]# </textarea> </th> <th scope='row'> <textarea readonly> #tabelle.pagineUtilizzo[i]# </textarea> </th> <th scope='row'> <textarea readonly> #tabelle.descrizione[i]# </textarea> </th>  <th> <input type='radio' name='rdbModifica' value='#tabelle.tabId[i]#'></td> <td><input type='radio' name='rdbElimina' value='#tabelle.tabId[i]#'></td>  </tr>";
			}
			return app;
		}

		public any function generaPulsanti(){
			return "
				<a href='gestione_tabelle.cfm?mode=Aggiungi&id=0'>  <button class='btn btn-primary'> Aggiungi Tabella</button> </a>";
		}
	</cfscript>
</cfcomponent>