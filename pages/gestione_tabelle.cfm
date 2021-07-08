<cfscript>
	gestioneTabelle = createObject("component", "PannelloDocumentazione\managers\gestione_tabelle");
	navigation = createObject('component', 'PannelloDocumentazione/navigation/navigazione');

	if(!isDefined("url.mode"))
	{
		cflocation( url="tabelle.cfm" );
	}
	else if(!isDefined("url.id"))
	{
		cflocation( url="tabelle.cfm" );
	}
	else if((#url.mode# != "Aggiorna" && #url.mode# != "Aggiungi" && #url.mode# != "Elimina"))
	{
		cflocation( url="tabelle.cfm" );
	}

	if(#url.mode# == "Aggiungi")
	{
		url.id = 0;
	}
</cfscript>

<!DOCTYPE html>
<html>
	<head lang="it">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Gestione Tabelle</title>
		<!-- BOOTSTRAP -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<!-- SPECIFICI -->
		<link rel="stylesheet" href="..\style\index.css">
		<link rel="icon" href="..\assets\img\icon.png" type="image/icon type">
	</head>
	<body>
		<cfscript>
			writeOutput(navigation.creaNavigazione());
		</cfscript>
		
			<h1 class='text-center' style="margin:20px"> <cfoutput> #url.mode# Tabella: </cfoutput> </h1>
			<cfform  action='tabelle.cfm?id=#url.id#' method='post'>
			<table class="table table-striped">
				  <thead>
				    <tr>
				      	<th scope="col">Nome Tabella</th>
					    <th scope="col">Funzionalita'</th>
					    <th scope="col">Pagine di Utilizzo</th>
					    <th scope="col">Descrizione</th>
					</tr>
				  </thead>
				  <tbody>
				  		<cfscript>
							writeOutput(gestioneTabelle.caricaTabella(#url.mode#,#url.id#));
				  		</cfscript>
				  </tbody>
			</table>
				<a href='tabelle.cfm'>  <button class='btn btn-warning'> Indietro </button> </a>
				<input class='btn btn-primary' type='submit' name='btnSubmit' value='<cfoutput>#url.mode# Tabella</cfoutput>' style='margin:10px;'> </input>
			</cfform>
	</body>
</html>