<cfcomponent>
	<cfscript>
		public any function uploadTicket(form,categoria){
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\Tickets.csv");
			toWrite = "";
			while(!fileIsEOF(fr)){
				riga = fileReadLine(fr);
				toWrite &= "#riga#" & chr(10);
			}
			toWrite &= "#form.txtNome#-#form.txtDescrizione#-#form.txtProblemi#-#form.txtTest#-#form.txtInstallazione#-#categoria#-" & chr(10);
			fileClose(fr);
			fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\Tickets.csv", "write"); 
			fileWrite(fw,toWrite); 
			fileClose(fw);
		}

		public any function getTicket(nome){
			queryTickets = queryNew("nomeTicket,descrizione,problemi,test,installazione,categoria", "VarChar,VarChar,VarChar,VarChar,VarChar,VarChar");
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\Tickets.csv");
			while(!fileIsEOF(fr)){
				riga = fileReadLine(fr);
				rigaArray = listToArray(#riga#, '-', false, false);
				if(rigaArray[1] != "nomeCategoria" && rigaArray[1] == #nome#)
				{
					queryAddRow(queryTickets, {"nomeTicket" = "#rigaArray[1]#","descrizione" = "#rigaArray[2]#","problemi" = "#rigaArray[3]#","test" = "#rigaArray[4]#","installazione" = "#rigaArray[5]#","categoria" = "#rigaArray[6]#"});
				}
			}
			return queryTickets;
		}

		public any function getTickets(categoria){
			queryTickets = queryNew("nomeTicket,descrizione,problemi,test,installazione,categoria", "VarChar,VarChar,VarChar,VarChar,VarChar,VarChar");
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\Tickets.csv");
			while(!fileIsEOF(fr)){
				riga = fileReadLine(fr);
				rigaArray = listToArray(#riga#, '-', false, false);
				if(rigaArray[1] != "nomeCategoria" && rigaArray[6] == #categoria#)
				{
					queryAddRow(queryTickets, {"nomeTicket" = "#rigaArray[1]#","descrizione" = "#rigaArray[2]#","problemi" = "#rigaArray[3]#","test" = "#rigaArray[4]#","installazione" = "#rigaArray[5]#","categoria" = "#rigaArray[6]#"});
				}
			}
			return queryTickets;
		}

		public any function updateTicket(form,categoria){
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\Tickets.csv");
				toWrite = "";
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					rigaArray = listToArray(riga, '-', false, false);
					if(compare(Trim(rigaArray[1]),Trim(form.txtNome)) eq 0){
						writeDump("ok","debugArray.html","html");
						toWrite &= "#form.txtNome#-#form.txtDescrizione#-#form.txtProblemi#-#form.txtTest#-#form.txtInstallazione#-#categoria#-" & chr(10);
					}
					else
					{
						toWrite &= "#riga#" & chr(10);
					}
				}
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\Tickets.csv", "write");
				fileWrite(fw, toWrite);
				fileClose(fw);
		}

		public any function deleteTicket(form,nome){
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\Tickets.csv");
				daScrivere = "";
				while(!fileIsEOF(fr)){
					riga = fileReadLine(fr);
					rigaArray = listToArray(riga, '-', false, false);
					if(Trim(rigaArray[1]) == "nomeTicket" or Trim(rigaArray[1]) != nome){
						daScrivere &= "#riga#" & chr(10);
					}
				}
				fileClose(fr);
				fw = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\Tickets.csv", "write");
				fileWrite(fw, daScrivere);
				fileClose(fw);
		}
	</cfscript>
</cfcomponent>