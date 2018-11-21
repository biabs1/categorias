% PLP - 2018.2
% Jogo Categorias.
% Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo e Matheus Medeiros.

:- [mensagens].
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


% INICIO EXECUCAO

modo_generico(Modo):- loopEscolhaNumJogadores(NumJogadores).

loopEscolhaNumJogadores(NumJogadores):-
    mensagem_numJogadores,
    input(X),
    valida_num_jogadores(X, NumJogadores),
    write(NumJogadores).

valida_num_jogadores(X, NumJogadores):- X >= 2, X =< 8, NumJogadores is X.
valida_num_jogadores(_, NumJogadores):-
    mensagem_opcaoInvalida,
    loopEscolhaNumJogadores(NumJogadores).

modo_treino_selecionado:- mensagem_modoTreinoSelecionado, modo_generico(1).
modo_alternado_selecionado:- mensagem_modoAlternadoSelecionado, modo_generico(2).
modo_classico_selecionado:- mensagem_modoClassicoSelecionado, modo_generico(3).

loopEscolhaModoJogo:- mensagem_modosJogo, input(X), modoJogo(X).

modoJogo(X):- modo_treino(X), modo_treino_selecionado.
modoJogo(X):- modo_alternado(X), modo_alternado_selecionado.
modoJogo(X):- modo_classico(X), modo_classico_selecionado.
modoJogo(X):- voltar(X), entrada_pegarOpcaoMenu.
modoJogo(_):- mensagem_opcaoInvalida, loopEscolhaModoJogo.

% FIM EXECUCAO


% INICIO ENTRADAS

input(Number):-
    read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Number).

entrada_pegarOpcaoMenu:- mensagem_menuPrincipal, input(X), opcaoMenu(X).

opcaoMenu(X):- novo_jogo(X), loopEscolhaModoJogo.
opcaoMenu(X):- saida(X), halt(0).
opcaoMenu(_):- mensagem_opcaoInvalida, entrada_pegarOpcaoMenu.

% FIM ENTRADAS

main:- mensagem_apresentacao, entrada_pegarOpcaoMenu.


%%Abaixo ta o jeito que eu fiz esse codigo ai de cima.

% % PLP - 2018.2

% % Jogo Categorias.

% % Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo e Matheus Medeiros.

% :- [mensagens].

% :- initialization(main).

% % Opcoes menu inicial

% opcao_invalida(-1).

% novo_jogo(1).

% saida(2).

% % Opcoes menu modos

% modo_nao_selecionado(-1).

% modo_treino(1).

% modo_alternado(2).

% modo_classico(3).

% voltar(4).

% % Numero de jogadores

% num_minimo_jogadores(2).

% num_maximo_jogadores(8).

% num_jogadores_invalido(-1).


