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

modo_generico(Modo):-
    loopEscolhaNumJogadores(NumJogadores),
    e_modo_treino(Modo, NumJogadores).

e_modo_treino(Modo, NumJogadores):-
    modo_treino(Modo),
    entrada_receberNomeSobrenomeJogadores(1, [], NomeSobrenomeJogadores),
    definirNomeSobrenomeBots(0, NumJogadores, NomeSobrenomeJogadores, NomeSobrenomeJogadoresFinal),
    mensagem_jogadoresCadastrados(NomeSobrenomeJogadoresFinal),
    loopRestaMaisDeUmJogador(Modo, NomeSobrenomeJogadoresFinal, []),
    entrada_pegarOpcaoMenu(Opcao).

e_modo_treino(Modo, NumJogadores):-
    entrada_receberNomeSobrenomeJogadores(NumJogadores, [], NomeSobrenomeJogadores),
    mensagem_jogadoresCadastrados(NomeSobrenomeJogadores),
    loopRestaMaisDeUmJogador(Modo, NomeSobrenomeJogadores, []),
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

loopRestaMaisDeUmJogador(Modo, NomeSobrenomeJogadores, ItensInformados):-
    length(NomeSobrenomeJogadores, Tamanho),
    (Tamanho =:= 1 -> loopRedireciona(NomeSobrenomeJogadores);
    sorteiaCategoria(Categoria),
    mensagem_categoriaSorteada(Categoria),
    loopRecebePalavraJogadores(Modo, Categoria, NomeSobrenomeJogadores, ItensInformados, [NomeSobrenomeJogadores, ItensInformadosAtual])).
%

% Loop Recebe Palavra Jogadores
loopRecebePalavraJogadores(Modo, _, _, _, [NomeJogadoresAtual|ItensInformados]):-
    length(NomeJogadoresAtual, Tamanho),
    (Tamanho =:= 1 -> loopRestaMaisDeUmJogador(Modo, NomeJogadoresAtual,ItensInformados)),!.

loopRecebePalavraJogadores(Modo, Categoria, [JogadorAtual|DemaisJogadores], ItensInformados, [NomeJogadoresAtual|ItensInformadosAtual]):-
    mensagem_informarPalavraCategoria(Categoria, JogadorAtual),
    recebePalavra(Modo, Categoria, JogadorAtual, ItensInformados, ItensInformadosAtualAux),
    jogadoresRestantes(ItensInformados, ItensInformadosAtualAux, JogadorAtual, DemaisJogadores, Resultado),
    loopRecebePalavraJogadores(Modo, Categoria, Resultado, ItensInformadosAtualAux, [Resultado,ItensInformadosAtualAux]).

jogadoresRestantes(ItensInformadosAnteriormente, ItensInformadosAtualmente, _, DemaisJogadores, Resultado):-
    length(ItensInformadosAnteriormente, TamanhoAnterior),
    length(ItensInformadosAtualmente, TamanhoAtual),
    (TamanhoAnterior =:= TamanhoAtual -> Resultado = DemaisJogadores),!.

jogadoresRestantes(_, _, JogadorAtual, DemaisJogadores, Resultado):-
    length(DemaisJogadores, T),
    concatenaListas(DemaisJogadores, [JogadorAtual], Resultado),!.

% O jogador é um bot.
recebePalavra(Modo, Categoria, NomeJogador, ItensInformados, ItensInformadosAtual):-
    modo_treino(Modo),
    jogadorEBot(NomeJogador, Resultado),
    Resultado == true,
    imprimePrompt,
    recebeRespostaBot(Categoria, Resposta),
    writeln(Resposta),
    validaResposta(Resposta, Categoria, NomeJogador, ItensInformados, ItensInformadosAtual).

% O jogador é um humano.
recebePalavra(Modo, Categoria, NomeJogador, ItensInformados, ItensInformadosAtual):-
    imprimePrompt,
    receberString(Resposta),
    validaResposta(Resposta, Categoria, NomeJogador, ItensInformados, ItensInformadosAtual).
	
validaResposta(Resposta, Categoria, NomeJogador, ItensInformados, ItensInformadosAtual):-
	resposta_NaoSabe(Resposta,R),
	(R -> ItensInformadosAtual = ItensInformados, mensagem_perdedor(NomeJogador);
	resposta_ItemJaInformado(Resposta, ItensInformados, R2),
	(R2 == true-> 
		resposta_ItemAceito(Resposta, Categoria, R3),
		(R3 ->
			mensagem_itemAceito,
            cadastrarItemInformadoNaJogada(Resposta, ItensInformados, ItensInformadosAtual);
            mensagem_palavraNaoCadastrada,
            receberString(Palavra),
            (Palavra \= "s" -> ItensInformadosAtual = ItensInformados, mensagem_perdedor(NomeJogador);
            mensagem_itemAceito,
            cadastrarItemCategoria(Categoria, Resposta),
            cadastrarItemInformadoNaJogada(Resposta, ItensInformados, ItensInformadosAtual)));
		mensagem_palavraCategoriaJaDita,
        mensagem_perdedor(NomeJogador), 
		ItensInformadosAtual = ItensInformados)),!.


resposta_NaoSabe(Resposta,R):- (Resposta \= "#" -> R=false; R=true).

resposta_ItemJaInformado(Resposta, ItensInformados, R):- (itemInformadoAntes(Resposta, ItensInformados) -> R=false; R=true).

resposta_ItemAceito(Resposta, Categoria, R):- itemCadastradoCategoria(Categoria, Resposta, R).

recebeRespostaBot(Categoria, Resposta):-
    botSabeResposta, sorteiaItemCategoria(Categoria, Resposta).

recebeRespostaBot(Categoria, Resposta):-
    Resposta = "#",
    writeln(Resposta),
    sleep(2).

modo_treino_selecionado:- mensagem_modoTreinoSelecionado, modo_generico(1).
modo_alternado_selecionado:- mensagem_modoAlternadoSelecionado, modo_generico(2).
modo_classico_selecionado:- mensagem_modoClassicoSelecionado, modo_generico(3).

modoJogo(ModoEscolhido):- modo_treino(ModoEscolhido), modo_treino_selecionado.
modoJogo(ModoEscolhido):- modo_alternado(ModoEscolhido), modo_alternado_selecionado.
modoJogo(ModoEscolhido):- modo_classico(ModoEscolhido), modo_classico_selecionado.
modoJogo(ModoEscolhido):- voltar(ModoEscolhido), entrada_pegarOpcaoMenu(NovaOpcao), opcaoMenu(NovaOpcao).
modoJogo(_):- mensagem_opcaoInvalida, loopEscolhaModoJogo.

loopEscolhaModoJogo:- mensagem_modosJogo, imprimePrompt, receberNumero(X), modoJogo(X).
