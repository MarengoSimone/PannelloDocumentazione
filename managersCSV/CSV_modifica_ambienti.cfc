<cfcomponent>
	<cfscript>
			public any function getAllAmbientiAmbiente(ambiente){
				queryAmbienti = queryNew("ambiente, portale, administrator, utils, proced, versione", "varchar, varchar, varchar, varchar, varchar, varchar");
				fo = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ambienti.csv");
				while(!fileIsEOF(fo)){
					riga = fileReadLine(fo);
					rigaArray = listToArray(riga, '-', false, false);
					if(rigaArray[1] != "ambiente" and rigaArray[1] == "#ambiente#"){
						queryAddRow(queryAmbienti, {"ambiente" = rigaArray[1], "portale" = rigaArray[2], "administrator" = rigaArray[3], "utils" = rigaArray[4], "proced" = rigaArray[5], "versione" = rigaArray[6]});
					}
				}

				return queryAmbienti;
			}

			public void function inport(allAmbienti){
				daScrivere = "ambientiID-ambiente-portale-administrator-utils-proced-versione" & chr(10);

				for(i = 1; i <= allAmbienti.recordCount; i++){
					daScrivere &= "#allAmbienti.ambientiID[i]#-#allAmbienti.ambiente[i]#-#allAmbienti.portale[i]#-#allAmbienti.administrator[i]#-#allAmbienti.utils[i]#-#allAmbienti.proced[i]#-#allAmbienti.versione[i]#" & chr(10);
				}
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ambienti.csv", "write");
				fileWriteLine(fw, daScrivere);
				fileClose(fw);
			}
	</cfscript>
</cfcomponent>