:- set_prolog_flag(verbose,silent).
:- prompt(_, '').
:- use_module(library(readutil)).

:- dynamic categoriaSorteada/1.


debug :- listing(categoriaSorteada).
main:-
	process,
	halt.

sorteiaCategoria:- 
	CategoriaSorteada is random(8),
	categoria(CategoriaSorteada).
	
categoria(0):-
	assert(categoriaSorteada(animais)),
	mensagem_categoriaSorteada(categoriaSorteada).
categoria(1):-
	assert(categoriaSorteada(categorias)),
	mensagem_categoriaSorteada(categoriaSorteada).
categoria(2):-
	assert(categoriaSorteada(cores)),
	mensagem_categoriaSorteada(categoriaSorteada).
categoria(3):-
	assert(categoriaSorteada(esportes)),
	mensagem_categoriaSorteada(categoriaSorteada).
categoria(4):-
	assert(categoriaSorteada(frutas)),
	mensagem_categoriaSorteada(categoriaSorteada).
categoria(5):-
	assert(categoriaSorteada(lps)),
	mensagem_categoriaSorteada(categoriaSorteada).
categoria(6):-
	assert(categoriaSorteada(paises)),
	mensagem_categoriaSorteada(categoriaSorteada).
categoria(7):-
	assert(categoriaSorteada(verduras_legumes)),
	mensagem_categoriaSorteada(categoriaSorteada).
	
mensagem_categoriaSorteada(categoriaSorteada):-
	write(categoriaSorteada).
	
process:-
	sorteiaCategoria,
	true.

:- main.