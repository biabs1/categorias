:- [entradas].
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

%
%
%
%
%
modo_generico(1):-
    loopEscolhaNumJogadores(NumJogadores),
    entrada_receberNomeSobrenomeJogadores(1, [], NomeSobrenomeJogadores),
    definirNomeSobrenomeBots(0, NumJogadores, NomeSobrenomeJogadores, NomeSobrenomeJogadoresFinal),
    mensagem_jogadoresCadastrados(NomeSobrenomeJogadores),
    loopRestaMaisDeUmJogador(NomeSobrenomeJogadores, []),
    entrada_pegarOpcaoMenu(NovaOpcao), opcaoMenu(NovaOpcao).
%
%
%
%
%

modo_generico(Modo):-
    loopEscolhaNumJogadores(NumJogadores),
    e_modo_treino(Modo, NumJogadores).

e_modo_treino(Modo, NumJogadores):-
    modo_treino(Modo),
    entrada_receberNomeSobrenomeJogadores(1, [], NomeSobrenomeJogadores),
    definirNomeSobrenomeBots(0, NumJogadores, NomeSobrenomeJogadores, NomeSobrenomeJogadoresFinal),
    mensagem_jogadoresCadastrados(NomeSobrenomeJogadores),
    loopRestaMaisDeUmJogador(NomeSobrenomeJogadores, []),
    entrada_pegarOpcaoMenu(Opcao).

e_modo_treino(Modo, NumJogadores):-
    entrada_receberNomeSobrenomeJogadores(NumJogadores, [], NomeSobrenomeJogadores),
    mensagem_jogadoresCadastrados(NomeSobrenomeJogadores),
    loopRestaMaisDeUmJogador(NomeSobrenomeJogadores, []),
    entrada_pegarOpcaoMenu(Opcao).

% Loop Escolha Numero de Jogadores
loopEscolhaNumJogadores(NumJogadores):-
    mensagem_numJogadores,
    imprimePrompt,
    receberNumero(X),
    valida_num_jogadores(X, NumJogadores).

valida_num_jogadores(X, NumJogadores):- X >= 2, X =< 8, NumJogadores is X.
valida_num_jogadores(_, NumJogadores):-
    mensagem_opcaoInvalida,
    loopEscolhaNumJogadores(NumJogadores).
%

% Loop Resta mais de 1 Jogador
loopRedireciona([JogadorVencedor|_]):-
    mensagem_vencedor(JogadorVencedor),
    mensagem_menuPrincipal(),
    entrada_pegarOpcaoMenu(Opcao), 
    opcaoMenu(Opcao),!.

loopRestaMaisDeUmJogador(NomeSobrenomeJogadores, ItensInformados):-
	length(NomeSobrenomeJogadores, Tamanho),
	(Tamanho =:= 1 -> loopRedireciona(NomeSobrenomeJogadores);
    sorteiaCategoria(Categoria),
    mensagem_categoriaSorteada(Categoria),
    loopRecebePalavraJogadores(Categoria, NomeSobrenomeJogadores, ItensInformados, [NomeSobrenomeJogadores, ItensInformadosAtual])).
%

% Loop Recebe Palavra Jogadores
loopRecebePalavraJogadores(_, _, _, [NomeJogadoresAtual|ItensInformados]):-
    length(NomeJogadoresAtual, Tamanho),
    (Tamanho =:= 1 -> loopRestaMaisDeUmJogador(NomeJogadoresAtual,ItensInformados)),!.

loopRecebePalavraJogadores(_, _, [], _, _).

loopRecebePalavraJogadores(Categoria, [JogadorAtual|DemaisJogadores], ItensInformados, [NomeJogadoresAtual|ItensInformadosAtual]):-
    mensagem_informarPalavraCategoria(Categoria, JogadorAtual),
    recebePalavra(Categoria, JogadorAtual, ItensInformados, ItensInformadosAtualAux),
    jogadoresRestantes(ItensInformados, ItensInformadosAtualAux, JogadorAtual, DemaisJogadores, Resultado),
    loopRecebePalavraJogadores(Categoria, Resultado, ItensInformadosAtualAux, [Resultado,ItensInformadosAtualAux]).
