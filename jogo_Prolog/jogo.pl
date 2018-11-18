% PLP - 2018.2
% Jogo Categorias.
% Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo,
% Matheus Medeiros e Wener Wagner.

:- initialization(main).

% Opcoes menu inicial
opcao_invalida(-1).
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

% INICIO MENSAGENS

cabecalho:-
    write("========== JOGO CATEGORIAS =========="),nl,nl.

mensagem_apresentacao:-
    tty_clear,
    cabecalho,
    write("Bem vind@ ao jogo Categorias!"),nl,
    sleep(2),
    write("Você testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias."),
    sleep(3).

mensagem_menuPrincipal:-
    tty_clear,
    cabecalho,
    write("Você deseja começar um novo jogo?"),nl,
    write("1 - Novo Jogo"),nl,
    write("2 - Sair"),nl.

mensagem_opcaoInvalida:-
    write("** Opção inválida! **"),nl,
    write("** Reveja as opções possíveis. **"),nl,
    sleep(3).

mensagem_modosJogo:-
    tty_clear,
    cabecalho,
    write("Digite o número correspondente ao modo que você quer"),nl,
    write("1 - Modo Treino"),nl,
    write("2 - Modo Alternado"),nl,
    write("3 - Modo Clássico"),nl,
    write("4 - Voltar"),nl, nl.

mensagem_modoTreinoSelecionado:-
    tty_clear,
    cabecalho,
    write("Modo Treino selecionado!"),nl,
    sleep(2),
    write("Cuidado para não ser derrotado(a) pelo(s) bot(s)!"),nl,
    sleep(3).

mensagem_modoAlternadoSelecionado:-
    tty_clear,
    cabecalho,
    write("Modo Alternado selecionado!"),nl,
    sleep(2).

mensagem_modoClassicoSelecionado:-
    tty_clear,
    cabecalho,
    write("Modo Clássico selecionado!"),nl,
    sleep(2).

mensagem_numJogadores:-
    tty_clear,
    cabecalho,
    write("Digite a quantidade de jogadores"),nl,
    write("Este valor deve estar entre 2 e 8 inclusive:"),nl.

% FIM MENSAGENS


% INICIO EXECUCAO

modo_generico(Modo):- loopEscolhaNumJogadores(NumJogadores).

modo_treino_selecionado:- mensagem_modoTreinoSelecionado, modo_generico(1).
modo_alternado_selecionado:- mensagem_modoAlternadoSelecionado, modo_generico(2).
modo_classico_selecionado:- mensagem_modoClassicoSelecionado, modo_generico(3).

loopEscolhaModoJogo:- mensagem_modosJogo, input(X), modoJogo(X).

modoJogo(X):- modo_treino(X), modo_treino_selecionado.
modoJogo(X):- modo_alternado(X), modo_alternado_selecionado.
modoJogo(X):- modo_classico(X), modo_classico_selecionado.
modoJogo(X):- voltar(X), entrada_pegarOpcaoMenu.
modoJogo(X):- mensagem_opcaoInvalida, loopEscolhaModoJogo.

loopEscolhaNumJogadores(NumJogadores):-
    mensagem_numJogadores,
    input(X),
    valida_num_jogadores(X, NumJogadores),
    write(NumJogadores).

valida_num_jogadores(X, NumJogadores):- X >= 2, X =< 8, NumJogadores is X.
valida_num_jogadores(X, NumJogadores):-
    mensagem_opcaoInvalida,
    loopEscolhaNumJogadores(NumJogadores).

% FIM EXECUCAO


% INICIO ENTRADAS

input(Number):-
    read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Number).

entrada_pegarOpcaoMenu:- mensagem_menuPrincipal, input(X), opcaoMenu(X).

opcaoMenu(X):- novo_jogo(X), loopEscolhaModoJogo.
opcaoMenu(X):- saida(X), halt(0).
opcaoMenu(X):- mensagem_opcaoInvalida, entrada_pegarOpcaoMenu.

% FIM ENTRADAS

main:- mensagem_apresentacao, entrada_pegarOpcaoMenu.
