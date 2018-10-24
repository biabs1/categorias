module ModoClassico where

import System.IO
import ManipulacoesArquivos

sorteiaCategoria :: IO [Char]
sorteiaCategoria = do
  numCategoriasCadastradas <- numLinhasArquivo "../palavras/categorias.txt"
  putStrLn(show numCategoriasCadastradas)
  return("Hey")
