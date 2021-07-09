<cfcomponent>
	<cfscript>
		public any function getAllAmbienti(){
			return queryExecute(
				"select * from Ambienti",
				{},
				{datasource = "qa_tirocinioDev"});
		}

		public any function getAllAmbientiAmbiente(ambientiID){
			return queryExecute(
				"select * from Ambienti where ambientiID = :id",
				{id = '#ambientiID#'},
				{datasource = "qa_tirocinioDev"});
		}

	</cfscript>
</cfcomponent>