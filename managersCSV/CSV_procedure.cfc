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

			public any function aggiungiFormCSV(form){
				fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\procedure.csv");
				daScrivere = "";
				local.lunghezza = -1;
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					daScrivere &= "#riga#" & chr(10);
					local.lunghezza++;
				}

				if(form.txtNomeProcedura == "")
					local.nomeProcedura = "/";
				else
					local.nomeProcedura = form.txtNomeProcedura;

				if(form.txtDescrizione == "")
					local.descrizione = "/";
				else
					local.descrizione = form.txtDescrizione;

				if(form.txtNote == "")
					local.note = "/";
				else
					local.note = form.txtNote;

				local.procedureID = local.lunghezza + 1;


				daScrivere &= "#local.nomeProcedura#-#local.descrizione#-#local.note#-#local.procedureID#" & chr(10);
				writeDump(daScrivere);
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\procedure.csv", "write");
				fileWrite(fw, daScrivere);
				fileClose(fw);
			}

			public any function modificaFormCSV(form){
				fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\procedure.csv");
				daScrivere = "";
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					rigaArray = listToArray(riga, '-', false, false);
					if(rigaArray[1] == "nomeProcedura" or rigaArray[4] != "#form.txtProcedureID#"){
						daScrivere &= "#riga#" & chr(10);
					}else{

					if(form.txtNomeProcedura == "")
						local.nomeProcedura = "/";
					else
						local.nomeProcedura = form.txtNomeProcedura;

					if(form.txtDescrizione == "")
						local.descrizione = "/";
					else
						local.descrizione = form.txtDescrizione;

					if(form.txtNote == "")
						local.note = "/";
					else
						local.note = form.txtNote;

					daScrivere &= "#local.nomeProcedura#-#local.descrizione#-#local.note#-#form.txtProcedureID#" & chr(10);
					}
				}
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\procedure.csv", "write");
				fileWrite(fw, daScrivere);
				fileClose(fw);				
			}

			public any function eliminaFormCSV(form){
				fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\procedure.csv");
				daScrivere = "";
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					rigaArray = listToArray(riga, '-', false, false);
					if(rigaArray[1] == "nomeProcedura" or rigaArray[4] != "#form.txtProcedureID#"){
						daScrivere &= "#riga#" & chr(10);
					}
				}
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\procedure.csv", "write");
				fileWrite(fw, daScrivere);
				fileClose(fw);	
			}
	</cfscript>
</cfcomponent>