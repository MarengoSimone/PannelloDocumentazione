<cfcomponent>
	<cfscript>
		DBcategorie = createObject("component", "PannelloDocumentazione\managersDB\DB_categorie"); 
		categDB = createObject("component", "PannelloDocumentazione\managersDB\DB_aggiungi_categorie");
		public void function uploadCategoria(form){
			if(isDefined("form") && isDefined("form.BTNSUBMIT") && #form.BTNSUBMIT# == "Inserisci Categoria"){
				categorie = DBcategorie.queryCategorie();
				cont = 0;
				for(i=1;i<=categorie.recordCount;i++)
				{
					if(#categorie.nomeCategoria[i]# == #form.txtCategoria#)
						cont++;
				}
				if(cont==0)
				{
					categDB.uploadCategoria(#form.txtCategoria#);

				}
				else
				{
					//writeOutput("Categoria gia' presente sul DB!");
				}
			}
		}		
	</cfscript>
</cfcomponent>