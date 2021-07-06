<cfcomponent>
	<cfscript>
		public any function queryCategorie(){
			queryCategorie = queryNew("nomeCategoria", "VarChar");
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaCategorie.csv");
			while(!fileIsEOF(fr)){
				riga = fileReadLine(fr);
				rigaArray = listToArray(#riga#, '-', false, false);
				if(rigaArray[1] != "nomeCategoria")
				{
					queryAddRow(queryCategorie, {"nomeCategoria" = "#rigaArray[1]#"});
				}
			}
			return queryCategorie;
		}
	</cfscript>
</cfcomponent>