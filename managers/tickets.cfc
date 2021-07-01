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
					app &= "<tr> <input class='categoria' type='hidden'value='#categoria#'> </input> <td>#tickets.nomeTicket[i]#</td> <td>#tickets.descrizione[i]#</td> <td>#tickets.problemi[i]#</td> <td>#tickets.test[i]#</td> <td>#tickets.installazione[i]#</td> <td><input type='radio' name='rdbModifica' value='#tickets.nomeTicket[i]#'></td> <td><input type='radio' name='rdbElimina' value='#tickets.nomeTicket[i]#'></td> </tr>";
				}
				return app;
			}
			else
			{
				
				cflocation( url="categorie.cfm");
			}
		}

		public any function generaPulsanti(categoria){
			return "<a href='categorie.cfm'>  <button class='btn btn-warning'> Indietro</button> </a>
				<a href='gestione_ticket.cfm?mode=Aggiungi&categoria=#categoria#&nome='no''>  <button class='btn btn-primary'> Aggiungi Ticket</button> </a>";
		}
	</cfscript>
</cfcomponent>