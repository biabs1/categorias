module ModoClassico where

import System.IO
import ManipulacoesArquivos
import System.IO.Unsafe
import System.Random
import System.Process as SP

numAleatorio :: (Int, Int) -> Int
numAleatorio (a, b) = unsafePerformIO (randomRIO (a, b))

sorteiaCategoria :: IO [Char]
sorteiaCategoria = do
  numCategoriasCadastradas <- numLinhasArquivo "../palavras/categorias.txt"
  categoriaSorteada <- palavraLinha (numAleatorio (0, (numCategoriasCadastradas - 1))) "../palavras/categorias.txt"
  return(categoriaSorteada)

removeJogador :: [[Char]] -> Int -> Int -> [[Char]]
removeJogador [] b c = []
removeJogador (a:as) b c = if b == c then removeJogador as (b+1) c else [a] ++ removeJogador as (b+1) c
