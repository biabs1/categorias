:- [manipulacoesArquivos].
:- [sorteiaCategoria].

numAleatorio(X, Y, Z):- random(X,Y,Z).

itemInformadoAntes(X, [X|_]).
itemInformadoAntes(X,[_|Y]):- itemInformadoAntes(X,Y).

cadastrarItemInformadosNaJogada(X, [], Z):- Z = [X].
cadastrarItemInformadosNaJogada(X, Y, Z):- (itemInformadoAntes(X,Y) -> Z = Y; inserirItem(Y,X,Z)).

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

sorteiarCategoria(Categoria):-
    sorteiaCategoria(Categoria),
    Categoria = Categoria + ".txt".

cadastrarItemCategoria(Categoria, Item):-
    colocarPalavra(Categoria,Item).

verificarPalavra(Categoria,Item,Retorno):-
    verificaPalavra(Categoria,Item,Retorno).

