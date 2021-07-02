<cfcomponent>
	<cfscript> 
		public any function creaTabella() {
		  	return "<div class=paginaA> <a href=ambienti.cfm> Elenco Ambienti </a> </div>
		  	<div class=paginaA> <a href=pagine.cfm> Elenco Pagine </a> </div>
		  	<div class=paginaA> <a href=procedure.cfm> Elenco Procedure </a> </div>
		  	<div class=paginaA> <a href=tabelle.cfm> Elenco Tabelle </a> </div>
		  	<div class=paginaA> <a href=categorie.cfm> Elenco Ticket </a> </div>";
		}
	</cfscript>
</cfcomponent>