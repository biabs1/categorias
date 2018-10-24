module ModoClassico where

import System.IO
import ManipulacoesArquivos

sorteiaCategoria :: IO [Char]
sorteiaCategoria = do
  numCategoriasCadastradas <- numLinhasArquivo "../palavras/categorias.txt"
  putStrLn(show numCategoriasCadastradas)
  categoriaSorteada <- palavraLinha 1 "../palavras/categorias.txt"
  putStrLn(categoriaSorteada)
  return("Hey")

removeJogador :: [[Char]] -> Int -> Int -> [[Char]]
removeJogador [] b c = []
removeJogador (a:as) b c = if b == c then removeJogador as (b+1) c else [a] ++ removeJogador as (b+1) c
