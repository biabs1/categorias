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

% % INICIO EXECUCAO

% modo_generico(Modo):-

%     modoJogo(Modo).

% e_modo_treino:-

%     entrada_receberNomeSobrenomeJogadores(1, [], _).

% e_modo_classico:-

%     entrada_receberNomeSobrenomeJogadores(_, [], _).

% e_modo_alternado:-

%     entrada_receberNomeSobrenomeJogadores(_, [], _).

% modo_treino_selecionado:- mensagem_modoTreinoSelecionado, e_modo_treino.

% modo_alternado_selecionado:- mensagem_modoAlternadoSelecionado, e_modo_alternado.

% modo_classico_selecionado:- mensagem_modoClassicoSelecionado, e_modo_classico.

% loopEscolhaModoJogo:- mensagem_modosJogo, input(X), modoJogo(X).

% modoJogo(1):- modo_treino_selecionado.

% modoJogo(2):- modo_alternado_selecionado.

% modoJogo(3):- modo_classico_selecionado.

% modoJogo(4):- entrada_pegarOpcaoMenu.

% modoJogo(_):- mensagem_opcaoInvalida, loopEscolhaModoJogo.

% adicionarElemento([], X, [X]).

% adicionarElemento([L|R], X, [L|R1]):- adicionarElemento(R, X, R1).

% % FIM EXECUCAO

% % INICIO ENTRADAS

% input(Number):-

%     read_line_to_codes(user_input, Codes),

%     string_to_atom(Codes, Atom),

%     atom_number(Atom, Number).

% receberString(String):-

%     read_line_to_string(user_input, String).

% entrada_pegarOpcaoMenu:- mensagem_menuPrincipal, input(X), opcaoMenu(X).

% opcaoMenu(1):- loopEscolhaModoJogo.

% opcaoMenu(2):- halt(0).

% opcaoMenu(_):- mensagem_opcaoInvalida, entrada_pegarOpcaoMenu.

% entrada_receberNumJogadores(NumParticipantes):-
%     mensagem_numJogadores,
%     input(NumParticipantes),
%     valida_num_jogadores(NumParticipantes,NumParticipantes).

% valida_num_jogadores(X,NumParticipantes):- X >= 2, X =< 8, NumParticipantes is X.

% valida_num_jogadores(_, NumParticipantes):-
%     mensagem_opcaoInvalida,
%     entrada_receberNumJogadores(NumParticipantes).


% entrada_receberNomeSobrenomeJogadores(NumParticipantes,_, NomeSobrenomeJogadoresFinal):-

%     NumParticipantes =:= 0,

%     NomeSobrenomeJogadoresFinal is NomeSobrenomeJogadoresFinal.

% entrada_receberNomeSobrenomeJogadores(NumParticipantes, NomeSobrenomeJogadores, NomeSobrenomeJogadoresFinal):-

%     receberString(NomeSobrenome),

%     adicionarElemento(NomeSobrenome, NomeSobrenomeJogadores, NomeSobrenomeJogadoresFinal),

%     entrada_receberNomeSobrenomeJogadores(NumParticipantes - 1, NomeSobrenomeJogadoresFinal, NomeSobrenomeJogadoresFinal).

% % FIM ENTRADAS

% main:- mensagem_apresentacao, entrada_pegarOpcaoMenu, halt(0).
