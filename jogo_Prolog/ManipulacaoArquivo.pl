principal(CategoriaArquivo,NomeFornecido,Retorno):-
    open(CategoriaArquivo,read,AEnt),
    leiaForn(AEnt,NomeFornecido,Retorno),
    close(AEnt).

leiaForn(AEnt,_,Retorno):-
    at_end_of_stream(AEnt),Retorno = false,!.

leiaForn(AEnt,NomeFornecido,Retorno):-
    (AEnt == NomeFornecido -> Retorno = true),!.


%% Colocar no arquivo

colocar(CategoriaArquivo,NomeFornecido):-
    open(CategoriaArquivo,write ,ASaida),
    write(ASaida,NomeFornecido),write(ASaida,'\n'),!,
    close(ASaida).




