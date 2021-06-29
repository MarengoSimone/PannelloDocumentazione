<cfcomponent>
	<cfscript>
		public any function getAllAmbienti(){
			return queryExecute(
				"select * from Ambienti",
				{},
				{datasource = "qa_tirocinioDev"});
		}
	</cfscript>
</cfcomponent>