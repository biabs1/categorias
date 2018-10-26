module Execucao where

import Mensagens
import Entradas
import Treino
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
        loopRestaMaisDeUmJogador numParticipantes nomeSobrenomeJogadores
        entrada_pegarOpcaoMenu
      else do
        nomeSobrenomeJogadores <- entrada_receberNomeSobrenomeJogadores numParticipantes []
        mensagem_jogadoresCadastrados nomeSobrenomeJogadores
        loopRestaMaisDeUmJogador numParticipantes nomeSobrenomeJogadores
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

loopRestaMaisDeUmJogador :: Int -> [[Char]] -> IO()
loopRestaMaisDeUmJogador numParticipantes nomeJogadores = do
  if numParticipantes == 1
    then do mensagem_vencedor (head nomeJogadores)
    else do
      categoriaSorteada <- sorteiaCategoria
      mensagem_categoriaSorteada categoriaSorteada
      partipantesRestantes <- loopRestaItemASerDitoCategoriaSorteada 0 [] numParticipantes categoriaSorteada nomeJogadores
      loopRestaMaisDeUmJogador (numParticipantes - 1) partipantesRestantes


loopRestaItemASerDitoCategoriaSorteada :: Int -> [[Char]] -> Int -> [Char] -> [[Char]] -> IO [[Char]]
loopRestaItemASerDitoCategoriaSorteada numItensInformados itensInformados numParticipantes categoriaSorteada nomeJogadores = do
  numItensCadastrados <- numItensCadastradosCategoria categoriaSorteada
  if (numItensInformados >= numItensCadastrados)
    then do
      categoriaSorteada <- sorteiaCategoria
      mensagem_umaNovaCategoriaSorteada
      mensagem_categoriaSorteada categoriaSorteada
      loopReceberPalavraCategoria jogadorAtual numParticipantes categoriaSorteada nomeJogadores
      (numItensInformados++)
    else do
      loopReceberPalavraCategoria jogadorAtual numParticipantes categoriaSorteada nomeJogadores
      (numItensInformados++)

loopReceberPalavraCategoria :: Int -> Int -> [Char] -> [[Char]] -> IO [[Char]]
loopReceberPalavraCategoria jogadorAtual numParticipantes categoria nomeJogadores = do
    mensagem_informarPalavraCategoria categoria (nomeJogadorIndice nomeJogadores 0 jogadorAtual)
    loopReceberPalavraCategoria (jogadorAtual + 1) numParticipantes categoria nomeJogadores


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
