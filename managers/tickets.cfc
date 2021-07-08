<cfcomponent>
	<cfscript> 
		public any function creaRighe(categoria){
			ticketDB = createObject("component", "PannelloDocumentazione\managersDB\DB_tickets");
			categorieDB = createObject("component", "PannelloDocumentazione\managersDB\DB_categorie");
			ticketCSV = createObject("component", "PannelloDocumentazione\managersCSV\CSV_tickets");
			categorieCSV = createObject("component", "PannelloDocumentazione\managersCSV\CSV_categorie");
			
			if(categoria!="")
			{
				tickets = ticketDB.queryTickets(#categoria#);
				app = " ";
				for(i=1;i<=tickets.recordCount;i++)
				{	
					app &= "<tr> <input name='index' class='categoria' type='hidden' value='#categoria#' id='#tickets.idTicket[i]#'> </input> <td>#tickets.nomeTicket[i]#</td> <td><textarea readonly>#tickets.descrizione[i]# </textarea> </td> <td> <textarea readonly> #tickets.problemi[i]# </textarea> </td> <td> <textarea readonly>#tickets.test[i]# </textarea> </td> <td> <textarea readonly> #tickets.installazione[i]# </textarea> </td> <td><input type='radio' name='rdbModifica' value='#tickets.idTicket[i]#'></td> <td><input type='radio' name='rdbElimina' value=#tickets.idTicket[i]#></td> </tr>";
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
				<a href='gestione_ticket.cfm?mode=Aggiungi&categoria=#categoria#&nome=&id=0'>  <button class='btn btn-primary'> Aggiungi Ticket</button> </a>";
		}
	</cfscript>
</cfcomponent>