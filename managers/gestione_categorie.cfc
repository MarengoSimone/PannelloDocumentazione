<cfcomponent>
	<cfscript>
		DBcategorie = createObject("component", "PannelloDocumentazione\managersDB\DB_categorie"); 
		categDB = createObject("component", "PannelloDocumentazione\managersDB\DB_gestione_categorie");
		categCSV = createObject("component", "PannelloDocumentazione\managersCSV\CSV_gestione_categorie");

		public void function uploadCategoria(form){
			categCSV.uploadCategoria(#form.txtCategoria#);
		}	

		public void function updateCategoria(form,categoria){
			categCSV.updateCategoria(form,categoria);
		}	

		public void function deleteCategoria(categoria){
			categCSV.deleteCategoria(categoria);
		}		
	</cfscript>
</cfcomponent>