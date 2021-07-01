<cfcomponent>
	<cfscript>
		DBcategorie = createObject("component", "PannelloDocumentazione\managersDB\DB_categorie"); 
		categDB = createObject("component", "PannelloDocumentazione\managersDB\DB_gestione_categorie");
		public void function uploadCategoria(form){
			categDB.uploadCategoria(#form.txtCategoria#);
		}	

		public void function updateCategoria(form,categoria){
			categDB.updateCategoria(form,categoria);
		}	

		public void function deleteCategoria(categoria){
			categDB.deleteCategoria(categoria);
		}		
	</cfscript>
</cfcomponent>