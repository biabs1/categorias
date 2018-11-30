categoria(0,Categoria):-
	Categoria = 'animais'.
categoria(1,Categoria):-
	Categoria = 'cores'.
categoria(2,Categoria):-
	Categoria = 'esportes'.
categoria(3,Categoria):-
	Categoria = 'frutas'.
categoria(4,Categoria):-
	Categoria = 'lps'.
categoria(5,Categoria):-
	Categoria = 'paises'.
categoria(6,Categoria):-
	Categoria = 'verduras_legumes'.

sorteiaCategoria(Categoria):-
	random(0, 6, CategoriaSorteada),
	categoria(CategoriaSorteada, Categoria).

sorteiarCategoria(Categoria):-
	sorteiaCategoria(Categoria),
	Categoria = Categoria + ".txt".
