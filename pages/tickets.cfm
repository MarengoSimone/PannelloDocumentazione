<cfscript>
	ticket = createObject("component", "PannelloDocumentazione\managers\tickets");
	gestioneTicket = createObject("component", "PannelloDocumentazione\managers\gestione_ticket");
	navigation = createObject('component', 'PannelloDocumentazione/navigation/navigazione');

	if(isDefined("form") && isDefined("form.BTNSUBMIT") && (#form.BTNSUBMIT# == "Aggiungi Ticket"))
	{
		gestioneTicket.uploadTicket(form,url.categoria);
	}
	else if (isDefined("form") && isDefined("form.BTNSUBMIT") && (#form.BTNSUBMIT# == "Aggiorna Ticket"))
	{
		gestioneTicket.updateTicket(form,url.categoria);
	}
	else if (isDefined("form") && isDefined("form.BTNSUBMIT") && (#form.BTNSUBMIT# == "Elimina Ticket"))
	{
		gestioneTicket.deleteTicket(form,#url.nome#);
	}

	if(!isDefined("url.categoria"))
	{
		cflocation( url="categorie.cfm" );
	}

</cfscript>

<!DOCTYPE html>
<html>
	<head lang="it">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Elenco Ticket</title>
		<!-- BOOTSTRAP -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<!-- SPECIFICI -->
		<link rel="stylesheet" href="..\style\index.css">
		<script src="..\script\tickets.js"></script>
		<link rel="icon" href="..\assets\img\icon.png" type="image/icon type">
	</head>
	<body>
		<cfscript>
			writeOutput(navigation.creaNavigazione());
		</cfscript>
		
			<h1 class='text-center' style="margin:20px"> <cfoutput> Ticket #url.categoria# disponibili: </cfoutput> </h1>
				<table class="table table-striped">
					  <thead>
					    <tr>
					      <th scope="col">Nome Ticket</th>
					      <th scope="col">Descrizione</th>
					      <th scope="col">Problemi</th>
					      <th scope="col">Test</th>
					      <th scope="col">Installazione</th>
					      <th scope="col">Modifica</th>
					      <th scope="col">Elimina</th>
					    </tr>
					  </thead>
					  <tbody>
					  		<cfscript>
					  			writeOutput(ticket.creaRighe(#url.categoria#));
					  		</cfscript>
					  </tbody>
				</table>

				<div id="buttons">
					<cfscript>
					writeOutput(ticket.generaPulsanti(#url.categoria#));
					</cfscript>
				</div>
	</body>
</html>