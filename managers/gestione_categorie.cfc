<cfcomponent>
	<cfscript>
		DBcategorie = createObject("component", "PannelloDocumentazione\managersDB\DB_categorie"); 
		categDB = createObject("component", "PannelloDocumentazione\managersDB\DB_gestione_categorie");
		categCSV = createObject("component", "PannelloDocumentazione\managersCSV\CSV_gestione_categorie");

		public void function uploadCategoria(form){
			categDB.uploadCategoria(#form.txtCategoria#);
		}	

		public void function updateCategoria(form,id){
			categDB.updateCategoria(form,id);
		}	

		public void function deleteCategoria(id){
			categDB.deleteCategoria(id);
		}		
	</cfscript>
</cfcomponent>