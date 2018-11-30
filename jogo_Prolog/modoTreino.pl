:- [aux].
:- use_module(library(clpfd)).

numAleatorio(X, Y, Z):- random(X,Y,Z).

botSabeResposta:-
	numAleatorio(1,100, Num),
	(Num > 50 -> true; false).

definirNomeSobrenomeBots(BotAtual, NumParticipantes, NomeSobrenomeJogadores, Retorno):-
	(BotAtual =:= NumParticipantes - 1 -> Retorno = NomeSobrenomeJogadores;
	Pos is BotAtual + 1,
	concatenaNomeBot(Pos, NomeBot),
	concatenaListas(NomeSobrenomeJogadores, [NomeBot], NovoNomeSobrenomeJogadores),
	definirNomeSobrenomeBots(Pos, NumParticipantes, NovoNomeSobrenomeJogadores, Retorno)).

concatenaNomeBot(Pos, NomeBot):-
	atom_concat("Bot",Pos,Y),
	atom_concat(Y, " Smith", A),
	atom_string(A,NomeBot).

jogadorEBot(NomeJogador, R):-
	split_string(NomeJogador, " ", "", L),
	pegaCalda(L,N),
	(N \= "Smith" -> R=false; R=true).

concatenaNomeBot(Pos, NomeBot):-
	atom_concat("Bot", Pos, Y),
	atom_concat(Y, " Smith", A),
	atom_string(A, NomeBot).

sorteiaItemCategoria(Categoria, Palavra):-
	concatenaDiretorio(Categoria,Diretorio),
	numItensCadastradosCategoria(Categoria, NumLinhas),
	numAleatorio(0, NumLinhas,LinhaSorteada),
	palavraSorteada(Diretorio, LinhaSorteada, Palavra).
	
palavraSorteada(CategoriaArquivo,LinhaSorteada,Palavra):-
    open(CategoriaArquivo, read, Stream), repeat,
    read_stream_to_codes(Stream, Codes),
    (Codes \= end_of_file -> atom_codes(Atom, Codes); close(Stream),!, fail), 
    split_string(Atom, "\n", "", ListaPalavras),
    definePalavra(ListaPalavras,LinhaSorteada,0,Palavra).

definePalavra([],_,_,Palavra):- Palavra = "erro".
definePalavra([X|Y],LinhaSorteada,NumAtual,Palavra):-
	(NumAtual =:= LinhaSorteada -> Palavra = X;
	N is NumAtual + 1,
	definePalavra(Y,LinhaSorteada,N,Palavra)).
