<cfscript>
	manager = createObject("component","PannelloDocumentazione\managers\tabelle");
	managerTabelle = createObject("component","PannelloDocumentazione\managers\gestione_tabelle");
	navigation = createObject('component', 'PannelloDocumentazione/navigation/navigazione');

	if(isDefined("form") && isDefined("form.BTNSUBMIT") && (#form.BTNSUBMIT# == "Aggiungi Tabella"))
	{
		managerTabelle.uploadTabella(form);
	}
	else if (isDefined("form") && isDefined("form.BTNSUBMIT") && (#form.BTNSUBMIT# == "Aggiorna Tabella"))
	{
		managerTabelle.updateTabella(form,url.id);
	}
	else if (isDefined("form") && isDefined("form.BTNSUBMIT") && (#form.BTNSUBMIT# == "Elimina Tabella"))
	{
		managerTabelle.deleteTabella(#url.id#);
	}
</cfscript>

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
		<script src="..\script\tabelle.js"></script>
		<link rel="icon" href="..\assets\img\icon.png" type="image/icon type">
	</head>
	<body>
		<cfscript>
			writeOutput(navigation.creaNavigazione());
		</cfscript>
		
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
				  				writeOutput(manager.creaRighe());
					  		</cfscript>
					  </tbody>
				</table>
				
				<div id="buttons">
					<cfscript>
						writeOutput(manager.generaPulsanti());
					</cfscript>
				</div>
				<a href='gestione_tabelle.cfm?mode=Export&id=0'>  <button class='btn btn-success'>Esporta in file CSV</button> </a>
	</body>
</html>