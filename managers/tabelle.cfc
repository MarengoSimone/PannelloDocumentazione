<cfcomponent>
	<cfscript>
		tabDB = createObject("component", "PannelloDocumentazione\managersDB\DB_tabelle");
		public any function creaRighe(){
			tabelle = tabDB.queryTabelle();
			app = " ";
			for(i=1;i<=tabelle.recordCount;i++)
			{	
				app &= "<tr> <th scope='row'>#tabelle.nomeTabella[i]#</th> <th scope='row'>#tabelle.funzionalita[i]#</th> <th scope='row'>#tabelle.pagineUtilizzo[i]#</th> <th scope='row'>#tabelle.descrizione[i]#</th>  <th> <input type='radio' name='rdbModifica' value='#tabelle.tabId[i]#'></td> <td><input type='radio' name='rdbElimina' value='#tabelle.tabId[i]#'></td>  </tr>";
			}
			return app;
		}
	</cfscript>
</cfcomponent>