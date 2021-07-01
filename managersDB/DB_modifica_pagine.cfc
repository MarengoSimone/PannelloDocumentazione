<cfcomponent>
	<cfscript>
		public any function getAllPaginePagID(pagid){
			return queryExecute(
				"select * from Pagine where pagID = :pagid",
				{pagid = '#pagid#'},
				{datasource = "qa_tirocinioDev"});
		}
	</cfscript>
</cfcomponent>