<cfcomponent>
	<cfscript>
			public any function getAllAmbienti(){
				queryAmbienti = queryNew("ambientiID, ambiente, portale, administrator, utils, proced, versione", "integer, varchar, varchar, varchar, varchar, varchar, varchar");
				fo = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ambienti.csv");
				while(!fileIsEOF(fo)){
					riga = fileReadLine(fo);
					rigaArray = listToArray(riga, '-', false, false);

					if(rigaArray[1] != "ambientiID"){
						queryAddRow(queryAmbienti, {"ambientiID" = rigaArray[1], "ambiente" = rigaArray[2], "portale" = rigaArray[3], "administrator" = rigaArray[4], "utils" = rigaArray[5], "proced" = rigaArray[6], "versione" = rigaArray[7]});
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

				if(form.txtPortale == "")
					local.portale = "/";
				else
					local.portale = form.txtPortale;

				if(form.txtAdministrator == "")
					local.administrator = "/";
				else
					local.administrator = form.txtAdministrator;

				if(form.txtUtils == "")
					local.utils = "/";
				else
					local.utils = form.txtUtils;

				if(form.txtProcedura == "")
					local.procedura = "/";
				else
					local.procedura = form.txtProcedura;

				if(form.txtVersione == "")
					local.versione = "/";
				else
					local.versione = form.txtVersione;


				daScrivere &= "#form.txtAmbiente#-#local.portale#-#local.administrator#-#local.utils#-#local.procedura#-#local.versione#";
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