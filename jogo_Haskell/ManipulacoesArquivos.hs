module ManipulacoesArquivos where

import System.IO

numLinhasArquivo :: [Char] -> IO Int
numLinhasArquivo enderecoArquivo = do
  arquivo <- openFile enderecoArquivo ReadMode
  conteudo <- hGetContents arquivo
  return (length (lines conteudo))
