<cfcomponent>
	<cfscript>
		public any function uploadCategoria(categoria){
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaCategorie.csv");
			toWrite = "";
			while(!fileIsEOF(fr)){
				riga = fileReadLine(fr);
				toWrite &= "#riga#" & chr(10);
			}
			toWrite &= "#categoria#-" & chr(10);
			fileClose(fr);
			fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaCategorie.csv", "write"); 
			fileWrite(fw,toWrite); 
			fileClose(fw);
		}

		public any function updateCategoria(form,categoria){
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaCategorie.csv");
				toWrite = "";
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					rigaArray = listToArray(riga, '-', false, false);
					if(rigaArray[1] == "tabId" or rigaArray[1] != "#categoria#"){
						toWrite &= "#riga#" & chr(10);
					}else{
						toWrite &= "#form.txtCategoria#-" & chr(10);
					}
				}
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaCategorie.csv", "write");
				fileWrite(fw, toWrite);
				fileClose(fw);	
		}

		public any function deleteCategoria(categoria){
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaCategorie.csv");
				daScrivere = "";
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					rigaArray = listToArray(riga, '-', false, false);
					if(rigaArray[1] == "nomeCategoria" or rigaArray[1] != "#categoria#"){
						daScrivere &= "#riga#" & chr(10);
					}
				}
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaCategorie.csv", "write");
				fileWrite(fw, daScrivere);
				fileClose(fw);
		}
	</cfscript>
</cfcomponent>