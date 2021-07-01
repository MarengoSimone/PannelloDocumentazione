<!DOCTYPE html>
<html>
	<head lang="it">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Elenco Tabelle</title>
		<!-- BOOTSTRAP -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<!-- SPECIFICI -->
		<link rel="stylesheet" href="..\style\index.css">
	</head>
	<body>
		
			<h1 class='text-center' style="margin:20px"> <cfoutput> Elenco tabelle disponibili: </cfoutput> </h1>
				<table class="table table-striped">
					  <thead>
					    <tr>
					      <th scope="col">Nome Tabella</th>
					      <th scope="col">Funzionalita'</th>
					      <th scope="col">Pagine di Utilizzo</th>
					      <th scope="col">Descrizione</th>
					  	  <th scope="col">Modifica</th>
					      <th scope="col">Elimina</th>
					    </tr>
					  </thead>
					  <tbody>
					  		<cfscript>
					  			manager = createObject("component","PannelloDocumentazione\managers\tabelle");
				  				writeOutput(manager.creaRighe());
					  		</cfscript>
					  </tbody>
				</table>

				<div id="buttons">
					<cfscript>
						
					</cfscript>
				</div>
	</body>
</html>