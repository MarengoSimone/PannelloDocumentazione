<cfcomponent>
	<cfscript> 
		public any function creaTabella() {
		  	return "<a href=ambienti.cfm><div class=paginaA>  Elenco Ambienti  </div></a>
		  	<a href=pagine.cfm><div class=paginaA>  Elenco Pagine </div> </a>
		  	<a href=procedure.cfm><div class=paginaA>  Elenco Procedure  </div></a>
		  	<a href=tabelle.cfm><div class=paginaA>  Elenco Tabelle </div> </a>
		  	<a href=categorie.cfm><div class=paginaA>  Elenco Ticket  </div></a>";
		}
	</cfscript>
</cfcomponent>