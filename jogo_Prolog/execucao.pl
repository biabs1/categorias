:- [entradas].
:- [modoTreino].
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
		write(NomeSobrenomeJogadoresFinal), ln.
e_modo_treino(Modo, NumJogadores):-
    entrada_receberNomeSobrenomeJogadores(NumJogadores, [], NomeSobrenomeJogadores).
		write(NomeSobrenomeJogadores), ln.

loopEscolhaNumJogadores(NumJogadores):-
    mensagem_numJogadores,
    imprimePrompt,
    receberNumero(X),
    valida_num_jogadores(X, NumJogadores).

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
