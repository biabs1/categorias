:- [mensagens].
:- [manipulacoesArquivos].
:- [modoTreino].
:- [modoClassico].

receberNumero(Number):-
    read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Number).

receberString(String):- read_line_to_string(user_input, String).

entrada_pegarOpcaoMenu(Opcao):- mensagem_menuPrincipal, imprimePrompt, receberNumero(Opcao).

entrada_receberNomeSobrenomeJogadores(NumParticipantes, NomeSobrenomeJogadores, NomeSobrenomeJogadoresFinal):-
    NumParticipantes =:= 0,
    NomeSobrenomeJogadoresFinal = NomeSobrenomeJogadores.

entrada_receberNomeSobrenomeJogadores(NumParticipantes, NomeSobrenomeJogadores, NomeSobrenomeJogadoresFinal):-
    mensagem_nomeJogadores,
    imprimePrompt,
    receberString(NomeSobrenome),
    concatenaListas(NomeSobrenomeJogadores, [NomeSobrenome], NovoNomeSobrenomeJogadores),
    entrada_receberNomeSobrenomeJogadores(NumParticipantes - 1,  NovoNomeSobrenomeJogadores, NomeSobrenomeJogadoresFinal).

entrada_receberItem(JogadorAtual,Categoria,Retorno):-
    receberString(Item),
    Item =:= '#' -> removerJogador(JogadorAtual,_,_), mensagem_perdedor(JogadorAtual),
    %verificaItensInformados(Item,ItensInformados,Retorno),
    %Retorno =:= true -> mensagem_palavraCategoriaJaDita, removerJogador(JogadorAtual,_,_),mensagem_perdedor(JogadorAtual),
    verificaPalavra(Categoria,Item,Retorno),
    Retorno =:= false -> mensagem_palavraNaoCadastrada, receberString(Resposta), 
	Resposta =:= 's', colocarPalavra(Categoria,Item), 
    Resposta =:= 'n', removerJogador(JogadorAtual,_,_), mensagem_perdedor(JogadorAtual).
    %Retorno =:= true -> adicionarElemento(ItensInformados, Item,_), mensagem_itemAceito.
