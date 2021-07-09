<cfcomponent>
	<cfscript>
		public any function getTabella(id){
			queryTab = queryNew("tabId, nomeTabella, funzionalita, pagineUtilizzo, descrizione", "Integer, VarChar,VarChar, VarChar, VarChar");
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaTabelle.csv");
			while(!fileIsEOF(fr)){
				riga = fileReadLine(fr);
				rigaArray = listToArray(#riga#, '-', false, false);
				if(rigaArray[1] == #id#)
				{
					queryAddRow(queryTab, {"tabId" = #rigaArray[1]#, "nomeTabella" = "#rigaArray[2]#", "funzionalita" = "#rigaArray[3]#", "pagineUtilizzo" = "#rigaArray[4]#", "descrizione" = "#rigaArray[5]#"});
				}
			}

			return queryTab;
		}

		public any function getTabelle(){
			queryTab = queryNew("nomeTabella, funzionalita, pagineUtilizzo, descrizione", "VarChar,VarChar, VarChar, VarChar");
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaTabelle.csv");
			while(!fileIsEOF(fr)){
				riga = fileReadLine(fr);
				rigaArray = listToArray(#riga#, '-', false, false);
				if(rigaArray[1] != "nomeTabella")
				{
					queryAddRow(queryTab, {"nomeTabella" = "#rigaArray[1]#", "funzionalita" = "#rigaArray[2]#", "pagineUtilizzo" = "#rigaArray[3]#", "descrizione" = "#rigaArray[4]#"});
				}
			}

			return queryTab;
		}

		public any function updateTabella(form,id){
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaTabelle.csv");
				toWrite = "";
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					rigaArray = listToArray(riga, '-', false, false);
					if(rigaArray[1] == "tabId" or rigaArray[1] != "#id#"){
						toWrite &= "#riga#" & chr(10);
					}else{
						toWrite &= "#id#-#form.txtNome#-#form.txtFunzionalita#-#form.txtPagine#-#form.txtDescrizione#-" & chr(10);
					}
				}
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaTabelle.csv", "write");
				fileWrite(fw, toWrite);
				fileClose(fw);	
		}

		public any function uploadTabella(form){
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaTabelle.csv");
			toWrite = "";
			id = 0;
			while(!fileIsEOF(fr)){
				riga = fileReadLine(fr);
				rigaArray = listToArray(#riga#, '-', false, false);
				toWrite &= "#riga#" & chr(10);
				id = rigaArray[1];
			}
			toWrite &= "#id+1#-#form.txtNome#-#form.txtFunzionalita#-#form.txtPagine#-#form.txtDescrizione#-";
			//newVal = replace(toWrite, chr(10), " ");
			fileClose(fr);
			fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaTabelle.csv", "write"); 
			fileWrite(fw,toWrite); 
			fileClose(fw);
		}

		public any function deleteTabella(id){
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaTabelle.csv");
				daScrivere = "";
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					rigaArray = listToArray(riga, '-', false, false);
					if(rigaArray[1] == "tabId" or rigaArray[1] != "#id#"){
						daScrivere &= "#riga#" & chr(10);
					}
				}
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaTabelle.csv", "write");
				fileWrite(fw, daScrivere);
				fileClose(fw);
		}
	</cfscript>
</cfcomponent>