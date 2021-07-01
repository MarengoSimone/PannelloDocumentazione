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
		let categoria = document.getElementsByClassName("categoria")[0];
		console.log(categoria);
		_ambienteModifica.innerHTML = `<a href='categorie.cfm'>  <button class='btn btn-warning'> Indietro</button> </a>
		<a href='gestione_ticket.cfm?mode=Aggiungi&categoria=${categoria.value}&nome='''>  <button class='btn btn-primary'> Aggiungi Ticket</button> </a>
		<a href='gestione_ticket.cfm?mode=Aggiorna&nome=${this.value}&categoria=${categoria.value}'>  <button class='btn btn-info' id='btnAggiorna'> Aggiorna Ticket</button> </a>`

		for(let i = 0; i < _radiosElimina.length; i++){
			if(_radiosElimina[i].checked == true)
			{
				_radiosElimina[i].checked = false;
			}
			
		}
}

function bottoniElimina(){
	let categoria = document.getElementsByClassName("categoria")[0];
		_ambienteModifica.innerHTML = `<a href='categorie.cfm'>  <button class='btn btn-warning'> Indietro</button> </a>
		<a href='gestione_ticket.cfm?mode=Aggiungi&categoria=${categoria.value}'&nome='' '>  <button class='btn btn-primary'> Aggiungi Ticket</button> </a>
		<a href='gestione_ticket.cfm?mode=Elimina&nome=${this.value}&categoria=${categoria.value}'>  <button class='btn btn-danger' id='btnElimina'>Elimina Ticket</button> </a`

		for(let i = 0; i < _radiosModifica.length; i++){
			if(_radiosModifica[i].checked == true)
			{
				_radiosModifica[i].checked = false;
			}
		}
}

}