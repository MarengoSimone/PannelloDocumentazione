<cfcomponent>
	<cfscript>

			public any function getAllProcedure(){
				queryProcedure = queryNew("nomeProcedura, descrizione, note, procedureID", "varchar, varchar, varchar, Integer");
				fo = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\procedure.csv");
				while(!fileIsEOF(fo)){
					riga = fileReadLine(fo);
					rigaArray = listToArray(riga, '-', false, false);

					if(rigaArray[1] != "nomeProcedura"){
						queryAddRow(queryProcedure, {"nomeProcedura" = rigaArray[1], "descrizione" = rigaArray[2], "note" = rigaArray[3], "procedureID" = rigaArray[4]});
					}
				}
				return queryProcedure;
			}
			
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

			public void function inport(allProcedure){
				daScrivere = "nomeProcedura-descrizione-note-procedureID" & chr(10);

				for(i = 1; i <= allProcedure.recordCount; i++){
					daScrivere &= "#allProcedure.nomeProcedura[i]#-#allProcedure.descrizione[i]#-#allProcedure.note[i]#-#allProcedure.procedureID[i]#" & chr(10);
				}
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\procedure.csv", "write");
				fileWrite(fw, daScrivere);
				fileClose(fw);
			}
	</cfscript>
</cfcomponent>