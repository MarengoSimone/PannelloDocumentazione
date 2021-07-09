<cfcomponent>
	<cfscript>
		public any function uploadTabella(form){
			return QueryExecute(
			"insert into ListaTabelle (nomeTabella,funzionalita,pagineUtilizzo,descrizione) values ('#form.txtNome#','#form.txtFunzionalita#','#form.txtPagine#', '#form.txtDescrizione#')",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function getTabella(nome){
			return QueryExecute(
			"select * from ListaTabelle where tabId='#id#'",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function queryTabelle(){
			return QueryExecute(
			"select * from ListaTabelle",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function updateTabella(form,id){
			return QueryExecute(
			"update ListaTabelle set nomeTabella='#form.txtNome#', funzionalita='#form.txtFunzionalita#', pagineUtilizzo= '#form.txtPagine#', descrizione = '#form.txtDescrizione#' where tabId=#id# ",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function deleteTabella(form,id){
			QueryExecute(
			"delete from ListaTabelle where tabId='#id#'",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public void function importTabella(tabelle){
			for(i = 1; i <= tabelle.recordCount; i++){
				QueryExecute(
				"insert into ListaTabelle (nomeTabella, funzionalita, pagineUtilizzo, descrizione) values (:nomeTabella, :funzionalita, :pagineUtilizzo, :descrizione)",
				 {nomeTabella = '#tabelle.nomeTabella[i]#',funzionalita = '#tabelle.funzionalita[i]#',pagineUtilizzo = '#tabelle.pagineUtilizzo[i]#',descrizione = '#tabelle.descrizione[i]#'}, {datasource = "qa_tirocinioDev"});	
			}
		}
	</cfscript>
</cfcomponent>