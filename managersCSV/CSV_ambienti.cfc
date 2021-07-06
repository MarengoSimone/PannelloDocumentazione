<cfcomponent>
	<cfscript>
			public any function getAllAmbienti(){
				queryAmbienti = queryNew("ambiente, portale, administrator, utils, proced, versione", "varchar, varchar, varchar, varchar, varchar, varchar");
				fo = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ambienti.csv");
				while(!fileIsEOF(fo)){
					riga = fileReadLine(fo);
					rigaArray = listToArray(riga, '-', false, false);
					if(rigaArray[1] != "ambiente"){
						queryAddRow(queryAmbienti, {"ambiente" = rigaArray[1], "portale" = rigaArray[2], "administrator" = rigaArray[3], "utils" = rigaArray[4], "proced" = rigaArray[5], "versione" = rigaArray[6]});
					}
				}

				return queryAmbienti;
			}

			public any function aggiungiFormCSV(form){
				fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ambienti.csv");
				daScrivere = "";
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					daScrivere &= "#riga#" & chr(10);
					}
				daScrivere &= "#form.txtAmbiente#-#form.txtPortale#-#form.txtAdministrator#-#form.txtUtils#-#form.txtProcedura#-#form.txtVersione#";
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ambienti.csv", "write");
				fileWrite(fw, daScrivere);
				fileClose(fw);
			}

			public any function modificaFormCSV(form){
				fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ambienti.csv");
				daScrivere = "";
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					rigaArray = listToArray(riga, '-', false, false);
					if(rigaArray[1] == "ambiente" or rigaArray[1] != "#form.txtAmbiente#"){
						daScrivere &= "#riga#" & chr(10);
					}else{
						daScrivere &= "#form.txtAmbiente#-#form.txtPortale#-#form.txtAdministrator#-#form.txtUtils#-#form.txtProcedura#-#form.txtVersione#" & chr(10);
					}
				}
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ambienti.csv", "write");
				fileWrite(fw, daScrivere);
				fileClose(fw);				
			}

			public any function eliminaFormCSV(form){
				fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ambienti.csv");
				daScrivere = "";
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					rigaArray = listToArray(riga, '-', false, false);
					if(rigaArray[1] == "ambiente" or rigaArray[1] != "#form.txtAmbiente#"){
						daScrivere &= "#riga#" & chr(10);
					}
				}
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ambienti.csv", "write");
				fileWrite(fw, daScrivere);
				fileClose(fw);	
			}
	</cfscript>
</cfcomponent>