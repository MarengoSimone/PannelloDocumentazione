<cfscript> 
	/*categ = createObject("component", "PannelloDocumentazione\managers\aggiungi_categoria");
	categ.uploadCategoria(form);*/
</cfscript>

<!DOCTYPE html>
<html>
	<head lang="it">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Inserimento Categoria</title>
		<!-- BOOTSTRAP -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<!-- SPECIFICI -->
		<link rel="stylesheet" href="..\style\index.css">
	</head>
	<body>
		
			<h1 class='text-center' style="margin:20px">Inserisci una nuova categoria:</h1>
			<cfform action="categorie.cfm" method="post">
				<div id="insert">
				  <label>Categoria:</label>
				  <input type="text" name="txtCategoria" id="txtCategoria">
				</div>
			      <a href="categorie.cfm"> <input type="button" class="btn btn-warning" name="btnIndietro" value="Indietro"></a>
			      <input class="btn btn-primary" type="submit" id="btnSubmit" name="btnSubmit" value="Inserisci Categoria" >
			</cfform>

	</body>
</html>