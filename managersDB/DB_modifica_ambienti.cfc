<cfcomponent>
	<cfscript>
		public any function getAllAmbientiAmbiente(ambiente){
			return queryExecute(
				"select * from Ambienti where ambiente = '#ambiente#'",
				{},
				{datasource = "qa_tirocinioDev"});
		}

	</cfscript>
</cfcomponent>