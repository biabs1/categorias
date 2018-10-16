module Entradas where

import Data.List
import System.IO

import Mensagens

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
num_minimo_jogadores = 2 :: Int
num_maximo_jogadores = 8 :: Int
num_jogadores_invalido = -1 :: Int

prompt :: IO()
prompt = do putStr(">> ")

entrada_pegarOpcaoMenu :: IO()
entrada_pegarOpcaoMenu =
  do
    --prompt
    --o prompt não está sendo impresso na linha de leitura
    mensagem_menuPrincipal
    opcao <- readLn
    if (opcao == novo_jogo)
      then putStrLn("Novo Jogo")
      else do
        if (opcao == saida)
          then putStrLn("Saída")
          else do
            mensagem_opcaoInvalida
            entrada_pegarOpcaoMenu
