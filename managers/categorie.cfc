<cfcomponent>
	<cfscript>
		categDB = createObject("component", "PannelloDocumentazione\managersDB\DB_categorie");
		public any function creaRighe(){
			categorie = categDB.queryCategorie();
			app = " ";
			for(i=1;i<=categorie.recordCount;i++)
			{	
				app &= "<tr> <th scope='row'> <a href='tickets.cfm?categoria=#categorie.nomeCategoria[i]#'> #categorie.nomeCategoria[i]# </a> </th> </tr>";
			}
			return app;
		}
	</cfscript>
</cfcomponent>