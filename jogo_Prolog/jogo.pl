% PLP - 2018.2
% Jogo Categorias.
% Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo e Matheus Medeiros.

:- [execucao].
:- initialization(main).

main:- mensagem_apresentacao, entrada_pegarOpcaoMenu(Opcao), opcaoMenu(Opcao), halt(0).
