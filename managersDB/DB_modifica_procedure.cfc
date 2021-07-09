<cfcomponent>
	<cfscript>
		public any function getAllProcedureProcedureID(procedureID){
			return queryExecute(
				"select * from ListaProcedure where procedureID = '#procedureID#'",
				{},
				{datasource = "qa_tirocinioDev"});
		}

		public any function getAllProcedure(){
			return queryExecute(
				"select * from ListaProcedure",
				{},
				{datasource = "qa_tirocinioDev"});
		}

		public void function inport(allProcedure){
			//queryExecute("delete from ListaProcedure", {}, {datasource = "qa_tirocinioDev"});
			for(i = 1; i <= allProcedure.recordCount; i++){
				queryExecute("insert into ListaProcedure (nomeProcedura, descrizione, note) values (:nomeProcedura, :descrizione, :note)",
					{nomeProcedura = '#allProcedure.nomeProcedura[i]#', descrizione = '#allProcedure.descrizione[i]#', note = '#allProcedure.note[i]#'},
					{datasource = "qa_tirocinioDev"});
			}
		}	
	</cfscript>
</cfcomponent>