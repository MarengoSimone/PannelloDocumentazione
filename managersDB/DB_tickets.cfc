<cfcomponent>
	<cfscript>
		public any function queryTickets(categoria){
			return QueryExecute(
			"select * from Tickets where categoria='#categoria#'",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}
	</cfscript>
</cfcomponent>