<cfcomponent>
	<cfscript>
		public any function queryTickets(categoria){
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
	</cfscript>
</cfcomponent>