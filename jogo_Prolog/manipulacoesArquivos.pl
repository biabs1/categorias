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
    open(CategoriaArquivo,append,Stream),
    write(Stream,NomeFornecido), nl(Stream),
    close(Stream). 

numLinhasArquivoAux(Conteudo, NumLinhas) :-
    \+ at_end_of_stream(Conteudo),
    !,
    get_code(Conteudo, X),
    numLinhasArquivoAux(Conteudo, NumLinhasAtual),
    ((X = 10, NumLinhas is NumLinhasAtual + 1); NumLinhas is NumLinhasAtual).

numLinhasArquivoAux(_Conteudo, 0).

% Conta a quantidade de linhas de um dado arquivo.
numLinhasArquivo(EnderecoArquivo, NumLinhas) :-
    open(EnderecoArquivo, read, Conteudo),
    numLinhasArquivoAux(Conteudo, NumLinhas),
    !,
    close(Conteudo).
