module Entradas where

import Mensagens

prompt :: IO()
prompt = do putStr(">> ")

entrada_pegarOpcaoMenu :: IO()
entrada_pegarOpcaoMenu =
  do
    --prompt
    --o prompt não está sendo impresso na linha de leitura
    mensagem_menuPrincipal
    opcao <- readLn
    if (opcao == 1)
      then putStrLn("Novo Jogo")
      else do
        if (opcao == 2)
          then putStrLn("Saída")
          else do
            mensagem_opcaoInvalida
            entrada_pegarOpcaoMenu
