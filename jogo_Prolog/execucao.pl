:- [entradas].
:- [modoTreino].
:- [modoClassico].
:- [mensagens].
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
    mensagem_nomeJogadores,
    e_modo_treino(Modo, NumJogadores).

e_modo_treino(Modo, NumJogadores):-
    modo_treino(Modo),
    entrada_receberNomeSobrenomeJogadores(1, [], NomeSobrenomeJogadores),
	  definirNomeSobrenomeBots(0, NumJogadores, NomeSobrenomeJogadores, NomeSobrenomeJogadoresFinal),
    mensagem_jogadoresCadastrados(NomeSobrenomeJogadores),
    loopRestaMaisDeUmJogador(Modo, NomeSobrenomeJogadores, []),
    entrada_pegarOpcaoMenu(Opcao).

e_modo_treino(Modo, NumJogadores):-
    entrada_receberNomeSobrenomeJogadores(NumJogadores, [], NomeSobrenomeJogadores),
    mensagem_jogadoresCadastrados(NomeSobrenomeJogadores),
    loopRestaMaisDeUmJogador(Modo, NomeSobrenomeJogadores, []),
    entrada_pegarOpcaoMenu(Opcao).

loopEscolhaNumJogadores(NumJogadores):-
    mensagem_numJogadores,
    imprimePrompt,
    receberNumero(X),
    valida_num_jogadores(X, NumJogadores).

% Há vencedor
loopRestaMaisDeUmJogador(Modo, NomeSobrenomeJogadores, ItensInformados):-
    length(NomeSobrenomeJogadores, Tamanho),
    Tamanho =:= 1,
    mensagem_vencedor(NomeSobrenomeJogadores),!.

loopRestaMaisDeUmJogador(Modo, NomeSobrenomeJogadores, ItensInformados):-
    sorteiaCategoria(Categoria),
    mensagem_categoriaSorteada(Categoria),
    loopRecebePalavraJogadores(Modo, Categoria, NomeSobrenomeJogadores, ItensInformados, [NomeSobrenomeJogadores, ItensInformadosAtual]),
    loopRestaMaisDeUmJogador(Modo, NomeSobrenomeJogadores, ItensInformadosAtual).

% Há vencedor
loopRecebePalavraJogadores(Modo, Categoria, [JogadorAtual|DemaisJogadores], ItensInformados, [NomeJogadoresAtual|ItensInformadosAtual]):-
    length(NomeJogadoresAtual, Tamanho),
    Tamanho =:= 1,
    mensagem_vencedor(JogadorAtual),!.

loopRecebePalavraJogadores(_, _, [], _, _).

loopRecebePalavraJogadores(Modo, Categoria, [JogadorAtual|DemaisJogadores], ItensInformados, [NomeJogadoresAtual|ItensInformadosAtual]):-
    mensagem_informarPalavraCategoria(Categoria, JogadorAtual),
    recebePalavra(Modo, Categoria, JogadorAtual, ItensInformados, ItensInformadosAtualAux),
    jogadoresRestantes(ItensInformados, ItensInformadosAtualAux, JogadorAtual, DemaisJogadores, Resultado),
    loopRecebePalavraJogadores(Modo, Categoria, Resultado, ItensInformadosAtualAux, [NomeJogadoresAtual,ItensInformadosAtual]).

jogadoresRestantes(ItensInformadosAnteriormente, ItensInformadosAtualmente, JogadorAtual, DemaisJogadores, Resultado):-
    length(ItensInformadosAnteriormente, TamanhoAnterior),
    length(ItensInformadosAtualmente, TamanhoAtual),
    TamanhoAnterior =:= TamanhoAtual,
    Resultado = DemaisJogadores.

jogadoresRestantes(ItensInformadosAnteriormente, ItensInformadosAtualmente, JogadorAtual, DemaisJogadores, Resultado):-
    concatenaListas(DemaisJogadores, [JogadorAtual], Resultado).

% O jogador é um bot.
%recebePalavra(Modo, Categoria, NomeJogador, ItensInformados, ItensInformadosAtual):-
%    modo_treino(Modo),
%    jogadorEBot(NomeJogador, Resultado),
%    Resultado =:= true,
%    recebeRespostaBot(Categoria, Resposta).
%    writeln(Resposta).

% O jogador é um humano.
recebePalavra(Modo, Categoria, NomeJogador, ItensInformados, ItensInformadosAtual):-
    receberString(Resposta),
    validaResposta(Resposta, Categoria, ItensInformados, ItensInformadosAtual).

validaResposta(Resposta, Categoria, ItensInformados, ItensInformadosAtual):-
    trataResposta1(Resposta, ItensInformados, Categoria),
    ItensInformadosAtual = ItensInformados.

validaResposta(Resposta, Categoria, ItensInformados, ItensInformadosAtual):-
    trataResposta2(Resposta, ItensInformados, Categoria),
    mensagem_itemAceito,
    cadastrarItemInformadosNaJogada(Resposta, ItensInformados, ItensInformadosAtual),
    writeln(ItensInformadosAtual), sleep(2).

validaResposta(Resposta, Categoria, ItensInformados, ItensInformadosAtual):-
    trataResposta3(Resposta, ItensInformados, Categoria),
    writeln("Item cadastrado na categoria").

validaResposta(Resposta, Categoria, ItensInformados, ItensInformadosAtual):-
    ItensInformadosAtual = ItensInformados.

recebeRespostaBot(Resposta):-
    botSabeResposta, sorteiaItemCategoria(Categoria, Resposta).

recebeRespostaBot(Resposta):-
    Resposta = "#".

% O jogador não sabe responder
trataResposta1([PrimeiroCaractere|DemaisCaracteres], ItensInformados, Categoria):-
    PrimeiroCaractere =:= "#".

% O jogador disse um item nao informado
trataResposta2(Resposta, ItensInformados, Categoria):-
    \+ itemInformadoAntes(Resposta, ItensInformados).

% O jogador disse um item cadastrado
trataResposta3(Resposta, ItensInformados, Categoria):-
    itemCadastradoCategoria(Categoria, Resposta, Retorno),
    Retorno.

valida_num_jogadores(X, NumJogadores):- X >= 2, X =< 8, NumJogadores is X.
valida_num_jogadores(_, NumJogadores):-
    mensagem_opcaoInvalida,
    loopEscolhaNumJogadores(NumJogadores).

modo_treino_selecionado:- mensagem_modoTreinoSelecionado, modo_generico(1).
modo_alternado_selecionado:- mensagem_modoAlternadoSelecionado, modo_generico(2).
modo_classico_selecionado:- mensagem_modoClassicoSelecionado, modo_generico(3).

modoJogo(ModoEscolhido):- modo_treino(ModoEscolhido), modo_treino_selecionado.
modoJogo(ModoEscolhido):- modo_alternado(ModoEscolhido), modo_alternado_selecionado.
modoJogo(ModoEscolhido):- modo_classico(ModoEscolhido), modo_classico_selecionado.
modoJogo(ModoEscolhido):- voltar(ModoEscolhido), entrada_pegarOpcaoMenu(NewOption), opcaoMenu(NewOption).
modoJogo(_):- mensagem_opcaoInvalida, loopEscolhaModoJogo.

loopEscolhaModoJogo:- mensagem_modosJogo, receberNumero(X), modoJogo(X).
