<cfcomponent>
	<cfscript>
		public any function uploadCategoria(categoria){
			QueryExecute(
			"insert into ListaCategorie (nomeCategoria) values ('#categoria#')",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function updateCategoria(form,categoria){
			QueryExecute(
			"update ListaCategorie set nomeCategoria='#form.txtCategoria#' where nomeCategoria='#categoria#'",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function deleteCategoria(categoria){
			QueryExecute(
			"delete from ListaCategorie where nomeCategoria='#categoria#'",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}
	</cfscript>
</cfcomponent>