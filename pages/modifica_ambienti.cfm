<cfscript>
	manager = createObject('component', "PannelloDocumentazione/managers/modifica_ambienti");

	if(!isDefined("url.tipo")){
		cflocation( url="C:\ColdFusion2016\PannelloDocumentazione\wwwroot\PannelloDocumentazione\pages\ambienti.cfm" );
	}
</cfscript>
<!DOCTYPE html>
<html>
	<head lang="it">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Ambienti</title>
		<!-- BOOTSTRAP e JQUERY -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<!-- SPECIFICI -->
		<link rel="stylesheet" href="..\style\index.css">
	</head>
	<body>
		<cfform action="ambienti.cfm" method="post">
			<h1 class='text-center' style="margin:20px">AMBIENTI:</h1>
			<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">Ambiente</th>
				      <th scope="col">Portale</th>
				      <th scope="col">Administrator</th>
				      <th scope="col">Utils</th>
				      <th scope="col">Procedure</th>
				      <th scope="col">Versione</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<cfscript>
				  		writeOutput(manager.creaContenutoTabella(url.tipo));
				  	</cfscript>
				  </tbody>
			</table>
			<input type="submit" name="btnAggiungiAmbiente" class='btn btn-primary' value="Aggiungi Ambiente">
		</cfform>
	</body>
</html>