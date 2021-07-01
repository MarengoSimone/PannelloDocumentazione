<cfcomponent>
	<cfscript>
		public any function getAllProcedure(){
			return queryExecute(
				"select * from ListaProcedure",
				{},
				{datasource = "qa_tirocinioDev"});
		}

		public any function aggiungiFormDB(form){
			q = queryExecute(
				"insert into ListaProcedure (nomeProcedura, descrizione, note) values (:nomeProcedura, :descrizione, :note)",
				{nomeProcedura = '#form.txtNomeProcedura#',
				 descrizione = '#form.txtDescrizione#',
				 note = '#form.txtNote#'},
				{datasource = "qa_tirocinioDev"});
		}

		public any function modificaFormDB(form){
			q = queryExecute(
				"update ListaProcedure set nomeProcedura = '#form.txtNomeProcedura#', descrizione = '#form.txtDescrizione#', note = '#form.txtNote#' where procedureID = '#form.txtProcedureID#'",
				{},
				{datasource = "qa_tirocinioDev"});
		}
	</cfscript>
</cfcomponent>