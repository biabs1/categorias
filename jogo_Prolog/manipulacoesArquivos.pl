%% Leio cada linha do arquivo, e chamo a função leiaForn
verificaPalavra(CategoriaArquivo,NomeFornecido,Retorno):-
    open(CategoriaArquivo, read,Stream), 
    repeat,
    read_stream_to_codes(Stream, Codes),
    (   Codes \= end_of_file
    -> atom_codes(Atom, Codes)
    ;   close(Stream),!, fail
    ), 
    split_string(Atom, "\n", "", ListaPalavras),
    comparaPalavra(ListaPalavras,NomeFornecido,Retorno).

comparaPalavra([],_, Retorno):- Retorno=false.
comparaPalavra([X|Y], NomeFornecido, Retorno):-
	(X \= NomeFornecido -> comparaPalavra(Y,NomeFornecido,Retorno); 
	Retorno = true).
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
