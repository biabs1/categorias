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

% FIM MENSAGENS


% INICIO ENTRADAS

input(Number):-
    read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Number).

entrada_pegarOpcaoMenu:- mensagem_menuPrincipal, input(X), novo_jogo(X), write("Novo jogo").
entrada_pegarOpcaoMenu:- mensagem_menuPrincipal, input(X), saida(X), halt(0).
entrada_pegarOpcaoMenu:- mensagem_menuPrincipal, input(X), opcao_invalida(X), mensagem_opcaoInvalida, entrada_pegarOpcaoMenu.

% FIM ENTRADAS

main:- mensagem_apresentacao, entrada_pegarOpcaoMenu.
