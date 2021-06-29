<cfcomponent>
	<cfscript> 
		public any function creaRighe(categoria){
			ticketDB = createObject("component", "PannelloDocumentazione\managersDB\DB_tickets");
			categorieDB = createObject("component", "PannelloDocumentazione\managersDB\DB_categorie");
			categorie = categorieDB.queryCategorie();

			cont = 0;
			for(i=1;i<=categorie.recordCount;i++)
			{
				if(#categorie.nomeCategoria[i]# == #categoria#)
					cont++;
			}
			if(cont > 0 && categoria!="")
			{
				tickets = ticketDB.queryTickets(#categoria#);
				app = " ";
				for(i=1;i<=tickets.recordCount;i++)
				{	
					app &= "<tr> <td>#tickets.nomeTicket[i]#</td> <td>#tickets.descrizione[i]#</td> <td>#tickets.problemi[i]#</td> <td>#tickets.test[i]#</td> <td>#tickets.installazione[i]#</td> </tr>";
				}
				return app;
			}
			else
			{
				
				cflocation( url="categorie.cfm");
			}
		}
	</cfscript>
</cfcomponent>