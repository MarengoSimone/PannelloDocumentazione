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
	</cfscript>
</cfcomponent>