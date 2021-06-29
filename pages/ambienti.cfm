<cfscript>
	manager = createObject('component', "PannelloDocumentazione/managers/ambienti");
	manager.controlloForm(form);
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
				      <th scope="col">Modifica</th>
				      <th scope="col">Elimina</th>
				    </tr>
				  </thead>
				  <tbody>

				  	<cfscript>
				  		writeOutput(manager.scriviElementiTabella());
				  	</cfscript>
				  </tbody>
			</table>
			<a href="modifica_ambienti.cfm?tipo=aggiungi">  <button class='btn btn-primary'>Aggiungi Ambiente</button> </a>
			<a href="modifica_ambienti.cfm?tipo=modifica">  <button class='btn btn-info'>Modifica Ambiente</button> </a>
			<a href="modifica_ambienti.cfm?tipo=elimina">  <button class='btn btn-danger'>Elimina Ambiente/i</button> </a>
	</body>
</html>