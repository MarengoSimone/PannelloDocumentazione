"use strict"

window.onload = function(){
	let _radioModifica = document.getElementsByName("radioModifica")
	let _radioElimina = document.getElementsByName("radioElimina")
	let _bottoni = document.getElementById("bottoni")

	for(let i = 0; i < _radioModifica.length; i++){
		_radioModifica[i].addEventListener("click", bottoniModifica);
	}

	for(let i = 0; i < _radioElimina.length; i++){
		_radioElimina[i].addEventListener("click", bottoniElimina);
	}

	function bottoniModifica(){
		_bottoni.innerHTML = `<a href="modifica_pagine.cfm?tipo=aggiungi">  <button class='btn btn-primary'>Aggiungi Pagina</button> </a>
		<a href='modifica_pagine.cfm?tipo=modifica&pagid=${this.value}'>  <button class='btn btn-info'>Aggiorna Pagina</button> </a>`

		for(let i = 0; i < _radioElimina.length; i++){
			if(_radioElimina[i].checked){
				_radioElimina[i].checked = false;
			}
		}
	}

	function bottoniElimina(){
		_bottoni.innerHTML = `<a href="modifica_pagine.cfm?tipo=aggiungi">  <button class='btn btn-primary'>Aggiungi Pagina</button> </a>
		<a href='modifica_pagine.cfm?tipo=elimina&pagid=${this.value}'>  <button class='btn btn-danger'>Elimina Pagina</button> </a>`

		for(let i = 0; i < _radioModifica.length; i++){
			if(_radioModifica[i].checked){
				_radioModifica[i].checked = false;
			}
		}
	}
}