"use strict"

window.onload = function(){
	let _radioModifica = document.getElementsByName("radioModifica")
	let _radioElimina = document.getElementsByName("radioElimina")
	let _ambienteModifica = document.getElementById("ambienteModifica")

	for(let i = 0; i < _radioModifica.length; i++){
		_radioModifica[i].addEventListener("click", bottoniModifica);
	}

	for(let i = 0; i < _radioElimina.length; i++){
		_radioElimina[i].addEventListener("click", bottoniElimina);
	}

	function bottoniModifica(){
		_ambienteModifica.innerHTML = `<a href="modifica_ambienti.cfm?tipo=aggiungi">  <button class='btn btn-primary'>Aggiungi Ambiente</button> </a>
		<a href='modifica_ambienti.cfm?tipo=modifica&ambiente=${this.value}'>  <button class='btn btn-info'>Aggiorna Ambiente</button> </a>`

		for(let i = 0; i < _radioElimina.length; i++){
			if(_radioElimina[i].checked){
				_radioElimina[i].checked = false;
			}
		}
	}

	function bottoniElimina(){
		_ambienteModifica.innerHTML = `<a href="modifica_ambienti.cfm?tipo=aggiungi">  <button class='btn btn-primary'>Aggiungi Ambiente</button> </a>
		<a href='modifica_ambienti.cfm?tipo=elimina&ambiente=${this.value}'>  <button class='btn btn-danger'>Elimina Ambiente</button> </a>`

		for(let i = 0; i < _radioModifica.length; i++){
			if(_radioModifica[i].checked){
				_radioModifica[i].checked = false;
			}
		}
	}
}