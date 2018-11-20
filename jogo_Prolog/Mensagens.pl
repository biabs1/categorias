% Mensagens do Jogo

cabecalho:-
    writeln("========== JOGO CATEGORIAS =========="),nl.

mensagem_apresentacao:-
    tty_clear, cabecalho,
    writeln("Bem vind@ ao jogo Categorias!"),
    sleep(2),
    writeln("Você testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias."),
    sleep(3).

mensagem_menuPrincipal:-
    tty_clear, cabecalho,
    writeln("Você deseja começar um novo jogo?"), writeln("1 - Novo Jogo"), writeln("2 - Sair").

mensagem_opcaoInvalida:-
    writeln("** Opção inválida! **"), writeln("** Reveja as opções possíveis. **"),
    sleep(3).

mensagem_modosJogo:-
    tty_clear, cabecalho,
    writeln("Digite o número correspondente ao modo que você quer"), 
    writeln("1 - Modo Treino"), writeln("2 - Modo Alternado"), writeln("3 - Modo Clássico"), writeln("4 - Voltar").

mensagem_modoTreinoSelecionado:-
    tty_clear, cabecalho,
    writeln("Modo Treino selecionado!"),
    sleep(2),
    writeln("Cuidado para não ser derrotado(a) pelo(s) bot(s)!"),
    sleep(3).

mensagem_modoAlternadoSelecionado:-
    tty_clear, cabecalho,
    writeln("Modo Alternado selecionado!"),
    sleep(2).
    
mensagem_modoClassicoSelecionado:-
    tty_clear, cabecalho,
    writeln("Modo Clássico selecionado!"),
    sleep(2).

mensagem_numJogadores:-
    tty_clear, cabecalho,
    writeln("Digite a quantidade de jogadores"), writeln("Este valor deve estar entre 2 e 8 inclusive:").

mensagem_nomeJogadores:-
    tty_clear, cabecalho,
    writeln("Digite o nome e sobrenome do(s) jogador(es) humano(s)"), writeln("Um jogador por linha:").

mensagem_categoriaSorteada(categoriaSorteada):-
    tty_clear, cabecalho,
    write("Categoria sorteada: "), writeln(categoriaSorteada), nl,
    writeln("Cada jogador deverá informar um ítem pertencente à categoria sorteada."), 
    writeln("Caso não se recorde de algum item, digite #"),
    sleep(5).

mensagem_informarPalavraCategoria(categoriaSorteada, nomeJogador):-
    tty_clear, cabecalho,
    write("Categoria: "), writeln(categoriaSorteada), write("Vez do jogador: "), writeln(nomeJogador),
    writeln("Informe um ítem desta categoria (sem acentos): "),

mensagem_itemAceito:-
    nl, writeln("Item aceito!"),
    sleep(1).

mensagem_palavraNaoCadastrada:-
    nl, writeln("ATENÇÃO! Esta palavra não está cadastrada!"), nl,
    writeln("Este ítem pertence mesmo a esta categoria? s/n").

mensagem_vencedor(nomeJogador):-
    tty_clear, cabecalho,
    write("O vencedor da vez é: "), write(nomeJogador), writeln(". Parabéns!"),
    sleep(4).

mensagem_perdedor(nomeJogador):-
    tty_clear, cabecalho,
    write("Que pena, "), write(nomeJogador), writeln(" está fora do jogo!"),
    sleep(4).

mensagem_modoAlternadoSorteio(categoriaSorteada):-
    tty_clear, cabecalho,
    writeln("Modo Alternado"), write("Uma nova categoria foi sorteada: "), writeln(categoriaSorteada),
    sleep(3).
