:- [manipulacoesArquivos].
:- [sorteiaCategoria].

itemInformadoAntes(X, [X|_]).
itemInformadoAntes(X,[_|Y]):- itemInformadoAntes(X,Y).

cadastrarItemInformadosNaJogada(X, [], Z):- Z = [X].
cadastrarItemInformadosNaJogada(X, Y, Z):- (itemInformadoAntes(X,Y) -> Z = Y; inserirItem(Y,X,Z)).

numItensCadastradosCategoria(Categoria, NumLinhas):- 
	concatenaDiretorio(Categoria, Diretorio),
	numLinhasArquivo(Diretorio,NumLinhas).

itemCadastradoCategoria(Categoria, Palavra, Retorno):-
	concatenaDiretorio(Categoria, Diretorio),
	verificaPalavra(Diretorio, Palavra, Retorno).

cadastrarItemCategoria(Categoria,Palavra):-
	concatenaDiretorio(Categoria, Diretorio),
	colocarPalavra(Diretorio, Palavra).

concatenaDiretorio(Categoria, Diretorio):-
	atom_concat(Categoria, '.txt', C),
	atom_string(C,CategorioArquivo),
	atom_concat('../palavras/', CategorioArquivo, D),
	atom_string(D,Diretorio).

inserirItem([], X, [X]).
inserirItem([L|R], X, [L|R1]):-inserirItem(R, X, R1).


nomeJogadorIndice([], _, _, Retorno):- Retorno = "Jogador inexistente".
nomeJogadorIndice([Jogador|Jogadores], IndiceAtual, IndiceJogador, Retorno):-
    (IndiceAtual =:= IndiceJogador -> Retorno = Jogador;
    Z is IndiceAtual + 1,
    nomeJogadorIndice(Jogadores, Z, IndiceJogador, Retorno)).

removerJogador(NomeJogador, [NomeJogador|Jogadores], Jogadores).
removerJogador(NomeJogador, [Jogador|Jogadores], [Jogador|Retorno]):-
    removerJogador(NomeJogador,Jogadores,Retorno).
