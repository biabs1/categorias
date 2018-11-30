itemInformadoAntes(X, [X|_]).
itemInformadoAntes(X,[_|Y]):- itemInformadoAntes(X,Y).

cadastrarItemInformadoNaJogada(X, [], Z):- Z = [X].
cadastrarItemInformadoNaJogada(X, Y, Z):- (itemInformadoAntes(X,Y) -> Z = Y; inserirItem(Y,X,Z)).

inserirItem([], X, [X]).
inserirItem([L|R], X, [L|R1]):- inserirItem(R, X, R1).

nomeJogadorIndice([], _, _, Retorno):- Retorno = "Jogador inexistente".
nomeJogadorIndice([Jogador|Jogadores], IndiceAtual, IndiceJogador, Retorno):-
    (IndiceAtual =:= IndiceJogador -> Retorno = Jogador;
    Z is IndiceAtual + 1,
    nomeJogadorIndice(Jogadores, Z, IndiceJogador, Retorno)).

removerJogador(NomeJogador, [NomeJogador|Jogadores], Jogadores).
removerJogador(NomeJogador, [Jogador|Jogadores], [Jogador|Retorno]):- removerJogador(NomeJogador,Jogadores,Retorno).
