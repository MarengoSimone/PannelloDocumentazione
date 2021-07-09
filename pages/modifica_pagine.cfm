<cfscript>
	manager = createObject('component', "PannelloDocumentazione/managers/modifica_pagine");
	navigation = createObject('component', 'PannelloDocumentazione/navigation/navigazione');
	if(!isDefined("url.tipo")){
		cflocation( url="pagine.cfm" );
	}

	if(url.tipo == "export"){
		manager.exportInCSV();
		cflocation( url="pagine.cfm" );
	}

	if(!isDefined("url.pagid")){
		cflocation( url="pagine.cfm" );
	}
</cfscript>
<!DOCTYPE html>
<html>
	<head lang="it">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Tabella Pagine</title>
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
		<cfform action="pagine.cfm" method="post">
			<h1 class='text-center' style="margin:20px">PAGINE:</h1>
			<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">Nome Pagina</th>
				      <th scope="col">Locazione</th>
				      <th scope="col">Funzioni</th>
				      <th scope="col">Tabelle</th>
				    </tr>
				  </thead>
				  <cfscript>
				  	writeOutput(manager.scriviTabella(url.tipo, url.pagid));
				  </cfscript>
			</table>
			<div id="bottoni">
				<cfscript>
					writeOutput(manager.creaBottoni(url.tipo));
				</cfscript>
			</div>
		</cfform>
	</body>
</html>