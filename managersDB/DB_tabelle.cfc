  
<cfcomponent>
	<cfscript>
		public any function queryTabelle(){
			return QueryExecute(
			"select * from ListaTabelle",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function uploadTabella(){
			return QueryExecute(
			"select * from ListaCategorie",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}
	</cfscript>
</cfcomponent>