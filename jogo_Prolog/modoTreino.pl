:- use_module(library(clpfd)).

numAleatorio(X, Y, Z):- random(X,Y,Z).

botSabeResposta():- 
	numAleatorio(1,100, Num),
	(Num > 50 -> true; false).
	
definirNomeSobrenomeBots(BotAtual, NumParticipantes, NomeSobrenomeJogadores, Retorno):-
	(BotAtual =:= NumParticipantes -> Retorno = NomeSobrenomeJogadores;
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


%% Método conta o total de linhas do arquivo passado como parametro, incrementando e usando tanto a função see, quando uma função ler(Numero)
contarLinhasArquivo(CategoriaArquivo):-see(CategoriaArquivo),Numero is 0,ler(Numero),seen.

%% Ler recebe um valor inicialmente 0, le o elemento do arquivo atraves do read, e chama conta.
ler(Valor):-read(X),conta(X,Valor).

%% Verifica se é o final do arquivo, se não incrementa mais um ao tamanho.
conta(end_of_file,Final,Tamanho):-!,Tamanho = Final.
conta(_,Numero):- N1 is Numero + 1,ler(N1).

%% Sorteia numero aleatorio para pegar a palavra e o Boot receber.
soteiaNumAleatorio(0 ,Tamanho, LinhaSorteada):- random(0, Tamanho, LinhaSorteada).

%% Vare novamente o arquivo ate achar a linha sorteada e retornar a Palavra.
palavraSorteada(CategoriaArquivo,LinhaSorteada,Palavra):-see(CategoriaArquivo),Numero is 0,ler(LinhaSorteada, Numero,Palavra),seen.
ler(LinhaSorteada,Valor,Palavra):- LinhaSorteada == Valor -> read(Palavra).
ler(_,Valor,Palavra):-read(Palavra),conta(Palavra,Valor).

conta(end_of_file):-!.
conta(Numero):- N1 is Numero + 1,ler(_,N1,_).
