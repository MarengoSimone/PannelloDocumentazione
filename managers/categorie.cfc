<cfcomponent>
	<cfscript>
		categDB = createObject("component", "PannelloDocumentazione\managersDB\DB_categorie");
		categCSV = createObject("component", "PannelloDocumentazione\managersCSV\CSV_categorie");

		public any function creaRighe(){
			categorie = categDB.queryCategorie();
			app = " ";
			for(i=1;i<=categorie.recordCount;i++)
			{	
				app &= "<tr> <th scope='row'> <a href='tickets.cfm?categoria=#categorie.nomeCategoria[i]#'> #categorie.nomeCategoria[i]# </a> </th> <th> <input type='radio' name='rdbModifica' value='#categorie.nomeCategoria[i]#' id='#categorie.idCategoria[i]#'></td> <td><input type='radio' name='rdbElimina' value='#categorie.nomeCategoria[i]#' id='#categorie.idCategoria[i]#'></td></tr>";
			}
			return app;
		}


		public any function generaPulsanti(){
			return "
				<a href='index.cfm'> <button class='btn btn-warning'> Indietro</button> </a>
				<a href='gestione_categorie.cfm?mode=Aggiungi&categoria=categoria&id=0'>  <button class='btn btn-primary'> Aggiungi Categoria</button> </a>";
		}
	</cfscript>
</cfcomponent>