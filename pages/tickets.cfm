<cfscript>
	ticket = createObject("component", "PannelloDocumentazione\managers\tickets");
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
	</head>
	<body>
		
			<h1 class='text-center' style="margin:20px"> <cfoutput> Ticket #url.categoria# disponibili: </cfoutput> </h1>
			<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">Nome Ticket</th>
				      <th scope="col">Descrizione</th>
				      <th scope="col">Problemi</th>
				      <th scope="col">Test</th>
				      <th scope="col">Installazione</th>
				    </tr>
				  </thead>
				  <tbody>
				  		<cfscript>
				  			writeOutput(ticket.creaRighe(#url.categoria#));
				  		</cfscript>
				  </tbody>
			</table>
			<a href="categorie.cfm" style='color: white;'>  <button class='btn btn-warning'> Indietro</button> </a>
			<a href="gestione_ticket.cfm?mode=Aggiungi">  <button class='btn btn-primary'> Aggiungi Ticket</button> </a>
			<a href="gestione_ticket.cfm?mode=Aggiorna">  <button class='btn btn-info'> Aggiorna Ticket</button> </a>
			<a>  <button class='btn btn-danger'> Elimina Ticket</button> </a>
	</body>
</html>