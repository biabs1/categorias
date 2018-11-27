:- [entradas].
:- [modoTreino].
:- [modoClassico].
:- [mensagens].
:- [sorteiaCategoria].

% Opcoes menu inicial
novo_jogo(1).
saida(2).

% Opcoes menu modos
modo_nao_selecionado(-1).
modo_treino(1).
modo_alternado(2).
modo_classico(3).
voltar(4).

% Numero de jogadores
num_minimo_jogadores(2).
num_maximo_jogadores(8).
num_jogadores_invalido(-1).

opcaoMenu(Opcao):- novo_jogo(Opcao), loopEscolhaModoJogo.
opcaoMenu(Opcao):- saida(Opcao), halt(0).
opcaoMenu(_):- mensagem_opcaoInvalida, entrada_pegarOpcaoMenu(NovaOpcao), opcaoMenu(NovaOpcao).

modo_generico(Modo):-
    loopEscolhaNumJogadores(NumJogadores),
    mensagem_nomeJogadores,
    e_modo_treino(Modo, NumJogadores).

e_modo_treino(Modo, NumJogadores):-
    modo_treino(Modo),
    entrada_receberNomeSobrenomeJogadores(1, [], NomeSobrenomeJogadores),
	definirNomeSobrenomeBots(0, NumJogadores, NomeSobrenomeJogadores, NomeSobrenomeJogadoresFinal),
    fluxo_comum(Modo, NomeSobrenomeJogadoresFinal).

e_modo_treino(Modo, NumJogadores):-
    entrada_receberNomeSobrenomeJogadores(NumJogadores, [], NomeSobrenomeJogadores),
    fluxo_comum(Modo, NomeSobrenomeJogadores).

fluxo_comum(Modo, NomeSobrenomeJogadores):-
    mensagem_jogadoresCadastrados(NomeSobrenomeJogadores),
    sorteiaCategoria(Categoria),
    mensagem_categoriaSorteada(Categoria),
    loopRestaMaisDeUmJogador(Modo, Categoria, NomeSobrenomeJogadores),
    entrada_pegarOpcaoMenu(Opcao).

loopEscolhaNumJogadores(NumJogadores):-
    mensagem_numJogadores,
    imprimePrompt,
    receberNumero(X),
    valida_num_jogadores(X, NumJogadores).

loopRestaMaisDeUmJogador(Modo, CategoriaSorteada, NomeSobrenomeJogadores):-
    length(NomeSobrenomeJogadores, Tamanho),
    Tamanho =:= 1,
    mensagem_vencedor(NomeSobrenomeJogadores),!.

loopRestaMaisDeUmJogador(Modo, CategoriaSorteada, NomeSobrenomeJogadores):-
    length(NomeSobrenomeJogadores,Tamanho),
    Tamanho > 1,
    loopRecebePalavraJogadores(Modo, CategoriaSorteada, NomeSobrenomeJogadores, _, NomeSobrenomeJogadoresRestantes, _),
    loopRestaMaisDeUmJogador(Modo, CategoriaSorteada, NomeSobrenomeJogadoresRestantes).

loopRecebePalavraJogadores(Modo, CategoriaSorteada, [JogadorAtual|DemaisJogadores], ItensInformados, NomeSobrenomeJogadoresRestantes, ItensInformadosAtual):-
    mensagem_informarPalavraCategoria(CategoriaSorteada, JogadorAtual),
    recebePalavra(Modo, CategoriaSorteada, JogadorAtual, ItensInformados, ItensInformadosAtual),
    length(ItensInformados, TamanhoItensInformados), length(ItensInformadosAtual, TamanhoItensInformadosAtual),
    (TamanhoItensInformados =:= TamanhoItensInformadosAtual, NomeSobrenomeJogadoresRestantes = DemaisJogadores;
     NomeSobrenomeJogadoresRestantes = [JogadorAtual|DemaisJogadores]),
    loopRecebePalavraJogadores(Modo, CategoriaSorteada, DemaisJogadores, ItensInformados, NomeSobrenomeJogadoresRestantes, ItensInformadosAtual).

% O jogador é um bot.
recebePalavra(Modo, CategoriaSorteada, JogadorAtual, ItensInformados, ItensInformadosAtual):-
    modo_treino(Modo),
    jogadorEBot(), %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BUG INSERTED!!!
    botSabeResposta(Resultado),
    recebeRespostaBot(Resultado, Resposta).
    writeln(Resposta).

% O jogador é um humano.
recebePalavra(Modo, CategoriaSorteada, JogadorAtual, ItensInformados, ItensInformadosAtual):-
    receberString(Resposta),
    writeln(Resposta).

recebeRespostaBot(SabeResponder, Resposta):-
    SabeResponder =:= true, Resposta = "Sera sorteada".

recebeRespostaBot(SabeResponder, Resposta):-
    Resposta = "#".

valida_num_jogadores(X, NumJogadores):- X >= 2, X =< 8, NumJogadores is X.
valida_num_jogadores(_, NumJogadores):-
    mensagem_opcaoInvalida,
    loopEscolhaNumJogadores(NumJogadores).

modo_treino_selecionado:- mensagem_modoTreinoSelecionado, modo_generico(1).
modo_alternado_selecionado:- mensagem_modoAlternadoSelecionado, modo_generico(2).
modo_classico_selecionado:- mensagem_modoClassicoSelecionado, modo_generico(3).

modoJogo(ModoEscolhido):- modo_treino(ModoEscolhido), modo_treino_selecionado.
modoJogo(ModoEscolhido):- modo_alternado(ModoEscolhido), modo_alternado_selecionado.
modoJogo(ModoEscolhido):- modo_classico(ModoEscolhido), modo_classico_selecionado.
modoJogo(ModoEscolhido):- voltar(ModoEscolhido), entrada_pegarOpcaoMenu(NewOption), opcaoMenu(NewOption).
modoJogo(_):- mensagem_opcaoInvalida, loopEscolhaModoJogo.

loopEscolhaModoJogo:- mensagem_modosJogo, receberNumero(X), modoJogo(X).
