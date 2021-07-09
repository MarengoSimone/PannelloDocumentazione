<cfscript>
	manager = createObject('component', "PannelloDocumentazione/managers/pagine");
	navigation = createObject('component', 'PannelloDocumentazione/navigation/navigazione');
	manager.controlloForm(form);
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
		<script type="text/javascript" src="..\script\pagine.js"></script>
		<link rel="icon" href="..\assets\img\icon.png" type="image/icon type">
	</head>
	<body>
		<cfscript>
			writeOutput(navigation.creaNavigazione());
		</cfscript>
		<h1 class='text-center' style="margin:20px">PAGINE:</h1>
		<table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">Nome Pagina</th>
			      <th scope="col">Locazione</th>
			      <th scope="col">Funzioni</th>
			      <th scope="col">Tabelle</th>
			      <th scope="col">Modifica</th>
			      <th scope="col">Elimina</th>
			    </tr>
			  </thead>
			  <cfscript>
			  	writeOutput(manager.scriviTabella());
			  </cfscript>
		</table>
		<div id="bottoni">
			<a href="modifica_pagine.cfm?tipo=aggiungi&pagid=0">  <button class='btn btn-primary'>Aggiungi Pagina</button> </a>
		</div>
		<a href="modifica_pagine.cfm?tipo=export&pagid=0"><input type="button" class="btn btn-outline-success" value="Esporta in un file CSV"></a>
		<a href="modifica_pagine.cfm?tipo=inport&pagid=0"><input type="button" class="btn btn-outline-success" value="Inporta nel DB"></a>
	</body>
</html>