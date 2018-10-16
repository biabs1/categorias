module Execucao where

import Mensagens

-- Opcoes menu modos
modo_nao_selecionado = -1
modo_treino = 1
modo_alternado = 2
modo_classico = 3
voltar = 4

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
