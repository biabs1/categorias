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

contarLinhasArquivo(CategoriaArquivo,Tamanho):-see(CategoriaArquivo),Numero is 0,ler(Numero),seen.
ler(Valor):-read(X),conta(X,Valor).

conta(end_of_file,Final,Tamanho):-!,Tamanho = Final.
conta(_,Numero):- N1 is Numero + 1,ler(N1).

soteiaNumAleatorio(0 ,X, Y):- random(0, Tamanho, LinhaSorteada).



