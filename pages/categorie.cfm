<cfscript>
	categ = createObject("component", "PannelloDocumentazione\managers\gestione_categorie");
	manager = createObject("component","PannelloDocumentazione\managers\categorie");
	navigation = createObject('component', 'PannelloDocumentazione/navigation/navigazione');

	if(isDefined("form") && isDefined("form.BTNSUBMIT") && (#form.BTNSUBMIT# == "Aggiungi Categoria"))
	{
		categ.uploadCategoria(form);
	}
	else if (isDefined("form") && isDefined("form.BTNSUBMIT") && (#form.BTNSUBMIT# == "Aggiorna Categoria"))
	{
		categ.updateCategoria(form,url.categoria);
	}
	else if (isDefined("form") && isDefined("form.BTNSUBMIT") && (#form.BTNSUBMIT# == "Elimina Categoria"))
	{
		categ.deleteCategoria(#url.categoria#);
	}
</cfscript>

<!DOCTYPE html>
<html>
	<head lang="it">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Categorie Ticket</title>
		<!-- BOOTSTRAP -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<!-- SPECIFICI -->
		<link rel="stylesheet" href="..\style\index.css">
		<script src="..\script\categorie.js"></script>
	</head>
	<body>
		<cfscript>
			writeOutput(navigation.creaNavigazione());
		</cfscript>
		
			<h1 class='text-center' style="margin:20px">Categorie di Ticket disponibili:</h1>
			<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">Categoria</th>
				      <th scope="col">Modifica</th>
					  <th scope="col">Elimina</th>
				    </tr>
				  </thead>
				  <tbody>
				  		<cfscript>
				  			writeOutput(manager.creaRighe());
				  		</cfscript>
				  </tbody>
			</table>
			<div id="buttons">
					<cfscript>
						writeOutput(manager.generaPulsanti());
					</cfscript>
				</div>
	</body>
</html>