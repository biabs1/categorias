:- set_prolog_flag(verbose,silent).
:- prompt(_, '').
:- use_module(library(readutil)).
:- use_module(Mensagens).


:- dynamic categoriaSorteada/1.


debug :- listing(categoriaSorteada).
main:-
	process,
	halt.

sorteiaCategoria(Categoria):- 
	CategoriaSorteada is random(8),
    categoria(CategoriaSorteada, Categoria).
	
categoria(0,Categoria):-
	Categoria = 'animais'.
categoria(1,Categoria):-
	Categoria = 'categorias'.
categoria(2,Categoria):-
	Categoria = 'cores'.
categoria(3,Categoria):-
	Categoria = 'esportes'.
categoria(4,Categoria):-
	Categoria = 'frutas'.
categoria(5,Categoria):-
	Categoria = 'lps'.
categoria(6,Categoria):-
	Categoria = 'paises'.
categoria(7,Categoria):-
	Categoria = 'verduras_legumes'.

	
process:-
    sorteiaCategoria(Categoria),
    mensagem_categoriaSorteada(Categoria),
	true.

:- main.