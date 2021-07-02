<cfscript>
	manager = createObject('component', "PannelloDocumentazione/managers/ambienti");
	navigation = createObject('component', 'PannelloDocumentazione/navigation/navigazione');
	manager.controlloForm(form);

	local.ambModifica = "niente";
</cfscript>
<!DOCTYPE html>
<html>
	<head lang="it">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Ambienti</title>
		<!-- BOOTSTRAP e JQUERY -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<!-- SPECIFICI -->
		<link rel="stylesheet" href="..\style\index.css">
		<script type="text/javascript" src="..\script\ambienti.js"></script>
	</head>
	<body>
		<cfscript>
			writeOutput(navigation.creaNavigazione());
		</cfscript>

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
			  <cfscript>
			  	  writeOutput(manager.scriviElementiTabella());
			  </cfscript>
		</table>
		<div  id="ambienteModifica">
			<a href="modifica_ambienti.cfm?tipo=aggiungi&ambiente=niente">  <button class='btn btn-primary'>Aggiungi Ambiente</button> </a>
		</div>
	</body>
</html>