%

jogadoresRestantes(ItensInformadosAnteriormente, ItensInformadosAtualmente, _, DemaisJogadores, Resultado):-
    length(ItensInformadosAnteriormente, TamanhoAnterior),
    length(ItensInformadosAtualmente, TamanhoAtual),
    (TamanhoAnterior =:= TamanhoAtual -> Resultado = DemaisJogadores),!.

jogadoresRestantes(_, _, JogadorAtual, DemaisJogadores, Resultado):-
	length(DemaisJogadores, T),
	concatenaListas(DemaisJogadores, [JogadorAtual], Resultado),!.

% O jogador é um bot.
%recebePalavra(Modo, Categoria, NomeJogador, ItensInformados, ItensInformadosAtual):-
%    modo_treino(Modo),
%    jogadorEBot(NomeJogador, Resultado),
%    Resultado =:= true,
%    recebeRespostaBot(Categoria, Resposta).
%    writeln(Resposta).

% O jogador é um humano.
recebePalavra(Categoria, NomeJogador, ItensInformados, ItensInformadosAtual):-
    receberString(Resposta),
    validaResposta(Resposta, Categoria, ItensInformados, ItensInformadosAtual, NomeJogador).
	
validaResposta(Resposta, Categoria, ItensInformados, ItensInformadosAtual, NomeJogador):-
	resposta_NaoSabe(Resposta,R),
	(R -> ItensInformadosAtual = ItensInformados, mensagem_perdedor(NomeJogador);
	resposta_ItemJaInformado(Resposta, ItensInformados, R2),
	(R2 == true-> 
		resposta_ItemAceito(Resposta, Categoria, R3),
		(R3 ->
			mensagem_itemAceito,
			cadastrarItemInformadoNaJogada(Resposta, ItensInformados, ItensInformadosAtual),
			writeln(ItensInformadosAtual), 
			sleep(2);
			ItensInformadosAtual = ItensInformados,
			writeln("Item nao faz parte da categoria!!"),
			sleep(2));
		writeln("Item cadastrado na categoria"), 
		ItensInformadosAtual = ItensInformados)),!.

resposta_NaoSabe(Resposta,R):- (Resposta \= "#" -> R=false; R=true).

resposta_ItemJaInformado(Resposta, ItensInformados, R):- (itemInformadoAntes(Resposta, ItensInformados) -> R=false; R=true).

resposta_ItemAceito(Resposta, Categoria, R):- itemCadastradoCategoria(Categoria, Resposta, R).
	
recebeRespostaBot(Resposta):-
    botSabeResposta, sorteiaItemCategoria(Categoria, Resposta).

recebeRespostaBot(Resposta):-
    Resposta = "#".

modo_treino_selecionado:- mensagem_modoTreinoSelecionado, modo_generico(1).
modo_alternado_selecionado:- mensagem_modoAlternadoSelecionado, modo_generico(2).
modo_classico_selecionado:- mensagem_modoClassicoSelecionado, modo_generico(3).

modoJogo(ModoEscolhido):- modo_treino(ModoEscolhido), modo_treino_selecionado.
modoJogo(ModoEscolhido):- modo_alternado(ModoEscolhido), modo_alternado_selecionado.
modoJogo(ModoEscolhido):- modo_classico(ModoEscolhido), modo_classico_selecionado.
modoJogo(ModoEscolhido):- voltar(ModoEscolhido), entrada_pegarOpcaoMenu(NovaOpcao), opcaoMenu(NovaOpcao).
modoJogo(_):- mensagem_opcaoInvalida, loopEscolhaModoJogo.

loopEscolhaModoJogo:- mensagem_modosJogo, imprimePrompt, receberNumero(X), modoJogo(X).
