concatenaDiretorio(Categoria, Diretorio):-
	atom_concat(Categoria, '.txt', C),
	atom_string(C, CategorioArquivo),
	atom_concat('../palavras/', CategorioArquivo, D),
	atom_string(D, Diretorio).

numItensCadastradosCategoria(Categoria, NumLinhas):-
	concatenaDiretorio(Categoria, Diretorio),
	numLinhasArquivo(Diretorio, NumLinhas).

itemCadastradoCategoria(Categoria, Palavra, Retorno):-
	concatenaDiretorio(Categoria, Diretorio),
	verificaPalavra(Diretorio, Palavra, Retorno).

cadastrarItemCategoria(Categoria, Palavra):-
	concatenaDiretorio(Categoria, Diretorio),
	colocarPalavra(Diretorio, Palavra).

pegaCalda([X], X).
pegaCalda([_|Y], R):- pegaCalda(Y,R).

concatenaListas([],L,L).
concatenaListas([X|L1],L2,[X|L3]):- concatenaListas(L1,L2,L3).

adicionarElemento([], X, [X]).
adicionarElemento([L|R], X, [L|R1]):- adicionarElemento(R, X, R1).
