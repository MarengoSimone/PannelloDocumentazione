<cfcomponent>
	<cfscript>
		public string function creaNavigazione(){
			return "<nav class='navbar navbar-expand-lg navbar-dark bg-primary'>
					  <a class='navbar-brand' href='index.cfm'>
    				  <img src='..\assets\icon\tesisquareicon.png' width='35' height='35' class='d-inline-block align-top' alt=''>
    					Pannello Documentazione
  						</a>
					  <button class='navbar-toggler' type='button' data-toggle='collapse' data-target='navbarNavAltMarku' aria-controls='navbarNavAltMarkup' aria-expanded='false' aria-label='Toggle navigation'>
					    <span class='navbar-toggler-icon'></span>
					  </button>
					  <div class='collapse navbar-collapse' id='navbarNavAltMarkup'>
					    <div class='navbar-nav'>
					      <a class='nav-item nav-link active' href='index.cfm'>Home<span class='sr-only'>(current)</span></a>
					      <a class='nav-item nav-link' href='ambienti.cfm'>Ambienti</a>
					      <a class='nav-item nav-link' href='pagine.cfm'>Pagine</a>
					      <a class='nav-item nav-link' href='procedure.cfm'>Procedure</a>
					      <a class='nav-item nav-link' href='tabelle.cfm'>Tabelle</a>
					      <a class='nav-item nav-link' href='categorie.cfm'>Ticket</a>
					    </div>
					  </div>
					  <span span class='navbar-text'><a href='https://github.com/MarengoSimone/PannelloDocumentazione/' target='_blank'><img src='..\assets\icon\githubicon.png' height='35' class='d-inline-block align-top' alt=''></a></span>
					</nav>";
		}
	</cfscript>
</cfcomponent>