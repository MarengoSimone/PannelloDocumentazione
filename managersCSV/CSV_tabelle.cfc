<cfcomponent>
	<cfscript>
		public any function queryTabelle(){
			queryPeriodo = queryNew("tabId, nomeTabella, funzionalita, pagineUtilizzo, descrizione", "Integer, VarChar,VarChar, VarChar, VarChar");
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaTabelle.csv");
			while(!fileIsEOF(fr)){
				riga = fileReadLine(fr);
				rigaArray = listToArray(#riga#, '-', false, false);
				if(rigaArray[1] != "tabId")
				{
					queryAddRow(queryPeriodo, {"tabId" = "#rigaArray[1]#", "nomeTabella" = "#rigaArray[2]#", "funzionalita" = "#rigaArray[3]#", "pagineUtilizzo" = "#rigaArray[4]#", "descrizione" = "#rigaArray[5]#"});
				}
			}
			return queryPeriodo;
		}
	</cfscript>
</cfcomponent>