"use strict"

window.onload = function(){
	let _ambienteModifica = document.getElementById("buttons");
	let _radiosModifica = document.getElementsByName("rdbModifica");
	let _radiosElimina = document.getElementsByName("rdbElimina");
	
	for (let i = 0;i<_radiosModifica.length;i++) {
		_radiosModifica[i].addEventListener("click", bottoniModifica);	
	}

	for(let i = 0; i < _radiosElimina.length; i++){
		_radiosElimina[i].addEventListener("click", bottoniElimina);
	}

function bottoniModifica(){
		_ambienteModifica.innerHTML = `
		<a href='gestione_categorie.cfm?mode=Aggiungi&categoria=categoria'>  <button class='btn btn-primary'> Aggiungi Categoria</button> </a>
		<a href='gestione_categorie.cfm?mode=Aggiorna&categoria=${this.value}'>  <button class='btn btn-info' id='btnAggiorna'> Aggiorna Categoria</button> </a>`

		for(let i = 0; i < _radiosElimina.length; i++){
			if(_radiosElimina[i].checked == true)
			{
				_radiosElimina[i].checked = false;
			}
		}
}

function bottoniElimina(){
		_ambienteModifica.innerHTML = `
		<a href='gestione_categorie.cfm?mode=Aggiungi&categoria=categoria'>  <button class='btn btn-primary'> Aggiungi Categoria</button> </a>
		<a href='gestione_categorie.cfm?mode=Elimina&categoria=${this.value}'>  <button class='btn btn-danger' id='btnElimina'>Elimina Categoria</button> </a`

		for(let i = 0; i < _radiosModifica.length; i++){
			if(_radiosModifica[i].checked == true)
			{
				_radiosModifica[i].checked = false;
			}
		}
}

}