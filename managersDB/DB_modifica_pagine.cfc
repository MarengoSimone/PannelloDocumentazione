<cfcomponent>
	<cfscript>
		public any function getAllPaginePagID(pagid){
			return queryExecute(
				"select * from Pagine where pagID = :pagid",
				{pagid = '#pagid#'},
				{datasource = "qa_tirocinioDev"});
		}

		public any function getAllPagine(){
			return queryExecute(
				"select * from Pagine",
				{},
				{datasource = "qa_tirocinioDev"});
		}

		public void function inport(allPagine){
			for(i = 1; i <= allPagine.recordCount; i++){
				queryExecute(
					"insert into pagine (nomePagina, loc, funzioni, tabelle) values (:nomePagina, :loc, :funzioni, :tabelle)",
					{nomePagina = '#allPagine.nomePagina[i]#', loc = '#allPagine.loc[i]#', funzioni = '#allPagine.funzioni[i]#', tabelle = '#allPagine.tabelle[i]#'}, {datasource = "qa_tirocinioDev"});
			}
		}
	</cfscript>
</cfcomponent>