module Execucao where

import Mensagens
import Entradas
import ModoTreino
import ModoClassico

-- Opcoes menu inicial
opcao_invalida = -1
novo_jogo = 1
saida = 2

-- Opcoes menu modos
modo_nao_selecionado = -1
modo_treino = 1
modo_alternado = 2
modo_classico = 3
voltar = 4

-- Numero de jogadores
num_minimo_jogadores = 2
num_maximo_jogadores = 8
num_jogadores_invalido = -1

modo_generico :: Int -> IO()
modo_generico modo =
  do
    numParticipantes <- loopEscolhaNumJogadores
    mensagem_nomeJogadores
    if (modo == modo_treino)
      then do
        nomeSobrenomeJogadores <- entrada_receberNomeSobrenomeJogadores 1 []
        nomeSobrenomeJogadores <- definirNomeSobrenomeBots 1 numParticipantes nomeSobrenomeJogadores
        mensagem_jogadoresCadastrados nomeSobrenomeJogadores
        categoriaSorteada <- sorteiaCategoria
        mensagem_categoriaSorteada categoriaSorteada
        loopRestaMaisDeUmJogador modo 0 categoriaSorteada numParticipantes nomeSobrenomeJogadores
        entrada_pegarOpcaoMenu
      else do
        nomeSobrenomeJogadores <- entrada_receberNomeSobrenomeJogadores numParticipantes []
        mensagem_jogadoresCadastrados nomeSobrenomeJogadores
        categoriaSorteada <- sorteiaCategoria
        mensagem_categoriaSorteada categoriaSorteada
        loopRestaMaisDeUmJogador modo 0 categoriaSorteada numParticipantes nomeSobrenomeJogadores
        entrada_pegarOpcaoMenu

modo_treino_selecionado :: IO()
modo_treino_selecionado =
  do
    mensagem_modoTreinoSelecionado
    modo_generico modo_treino

modo_alternado_selecionado :: IO()
modo_alternado_selecionado =
  do
    mensagem_modoAlternadoSelecionado
    modo_generico modo_alternado

modo_classico_selecionado :: IO()
modo_classico_selecionado =
  do
    mensagem_modoClassicoSelecionado
    modo_generico modo_classico

loopEscolhaModoJogo :: IO()
loopEscolhaModoJogo =
  do
    mensagem_modosJogo
    modo <- readLn
    if (modo == modo_treino)
      then do modo_treino_selecionado
      else do
        if (modo == modo_alternado)
          then do modo_alternado_selecionado
          else do
            if (modo == modo_classico)
              then do modo_classico_selecionado
              else do
                mensagem_opcaoInvalida
                loopEscolhaModoJogo

loopEscolhaNumJogadores :: IO Int
loopEscolhaNumJogadores =
  do
    mensagem_numJogadores
    numParticipantes <- readLn
    if (numParticipantes >= num_minimo_jogadores && numParticipantes <= num_maximo_jogadores )
      then return(numParticipantes)
      else
        do
          mensagem_opcaoInvalida
          loopEscolhaNumJogadores

loopRestaMaisDeUmJogador :: Int -> Int -> [Char] -> Int -> [[Char]] -> IO()
loopRestaMaisDeUmJogador modo numChamada categoriaSorteada numParticipantes nomeJogadores = do
  if numParticipantes == 1
    then do mensagem_vencedor (head nomeJogadores)
    else do
      if (numChamada == 0)
        then do
          partipantesRestantesItensInformados <- loopRestaItemASerDitoCategoriaSorteada categoriaSorteada (nomeJogadores, [])
          loopRestaMaisDeUmJogador modo (numChamada + 1) categoriaSorteada (length (fst partipantesRestantesItensInformados)) (fst partipantesRestantesItensInformados)
        else do
          if (modo == modo_classico)
            then do
              partipantesRestantesItensInformados <- loopRestaItemASerDitoCategoriaSorteada categoriaSorteada (nomeJogadores, [])
              loopRestaMaisDeUmJogador modo (numChamada + 1) categoriaSorteada (length (fst partipantesRestantesItensInformados)) (fst partipantesRestantesItensInformados)
            else do
              if (modo == modo_alternado)
                then do
                  categoriaSorteada <- sorteiaCategoria
                  mensagem_categoriaSorteada categoriaSorteada
                  partipantesRestantesItensInformados <- loopRestaItemASerDitoCategoriaSorteada categoriaSorteada (nomeJogadores, [])
                  loopRestaMaisDeUmJogador modo (numChamada + 1) categoriaSorteada (length (fst partipantesRestantesItensInformados)) (fst partipantesRestantesItensInformados)
                else mensagem_modoTreinoSelecionado



