module Execucao where

import Mensagens
import Entradas

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
  --  nomeSobrenomeJogadores <- entrada_receberNomeSobrenomeJogadores numParticipantes []
  --  mensagem_jogadoresCadastrados numParticipantes nomeSobrenomeJogadores

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


entrada_pegarOpcaoMenu :: IO()
entrada_pegarOpcaoMenu =
  do
    --prompt
    --o prompt não está sendo impresso na linha de leitura
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
