<cfcomponent>
	<cfscript>
		public any function uploadTicket(form,categoria){
			return QueryExecute(
			"insert into Tickets (nomeTicket,descrizione,problemi,test,installazione,categoria) values (:nome,'#form.txtDescrizione#','#form.txtProblemi#', '#form.txtTest#','#form.txtInstallazione#','#categoria#')",
			{nome="#form.txtNome#"},
			{datasource = "qa_tirocinioDev"}
			);
		}
	</cfscript>
</cfcomponent>