<cfscript>
	manager = createObject("component", "PannelloDocumentazione\managers\index");
    navigation = createObject("component", "PannelloDocumentazione\navigation\navigazione");
</cfscript>

<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="content-type" content="text/html">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
    <link rel="stylesheet" type="text/css" href="..\style\index.css">
    <link rel="icon" href="..\assets\img\icon.png" type="image/icon type">
    <title>Pannello Documentazione | Home</title>
</head>

<body id="wrapper">
        <cfscript> 
            writeOutput(navigation.creaNavigazione());
        </cfscript>
    <header>
        <h1>Pannello Documentazione:</h1>
        <p style='color:aquamarine'>An open-source code for a detailed documentation! </p>
        <img style='width:3em;margin:3px;' src="..\assets\img\github.png" alt="">
        <br>
        <a href="https://github.com/MarengoSimone/PannelloDocumentazione" target="_blank"  style='color:aquamarine'> Free code </a>
    </header>
    
    <section class="card_offset" id="wrapperA">
    	<cfscript> 
    		writeOutput(manager.creaTabella());
    	</cfscript>
    </section>
   
    <footer>
        <div class="frame">
    
            <div class="block">
                <div class="builder">
                    <h3>Designed and Developed for</h3>
                    <a href="https://tesisquare.com/it/">
                        <img id="creator" src="..\assets\img\icon.png" alt="Designed and developed by Simone Marengo and Daniele Paschetta" title="Designed and developed by Simone Marengo and Daniele Paschetta" width="80px">
                    </a>
                </div>
            </div>
            <div class="block">
                <h3>Copyright Notice</h3>
                <p>&copy This website is developed with <a target="_blank"  style='color:aquamarine;' href="https://www.adobe.com/it/products/coldfusion-family.html">ColdFusion</a>.<br></p>
                <p>&copy Created by Marengo Simone and Paschetta Daniele. </p>
            </div>
        </div>
    </footer>
    
</body>
</html>