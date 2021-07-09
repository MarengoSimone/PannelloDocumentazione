<cfscript>
	manager = createObject('component', "PannelloDocumentazione/managers/procedure");
	navigation = createObject('component', 'PannelloDocumentazione/navigation/navigazione');
	manager.controlloForm(form);
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
		<script type="text/javascript" src="..\script\procedure.js"></script>
		<link rel="icon" href="..\assets\img\icon.png" type="image/icon type">
	</head>
	<body>
		<cfscript>
			writeOutput(navigation.creaNavigazione());
		</cfscript>
		<h1 class='text-center' style="margin:20px">PROCEDURE:</h1>
		<table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">Nome Procedure</th>
			      <th scope="col">Descrizione</th>
			      <th scope="col">Note</th>
			      <th scope="col">Modifica</th>
			      <th scope="col">Elimina</th>
			    </tr>
			  </thead>
			  <cfscript>
			  	writeOutput(manager.scriviTabella());
			  </cfscript>
		</table>
		<div id="bottoni">
			<a href="modifica_procedure.cfm?tipo=aggiungi&procedureid=0">  <button class='btn btn-primary'>Aggiungi Procedura</button> </a>
		</div>
		<a href="modifica_procedure.cfm?tipo=export&procedureid=0"> <input type="button" class="btn btn-outline-success" value="Esporta in un file CSV"></a>
		<a href="modifica_procedure.cfm?tipo=inport&procedureid=0"> <input type="button" class="btn btn-outline-success" value="Inporta nel DB"></a>
	</body>
</html>