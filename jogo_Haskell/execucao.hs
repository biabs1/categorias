module Execucao where

import Mensagens

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

loopEscolhaNumJogadores :: IO Int
loopEscolhaNumJogadores =
  do
    mensagem_numJogadores
    numParticipantes <- readLn
    if (numParticipantes == num_jogadores_invalido)
      then
        do
          mensagem_opcaoInvalida
          loopEscolhaNumJogadores
      else return(numParticipantes)

modo_generico :: Int -> IO()
modo_generico modo =
  do
    numParticipantes <- loopEscolhaNumJogadores
    putStrLn(show numParticipantes)

modo_treino_selecionado :: IO()
modo_treino_selecionado =
  do
    mensagem_modoTreinoSelecionado

modo_alternado_selecionado :: IO()
modo_alternado_selecionado =
  do
    mensagem_modoAlternadoSelecionado

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
              else mensagem_opcaoInvalida
