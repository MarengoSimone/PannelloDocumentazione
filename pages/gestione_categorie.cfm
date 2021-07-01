<cfscript> 
	manager = createObject("component","PannelloDocumentazione\managers\gestione_categorie");

	if(isDefined("form") && isDefined("form.BTNSUBMIT") && (#form.BTNSUBMIT# == "Aggiungi Categoria"))
	{
		manager.uploadCategoria(form);
	}
	else if (isDefined("form") && isDefined("form.BTNSUBMIT") && (#form.BTNSUBMIT# == "Aggiorna Categoria"))
	{
		manager.updateCategoria(form,url.categoria);
	}
	else if (isDefined("form") && isDefined("form.BTNSUBMIT") && (#form.BTNSUBMIT# == "Elimina Categoria"))
	{
		manager.deleteCategoria(#url.categoria#);
	}
</cfscript>

<!DOCTYPE html>
<html>
	<head lang="it">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Gestione Categoria</title>
		<!-- BOOTSTRAP -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<!-- SPECIFICI -->
		<link rel="stylesheet" href="..\style\index.css">
	</head>
	<body>
		
			<h1 class='text-center' style="margin:20px"> <cfoutput> #url.mode# Categoria: </cfoutput> </h1>
			<cfform action="categorie.cfm?categoria=#url.categoria#" method="post">
				<div id="insert">
				  <label>Categoria:</label>
				  <input type="text" name="txtCategoria" id="txtCategoria" value='<cfoutput>#url.categoria#</cfoutput>'>
				</div>
			      <a href="categorie.cfm"> <input type="button" class="btn btn-warning" name="btnIndietro" value="Indietro"></a>
			      <input class="btn btn-primary" type="submit" id="btnSubmit" name="btnSubmit" value='<cfoutput>#url.mode# Categoria</cfoutput>' >
			</cfform>

	</body>
</html>