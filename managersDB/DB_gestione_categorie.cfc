<cfcomponent>
	<cfscript>
		public any function uploadCategoria(categoria){
			QueryExecute(
			"insert into ListaCategorie (nomeCategoria) values ('#categoria#')",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function updateCategoria(form,id){
			QueryExecute(
			"update ListaCategorie set nomeCategoria='#form.txtCategoria#' where idCategoria='#id#'",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}

		public any function deleteCategoria(id){
			QueryExecute(
			"delete from ListaCategorie where idCategoria='#id#'",
			{},
			{datasource = "qa_tirocinioDev"}
			);
		}
	</cfscript>
</cfcomponent>