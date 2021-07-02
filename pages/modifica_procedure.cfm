<cfscript>
	manager = createObject('component', "PannelloDocumentazione/managers/modifica_procedure");
	navigation = createObject('component', 'PannelloDocumentazione/navigation/navigazione');
	if(!isDefined("url.tipo")){
		cflocation( url="procedure.cfm" );
	}

	if(!isDefined("url.procedureid")){
		cflocation( url="procedure.cfm" );
	}
</cfscript>
<!DOCTYPE html>
<html>
	<head lang="it">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Lista Procedure</title>
		<!-- BOOTSTRAP e JQUERY -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<!-- SPECIFICI -->
		<link rel="stylesheet" href="..\style\index.css">
	</head>
	<body>
		<cfscript>
			writeOutput(navigation.creaNavigazione());
		</cfscript>
		<cfform action="procedure.cfm" method="post">
			<h1 class='text-center' style="margin:20px">PROCEDURE:</h1>
			<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">Nome Procedura</th>
				      <th scope="col">Descrizione</th>
				      <th scope="col">Note</th>
				    </tr>
				  </thead>
				  <cfscript>
				  	writeOutput(manager.scriviTabella(url.tipo, url.procedureid));
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