<cfcomponent>
	<cfscript>
		public any function uploadTicket(form,categoria){
			return QueryExecute(
			"insert into Tickets (nomeTicket,descrizione,problemi,test,installazione,categoria) values (:nome,'#form.txtDescrizione#','#form.txtProblemi#', '#form.txtTest#','#form.txtInstallazione#','#categoria#')",
			{nome="#form.txtNome#"},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function getTicket(id){
			return QueryExecute(
			"select * from Tickets where idTicket=#id#",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function updateTicket(form,id){
			return QueryExecute(
			"update Tickets set nomeTicket = '#form.txtNome#', descrizione='#form.txtDescrizione#',problemi='#form.txtProblemi#', test= '#form.txtTest#', installazione = '#form.txtInstallazione#' where idTicket=#id# ",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function deleteTicket(form,id){
			return QueryExecute(
			"delete from Tickets where idTicket=#id#",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}
	</cfscript>
</cfcomponent>