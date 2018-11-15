% PLP - 2018.2
% Jogo Categorias.
% Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo,
% Matheus Medeiros e Wener Wagner.

:- initialization(main).

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

% FIM MENSAGENS

main:- mensagem_apresentacao.
