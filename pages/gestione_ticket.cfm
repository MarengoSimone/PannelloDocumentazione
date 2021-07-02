<cfscript>
	gestioneTicket = createObject("component", "PannelloDocumentazione\managers\gestione_ticket");
	navigation = createObject('component', 'PannelloDocumentazione/navigation/navigazione');
	if(!isDefined("url.mode"))
	{
		cflocation( url="categorie.cfm" );
	}
	else if(!isDefined("url.categoria"))
	{
		cflocation( url="categorie.cfm" );
	}
	else if(!isDefined("url.nome"))
	{
		cflocation( url="categorie.cfm" );
	}
	else if(#url.mode# != "Aggiorna" && #url.mode# != "Aggiungi" && #url.mode# != "Elimina")
	{
		cflocation( url="categorie.cfm" );
	}
</cfscript>

<!DOCTYPE html>
<html>
	<head lang="it">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Gestione Ticket</title>
		<!-- BOOTSTRAP -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<!-- SPECIFICI -->
		<link rel="stylesheet" href="..\style\index.css">
	</head>
	<body>
		<cfscript>
			writeOutput(navigation.creaNavigazione());
		</cfscript>
		
			<h1 class='text-center' style="margin:20px"> <cfoutput> #url.mode# Ticket: </cfoutput> </h1>
			<cfform  action='tickets.cfm?categoria=#url.categoria#&nome=#url.nome#' method='post'>
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
						if(#url.nome# == "undefined")
						{
							writeOutput(gestioneTicket.caricaTabella(#url.mode#,"test"));
						}
						else
							writeOutput(gestioneTicket.caricaTabella(#url.mode#,#url.nome#));
				  		</cfscript>
				  </tbody>
			</table>
				<input class='btn btn-primary' type='submit' name='btnSubmit' value='<cfoutput>#url.mode# Ticket</cfoutput>' style='margin:10px;'> </input>
			</cfform>
	</body>
</html>