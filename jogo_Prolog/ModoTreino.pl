numAleatorio(X, Y, Z):- random(X,Y,Z).

botSabeResposta():- 
	numAleatorio(1,100, Num),
	(Num > 50 -> true; false).
	
definirNomeSobrenomeBots(BotAtual, NumParticipantes, NomeSobrenomeJogadores, Retorno):- 
	(BotAtual =:= NumParticipantes -> Retorno = NomeSobrenomeJogadores; 
	atom_concat("Bot",BotAtual,Y),
	atom_concat(Y, " Smith", A),
	X is BotAtual + 1,
	definirNomeSobrenomeBots(X,NumParticipantes,(NomeSobrenomeJogadores + [A]),Retorno).

jogadorEBot(NomeJogador, Pos, R):- 
	atom_concat("Bot",Pos,Y),
	atom_concat(Y, " Smith", A),
	(NomeJogador =:= A -> R=true;
	R= false).

concat([],L,L).
concat([X|L1],L2,[X|L3]):- concat(L1,L2,L3).


