<cfcomponent>
	<cfscript>
		public any function getAllProcedureProcedureID(procedureID){
			return queryExecute(
				"select * from ListaProcedure where procedureID = '#procedureID#'",
				{},
				{datasource = "qa_tirocinioDev"});
		}
	</cfscript>
</cfcomponent>