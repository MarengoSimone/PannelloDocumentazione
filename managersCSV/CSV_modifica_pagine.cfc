<cfcomponent>
	<cfscript>
			public any function getAllPaginePagID(pagid){
				queryPagine = queryNew("nomePagina, loc, funzioni, tabelle, pagID", "varchar, varchar, varchar, varchar, Integer");
				fo = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\pagine.csv");
				while(!fileIsEOF(fo)){
					riga = fileReadLine(fo);
					rigaArray = listToArray(riga, '-', false, false);
					if(rigaArray[1] != "nomePagina" and rigaArray[5] == "#pagid#"){
						queryAddRow(queryPagine, {"nomePagina" = rigaArray[1], "loc" = rigaArray[2], "funzioni" = rigaArray[3], "tabelle" = rigaArray[4], "pagID" = rigaArray[5]});
					}
				}

				return queryPagine;
			}

			public void function insert(allPagine){
				daScrivere = "nomePagina-loc-funzioni-tabelle-pagID" & chr(10);

				for(i = 1; i <= allPagine.recordCount; i++){
					daScrivere &= "#allPagine.nomePagina[i]#-#allPagine.loc[i]#-#allPagine.funzioni[i]#-#allPagine.tabelle[i]#-#allPagine.pagID[i]#" & chr(10);
				}
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\pagine.csv", "write");
				fileWriteLine(fw, daScrivere);
				fileClose(fw);
			}
	</cfscript>
</cfcomponent>