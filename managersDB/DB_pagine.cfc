<cfcomponent>
	<cfscript>
		public any function getAllPagine(){
			return queryExecute(
				"select * from Pagine",
				{},
				{datasource = "qa_tirocinioDev"});
		}

		public any function aggiungiFormDB(form){
			q = queryExecute(
				"insert into Pagine (nomePagina, loc, funzioni, tabelle) values (:nomePagina, :locazione, :funzioni, :tabelle)",
				{nomePagina = '#form.txtNomePagina#',
				 locazione = '#form.txtLocazione#',
				 funzioni = '#form.txtFunzioni#',
				 tabelle = '#form.txtTabelle#'},
				{datasource = "qa_tirocinioDev"});
		}

		public any function updateFormDB(form){
			q = queryExecute(
				"update Pagine 
				 set nomePagina = '#form.txtNomePagina#', loc = '#form.txtLocazione#', funzioni = '#form.txtFunzioni#', tabelle = '#form.txtTabelle#' 
				 where pagID = '#form.txtPagID#'",
				{/*nomePagina = '#form.txtNomePagina#',    //per qualche motivo sconosciuto non funzionava il passaggio di parametri ':var'
				 locazione = '#form.txtLocazione#',
				 funzioni = '#form.txtFunzioni#',
				 tabelle = '#form.txtTabelle#'
				 pagID = '#form.txtPagID#'*/},
				{datasource = "qa_tirocinioDev"});
		}

		public any function eliminaFormDB(form){
			q = queryExecute(
				"delete from Pagine where pagID = '#form.txtPagID#'",
				{},
				{datasource = "qa_tirocinioDev"});
		}
	</cfscript>
</cfcomponent>