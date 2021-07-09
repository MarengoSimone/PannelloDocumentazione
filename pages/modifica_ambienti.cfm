<cfscript>
	manager = createObject('component', "PannelloDocumentazione/managers/modifica_ambienti");
	navigation = createObject('component', 'PannelloDocumentazione/navigation/navigazione');

	if(!isDefined("url.tipo")){
		cflocation( url="ambienti.cfm" );
	}

	if(url.tipo == "export"){
		manager.ExportInCSV();
		cflocation( url="ambienti.cfm" );
	}

	if(!isDefined("url.ambientiID")){
		cflocation( url="ambienti.cfm" );
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
		<link rel="icon" href="..\assets\img\icon.png" type="image/icon type">
	</head>
	<body>
		<cfscript>
			writeOutput(navigation.creaNavigazione());
		</cfscript>
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
				  <cfscript>
				  	writeOutput(manager.creaContenutoTabella(url.tipo, url.ambientiID));
				  </cfscript>
			</table>
			<cfscript>
				writeOutput(manager.creaBottoni(url.tipo));
			</cfscript>
		</cfform>
	</body>
</html>