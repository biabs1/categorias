numAleatorio(X, Y, Z):- random(X,Y,Z).

botSabeResposta():- 
	numAleatorio(1,100, Num),
	(Num > 50 -> true; false).
	
definirNomeSobrenomeBots(BotAtual, NumParticipantes, NomeSobrenomeJogadores, Retorno):-
	(BotAtual == NumParticipantes -> Retorno = NomeSobrenomeJogadores;
	Pos is BotAtual + 1,
	concatenaNomeBot(Pos, NomeBot),
	concatenaListas(NomeSobrenomeJogadores, [NomeBot], NovoNomeSobrenomeJogadores), 
	definirNomeSobrenomeBots(Pos, NumParticipantes, NovoNomeSobrenomeJogadores, Retorno)).
	

jogadorEBot(NomeJogador, Pos, R):- 
	concatenaNomeBot(Pos, NomeBot),
	((NomeJogador \= NomeBot) -> R=false;
	R = true).

concatenaListas([],L,L).
concatenaListas([X|L1],L2,[X|L3]):- concatenaListas(L1,L2,L3).

concatenaNomeBot(Pos, NomeBot):-
	atom_concat("Bot",Pos,Y),
	atom_concat(Y, " Smith", A),
	atom_string(A,NomeBot).


sortearPalavra(X, Y):- random(Tamanho, LinhaSorteada).

