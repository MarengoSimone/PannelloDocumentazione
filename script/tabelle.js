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
			let id = document.getElementsByClassName("id")[0];
			_ambienteModifica.innerHTML = `
			<a href='gestione_tabelle.cfm?mode=Aggiungi&id=${this.value}'>  <button class='btn btn-primary'> Aggiungi Tabella</button> </a>
			<a href='gestione_tabelle.cfm?mode=Aggiorna&id=${this.value}'>  <button class='btn btn-info' id='btnAggiorna'> Aggiorna Tabella</button> </a>`

			for(let i = 0; i < _radiosElimina.length; i++){
				_radiosElimina[i].checked = false;
			}
	}

	function bottoniElimina(){
			_ambienteModifica.innerHTML = `
			<a href='gestione_tabelle.cfm?mode=Aggiungi&id=${this.value}'>  <button class='btn btn-primary'> Aggiungi Tabella</button> </a>
			<a href='gestione_tabelle.cfm?mode=Elimina&id=${this.value}'>  <button class='btn btn-danger' id='btnElimina'>Elimina Tabella </button> </a`

			for(let i = 0; i < _radiosModifica.length; i++){
				_radiosModifica[i].checked = false;
			}
	}

}