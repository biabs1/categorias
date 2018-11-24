%% Leio cada linha do arquivo, e chamo a função leiaForn
verificaPalavra(CategoriaArquivo,NomeFornecido,Retorno):-
    open(CategoriaArquivo,read,AEnt),
    leiaForn(AEnt,NomeFornecido,Retorno),
    close(AEnt).

%% Verifica se chegou ao final do arquivo, se sim, retorna false, pois nao achou o nome fornecido pelo usuario
leiaForn(AEnt,_,Retorno):-
    at_end_of_stream(AEnt),Retorno = false,!.

%% Verifica se a linha do arquivo lida atualmente é igual ao nome fornecido, se sim, returna true, e termina a execução
leiaForn(AEnt,NomeFornecido,Retorno):-
    (AEnt == NomeFornecido -> Retorno = true),!.

%% Coloca um nome fornecido no final do arquivo
colocarPalavra(CategoriaArquivo,NomeFornecido):-
    open(CategoriaArquivo,write ,ASaida),
    write(ASaida,NomeFornecido),write(ASaida,'\n'),!,
    close(ASaida).
