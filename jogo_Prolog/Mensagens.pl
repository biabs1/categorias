% Implementação das mensagens

cabecalho:-
    write("========== JOGO CATEGORIAS =========="),nl,nl.


mensagem_apresentacao:-
    clear(),
    cabecalho,
    write("Bem vind@ ao jogo Categorias!"),nl,
    sleep(2),
    write("Você testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias."),
    sleep(3).

mensagem_menuPrincipal:-
    clear(),
    cabecalho,
    write("Você deseja começar um novo jogo?"),nl,
    write("1 - Novo Jogo"),nl,
    write("2 - Sair"),nl.

mensagem_opcaoInvalida:-
	write("** Opção inválida! **"),nl,
	write("** Reveja as opções possíveis. **"),nl,
    sleep(3).


mensagem_modosJogo:-
	clear(),
	cabecalho,
	write("Digite o número correspondente ao modo que você quer"),nl,
	write("1 - Modo Treino"),nl,
	write("2 - Modo Alternado"),nl,
	write("3 - Modo Clássico"),nl,
	write("4 - Voltar").


mensagem_modoClassicoSelecionado:-
	clear(),
	cabecalho,
	write("Modo Clássico selecionado!"),nl,
	sleep(2).


mensagem_modoAlternadoSelecionado:-
	clear(),
	cabecalho,
	write("Modo Alternado selecionado!"),nl,
	sleep(2).


mensagem_modoTreinoSelecionado:-
	clear(),
	cabecalho,
	write("Modo Treino selecionado!"),nl,
	sleep(2),
	write("Cuidado para não ser derrotado(a) pelo(s) bot(s)!"),nl,
	sleep(3).


mensagem_numJogadores:-
	clear(),
	cabecalho,
	write("Digite a quantidade de jogadores"),
	write("Este valor deve estar entre 2 e 8 inclusive:"),nl.


mensagem_nomeJogadores:-
	clear(),
	cabecalho,
	write("Digite o nome e sobrenome do(s) jogador(es) humano(s)"),nl,
	write("Um jogador por linha:"),nl.


mensagem_categoriaSorteada(categoriaSorteada):-
	clear(),
	cabecalho,
    write("Categoria sorteada: "),write(categoriaSorteada),nl,nl,
	write("Cada jogador deverá informar um ítem pertencente à categoria sorteada."),nl,
	write("Caso não se recorde de algum item, digite #"),nl,
	sleep(5).


mensagem_informarPalavraCategoria(categoriaSorteada, nomeJogador, sobrenomeJogador):-
	clear(),
	cabecalho,
    write("Categoria: "),write(categoriaSorteada),nl,write("Vez do jogador(a): "),write(nomeJogador),write(" "),write(sobrenomeJogador),nl,nl,
	write("Informe um ítem desta categoria (sem acentos): "),nl.

mensagem_itemAceito:-
    nl,
	write("Item aceito!"),nl,
	sleep(1).

mensagem_palavraNaoCadastrada:-
    nl,
	write("ATENÇÃO! Esta palavra não está cadastrada!"),nl,nl,
	write("Este ítem pertence mesmo a esta categoria? s/n"),nl.


mensagem_vencedor(nomeJogador, sobrenomeJogador):-
	clear(),
	cabecalho,
    write("O vencedor da vez é: "),write(nomeJogador),write(" "),write(sobrenomeJogador),write(". Parabéns!"),nl,nl,
	sleep(4).


mensagem_perdedor(nomeJogador, sobrenomeJogador):-
    clear(),
	cabecalho,
    write("Que pena, "),write(nomeJogador),write(" "),write(sobrenomeJogador),write(" está fora do jogo!"),nl,
	sleep(4).

mensagem_modoAlternadoSorteio(categoriaSorteada):-
	clear(),
	cabecalho,
    write("Modo Alternado"),nl,
    write("Uma nova categoria foi sorteada:"),
    write(categoriaSorteada),nl,
	sleep(3).

