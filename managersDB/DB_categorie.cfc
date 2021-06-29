<cfcomponent>
	<cfscript>
		public any function queryCategorie(){
			return QueryExecute(
			"select * from ListaCategorie",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}
	</cfscript>
</cfcomponent>