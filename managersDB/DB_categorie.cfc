<cfcomponent>
	<cfscript>
		public any function queryCategorie(){
			return QueryExecute(
			"select * from ListaCategorie",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function uploadCategorie(){
			return QueryExecute(
			"select * from ListaCategorie",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}
	</cfscript>
</cfcomponent>