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

		public any function updateTabella(form,id){
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

		public any function uploadTabella(form){
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

		public any function deleteTabella(id){
			queryTab = queryNew("tabId, nomeTabella, funzionalita, pagineUtilizzo, descrizione", "Integer, VarChar,VarChar, VarChar, VarChar");
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaTabelle.csv");
			while(!fileIsEOF(fr)){
				riga = fileReadLine(fr);
				rigaArray = listToArray(#riga#, '-', false, false);
				if(rigaArray[1] != "tabId")
				{
					queryAddRow(queryTab, {"tabId" = "#rigaArray[1]#", "nomeTabella" = "#rigaArray[2]#", "funzionalita" = "#rigaArray[3]#", "pagineUtilizzo" = "#rigaArray[4]#", "descrizione" = "#rigaArray[5]#"});
				}
			}

			row = 0;
			fr = fileOpen("C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\fileCSV\ListaTabelle.csv");
			while(!fileIsEOF(fr)){
				row++;
				riga = fileReadLine(fr);
				rigaArray = listToArray(#riga#, '-', false, false);
				if(rigaArray[1] == #id# && rigaArray[1] != "tabId")
				{
					break;
				}
			}
			queryDeleteRow(queryTab,#row#);
			return queryTab;
		}
	</cfscript>
</cfcomponent>