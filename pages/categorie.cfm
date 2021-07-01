<cfscript>
	categ = createObject("component", "PannelloDocumentazione\managers\aggiungi_categoria");
	categ.uploadCategoria(form);
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
	</head>
	<body>
		
			<h1 class='text-center' style="margin:20px">Categorie di Ticket disponibili:</h1>
			<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">Categoria</th>
				    </tr>
				  </thead>
				  <tbody>
				  		<cfscript>
				  			manager = createObject("component","PannelloDocumentazione\managers\categorie");
				  			writeOutput(manager.creaRighe());
				  		</cfscript>
				  </tbody>
			</table>
			<a href="aggiungi_categoria.cfm">  <button class='btn btn-primary'> Aggiungi Categoria</button> </a>
	</body>
</html>