:- initialization main.

numAleatorio(X, Y, Z):- random(X,Y,Z).

itemInformadoAntes(X, [X|_]).
itemInformadoAntes(X,[_|Y]):- itemInformadoAntes(X,Y).


cadastrarItemInformadosNaJogada(X, [], Z):- Z = [X].
cadastrarItemInformadosNaJogada(X, Y, Z):- (itemInformadoAntes(X,Y) -> Z = Y; inserirItem(Y,X,Z)).

inserirItem([], X, [X]).
inserirItem([L|R], X, [L|R1]):-inserirItem(R, X, R1). 

nomeJogadorIndice([], IndiceAtual, IndiceJogador, Retorno):- Retorno = "Jogador inexistente".
nomeJogadorIndice([Jogador|Jogadores], IndiceAtual, IndiceJogador, Retorno):-
    (IndiceAtual =:= IndiceJogador -> Retorno = Jogador;
    Z is IndiceAtual + 1,
    nomeJogadorIndice(Jogadores, Z, IndiceJogador, Retorno)).
    
input(Number):-

    read_line_to_codes(user_input, Codes),

    string_to_atom(Codes, Atom),

    atom_number(Atom, Number).

main:- removerJogador("A", ["L", "A", "B"], W), writeln(W).
    
removerJogador(NomeJogador, [NomeJogador|Jogadores], Jogadores).
removerJogador(NomeJogador, [Jogador|Jogadores], [Jogador|Retorno]):-
    removerJogador(NomeJogador,Jogadores,Retorno). 
    
  
concat([],L,L).
concat([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).
