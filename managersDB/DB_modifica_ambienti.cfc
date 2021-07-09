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

		public any function inport(allAmbienti){
			for(i = 1; i <= allAmbienti.recordCount; i++){
				queryExecute(
				"insert into ambienti (ambiente, portale, administrator, utils, proced, versione) values (:ambiente, :portale, :administrator, :utils, :proced, :versione)",
				 {ambiente = '#allAmbienti.ambiente[i]#', portale = '#allAmbienti.portale[i]#', administrator = '#allAmbienti.administrator[i]#', utils = '#allAmbienti.utils[i]#', proced = '#allAmbienti.proced[i]#', versione = '#allAmbienti.versione[i]#'}, {datasource = "qa_tirocinioDev"});	
			}
		}
	</cfscript>
</cfcomponent>