<cfcomponent>
	<cfscript>
		public any function uploadCategoria(categoria){
			QueryExecute(
			"insert into ListaCategorie (nomeCategoria) values ('#categoria#')",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}
	</cfscript>
</cfcomponent>