loopRestaItemASerDitoCategoriaSorteada :: [Char] -> ([[Char]], [[Char]]) -> IO ([[Char]], [[Char]])
loopRestaItemASerDitoCategoriaSorteada categoriaSorteada nomeJogadoresItensInformados = do
  numItensCadastrados <- numItensCadastradosCategoria categoriaSorteada
  if ((length (fst nomeJogadoresItensInformados)) == 1)
    --Ha vencedor
    then return(nomeJogadoresItensInformados)
    else do
      --Os itens cadastrados na categoria ja foram ditos
      if ((length (snd nomeJogadoresItensInformados)) > numItensCadastrados)
        then do
          categoriaSorteada <- sorteiaCategoria
          mensagem_categoriaSorteada categoriaSorteada
          loopReceberPalavraCategoria 0 categoriaSorteada nomeJogadoresItensInformados
        else do
          loopReceberPalavraCategoria 0 categoriaSorteada nomeJogadoresItensInformados

loopReceberPalavraCategoria :: Int -> [Char] -> ([[Char]], [[Char]]) -> IO ([[Char]], [[Char]])
loopReceberPalavraCategoria jogadorAtual categoria nomeJogadoresItensInformados = do
  if ((length (fst nomeJogadoresItensInformados)) == 1)
    --Ha vencedor
    then return(nomeJogadoresItensInformados)
    else do
      if jogadorAtual == (length (fst nomeJogadoresItensInformados))
        then return(nomeJogadoresItensInformados)
        else do
          mensagem_informarPalavraCategoria categoria (nomeJogadorIndice (fst nomeJogadoresItensInformados) 0 jogadorAtual)

          itemInformado <- getLine
          if (itemInformadoAntes itemInformado (snd nomeJogadoresItensInformados) || ((head itemInformado) == '#'))
            -- o jogador não sabe de um ítem ou disse um que já foi dito.
            then do
              --  jogadoresRestantes <- removeJogador (fst nomeJogadoresItensInformados) 0 jogadorAtual
              loopReceberPalavraCategoria (jogadorAtual + 1) categoria (removeJogador (fst nomeJogadoresItensInformados) 0 jogadorAtual, snd nomeJogadoresItensInformados)
            -- o jogador informou um ítem cadastrado na categoria.
            else do
              booleano <- itemCadastradoCategoria itemInformado categoria
              if (booleano)
                then do
                  mensagem_itemAceito
                  loopReceberPalavraCategoria (jogadorAtual + 1) categoria (fst nomeJogadoresItensInformados, cadastrarItemInformadosNaJogada itemInformado (snd nomeJogadoresItensInformados))
                -- o jogador informou um ítem ainda não cadastrado.
                else do
                  mensagem_palavraNaoCadastrada
                  resposta <- getLine
                  if ((head resposta) == 'S')
                    then do
                      cadastrarItemCategoria categoria itemInformado
                      mensagem_itemAceito
                      loopReceberPalavraCategoria (jogadorAtual + 1) categoria (fst nomeJogadoresItensInformados, cadastrarItemInformadosNaJogada itemInformado (snd nomeJogadoresItensInformados))
                    else do
                      mensagem_perdedor (nomeJogadorIndice (fst nomeJogadoresItensInformados) 0 jogadorAtual)
                      loopReceberPalavraCategoria (jogadorAtual + 1) categoria (removeJogador (fst nomeJogadoresItensInformados) 0 jogadorAtual, snd nomeJogadoresItensInformados)



entrada_pegarOpcaoMenu :: IO()
entrada_pegarOpcaoMenu =
  do
    prompt
    mensagem_menuPrincipal
    opcao <- readLn
    if (opcao == novo_jogo)
      then do loopEscolhaModoJogo
      else do
        if (opcao == saida)
          then return()
          else do
            mensagem_opcaoInvalida
            entrada_pegarOpcaoMenu
