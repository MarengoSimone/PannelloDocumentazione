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
				values ('#form.txtAmbiente#','#form.txtPortale#','#form.txtAdministrator#','#form.txtUtils#','#form.txtProcedura#','#form.txtVersione#')",
				{datasource = "qa_tirocinioDev"});
		}
	</cfscript>
</cfcomponent>