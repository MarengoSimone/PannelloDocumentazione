<cfcomponent>
	<cfscript>
		categDB = createObject("component", "PannelloDocumentazione\managersDB\DB_categorie");
		public any function creaRighe(){
			categorie = categDB.queryCategorie();
			app = " ";
			for(i=1;i<=categorie.recordCount;i++)
			{	
				app &= "<tr> <th scope='row'> <a href='tickets.cfm?categoria=#categorie.nomeCategoria[i]#'> #categorie.nomeCategoria[i]# </a> </th> <th> <input type='radio' name='rdbModifica' value='#categorie.nomeCategoria[i]#'></td> <td><input type='radio' name='rdbElimina' value='#categorie.nomeCategoria[i]#'></td></tr>";
			}
			return app;
		}


		public any function generaPulsanti(){
			return "
				<a href='gestione_categorie.cfm?mode=Aggiungi&categoria=categoria'>  <button class='btn btn-primary'> Aggiungi Categoria</button> </a>";
		}
	</cfscript>
</cfcomponent>