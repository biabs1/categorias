module ManipulacoesArquivos where

import System.IO

numLinhasArquivo :: [Char] -> IO Int
numLinhasArquivo enderecoArquivo = do
  arquivo <- openFile enderecoArquivo ReadMode
  conteudo <- hGetContents arquivo
  return (length (lines conteudo))

palavraLinha :: Int -> [Char] -> IO [Char]
palavraLinha linha enderecoArquivo = do
  arquivo <- openFile enderecoArquivo ReadMode
  conteudo <- hGetContents arquivo
  return ((lines conteudo) !! linha)
