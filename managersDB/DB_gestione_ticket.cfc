<cfcomponent>
	<cfscript>
		public any function uploadTicket(form,categoria){
			return QueryExecute(
			"insert into Tickets (nomeTicket,descrizione,problemi,test,installazione,categoria) values (:nome,'#form.txtDescrizione#','#form.txtProblemi#', '#form.txtTest#','#form.txtInstallazione#','#categoria#')",
			{nome="#form.txtNome#"},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function getTicket(nome){
			return QueryExecute(
			"select * from Tickets where nomeTicket='#nome#'",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function updateTicket(form,nome){
			return QueryExecute(
			"update Tickets set descrizione='#form.txtDescrizione#',problemi='#form.txtProblemi#', test= '#form.txtTest#', installazione = '#form.txtInstallazione#' where categoria='#categoria#' and nomeTicket='#nome#' ",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function deleteTicket(form,nome){
			QueryExecute(
			"delete from Tickets where nomeTicket='#nome#'",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}
	</cfscript>
</cfcomponent>