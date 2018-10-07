{- PLP - 2018.2

Jogo Categorias.

Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo,
Matheus Medeiros e Wener Wagner.
-}

import Control.Concurrent
import qualified System.Process as SP

clearScreen :: IO ()
clearScreen = do
  _ <- SP.system "reset"
  return ()


cabecalho :: IO()
cabecalho =
    do
        putStrLn("========== JOGO CATEGORIAS ==========\n\n")

mensagem_apresentacao :: IO()
mensagem_apresentacao =
    do
        clearScreen
        cabecalho
        putStrLn("Bem vind@ ao jogo Categorias!")
        threadDelay 2000000
        putStrLn("Você testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias.\n")
        threadDelay 3000000

main = do
    mensagem_apresentacao
