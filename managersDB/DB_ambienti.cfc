<cfcomponent>
	<cfscript>
		public any function getAllAmbienti(){
			return queryExecute(
				"select * from Ambienti",
				{},
				{datasource = "qa_tirocinioDev"});
		}

		public void function aggiungiFormDB(form){
			q = queryExecute(
				"insert into Ambienti (ambiente, portale, administrator, utils, proced, versione)
				values (:ambiente,:portale,:administrator,:utils,:proced,:versione)",
				{ambiente = '#form.txtAmbiente#',
				 portale = '#form.txtPortale#',
				 administrator = '#form.txtAdministrator#',
				 utils = '#form.txtUtils#',
				 proced = '#form.txtProcedura#',
				 versione = '#form.txtVersione#'},
				{datasource = "qa_tirocinioDev"});
		}

		public void function modificaFormDB(form){
			q = queryExecute(
				"update Ambienti set portale = :portale, administrator = :administrator, utils = :utils, proced = :proced, versione = :versione where ambiente = :ambiente",
				{ambiente = '#form.txtAmbiente#',
				 portale = '#form.txtPortale#',
				 administrator = '#form.txtAdministrator#',
				 utils = '#form.txtUtils#',
				 proced = '#form.txtProcedura#',
				 versione = '#form.txtVersione#'},
				{datasource = "qa_tirocinioDev"});
		}

		public void function eliminaFormDB(form){
			q = queryExecute(
				"delete from Ambienti where ambiente = :ambiente",
				{ambiente = '#form.txtAmbiente#'},
				{datasource = "qa_tirocinioDev"});
		}
	</cfscript>
</cfcomponent>