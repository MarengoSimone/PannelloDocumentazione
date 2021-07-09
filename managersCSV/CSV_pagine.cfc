<cfcomponent>
	<cfscript>
			public any function getAllPagine(){
				queryPagine = queryNew("nomePagina, loc, funzioni, tabelle, pagID", "varchar, varchar, varchar, varchar, Integer");
				fo = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\pagine.csv");
				while(!fileIsEOF(fo)){
					riga = fileReadLine(fo);
					rigaArray = listToArray(riga, '-', false, false);

					if(rigaArray[1] != "nomePagina"){
						queryAddRow(queryPagine, {"nomePagina" = rigaArray[1], "loc" = rigaArray[2], "funzioni" = rigaArray[3], "tabelle" = rigaArray[4], "pagID" = rigaArray[5]});
					}
				}
				return queryPagine;
			}

			public any function aggiungiFormCSV(form){
				fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\pagine.csv");
				daScrivere = "";
				local.lunghezza = -1;
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					daScrivere &= "#riga#" & chr(10);
					local.lunghezza++;
				}

				if(form.txtNomePagina == "")
					local.nomePagina = "/";
				else
					local.nomePagina = form.txtNomePagina;

				if(form.txtLocazione == "")
					local.locazione = "/";
				else
					local.locazione = form.txtLocazione;

				if(form.txtFunzioni == "")
					local.funzioni = "/";
				else
					local.funzioni = form.txtFunzioni;

				if(form.txtTabelle == "")
					local.tabelle = "/";
				else
					local.tabelle = form.txtTabelle;

				local.pagID = local.lunghezza + 1;


				daScrivere &= "#local.nomePagina#-#local.locazione#-#local.funzioni#-#local.tabelle#-#local.pagID#";
				writeDump(daScrivere);
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\pagine.csv", "write");
				fileWrite(fw, daScrivere);
				fileClose(fw);
			}

			public any function modificaFormCSV(form){
				fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\pagine.csv");
				daScrivere = "";
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					rigaArray = listToArray(riga, '-', false, false);
					if(rigaArray[1] == "nomePagina" or rigaArray[5] != "#form.txtPagID#"){
						daScrivere &= "#riga#" & chr(10);
					}else{

					if(form.txtNomePagina == "")
						local.nomePagina = "/";
					else
						local.nomePagina = form.txtNomePagina;

					if(form.txtLocazione == "")
						local.locazione = "/";
					else
						local.locazione = form.txtLocazione;

					if(form.txtFunzioni == "")
						local.funzioni = "/";
					else
						local.funzioni = form.txtFunzioni;

					if(form.txtTabelle == "")
						local.tabelle = "/";
					else
						local.tabelle = form.txtTabelle;

					local.pagID = form.txtPagID;

						daScrivere &= "#local.nomePagina#-#local.locazione#-#local.funzioni#-#local.tabelle#-#local.pagID#" & chr(10);
					}
				}
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\pagine.csv", "write");
				fileWrite(fw, daScrivere);
				fileClose(fw);				
			}

			public any function eliminaFormCSV(form){
				fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\pagine.csv");
				daScrivere = "";
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					rigaArray = listToArray(riga, '-', false, false);
					if(rigaArray[1] == "nomePagina" or rigaArray[5] != "#form.txtPagID#"){
						daScrivere &= "#riga#" & chr(10);
					}
				}
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\pagine.csv", "write");
				fileWrite(fw, daScrivere);
				fileClose(fw);	
			}

	</cfscript>
</cfcomponent>