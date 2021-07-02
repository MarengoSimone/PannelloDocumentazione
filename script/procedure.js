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
		_bottoni.innerHTML = `<a href="modifica_procedure.cfm?tipo=aggiungi&procedureid=0">  <button class='btn btn-primary'>Aggiungi Procedura</button> </a>
		<a href='modifica_procedure.cfm?tipo=modifica&procedureid=${this.value}'>  <button class='btn btn-info'>Aggiorna Procedura</button> </a>`

		for(let i = 0; i < _radioElimina.length; i++){
			if(_radioElimina[i].checked){
				_radioElimina[i].checked = false;
			}
		}
	}

	function bottoniElimina(){
		_bottoni.innerHTML = `<a href="modifica_procedure.cfm?tipo=aggiungi&procedureid=0">  <button class='btn btn-primary'>Aggiungi Procedura</button> </a>
		<a href='modifica_procedure.cfm?tipo=elimina&procedureid=${this.value}'>  <button class='btn btn-danger'>Elimina Procedura</button> </a>`

		for(let i = 0; i < _radioModifica.length; i++){
			if(_radioModifica[i].checked){
				_radioModifica[i].checked = false;
			}
		}
	}
}