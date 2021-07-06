<cfcomponent>
	<cfscript>
			public any function getAllProcedureProcedureID(procedureid){
				queryProcedure = queryNew("nomeProcedura, descrizione, note, procedureID", "varchar, varchar, varchar, Integer");
				fo = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\procedure.csv");
				while(!fileIsEOF(fo)){
					riga = fileReadLine(fo);
					rigaArray = listToArray(riga, '-', false, false);

					if(rigaArray[1] != "nomeProcedura" and rigaArray[4] == procedureid){
						queryAddRow(queryProcedure, {"nomeProcedura" = rigaArray[1], "descrizione" = rigaArray[2], "note" = rigaArray[3], "procedureID" = rigaArray[4]});
					}
				}
				return queryProcedure;
			}
	</cfscript>
</cfcomponent>