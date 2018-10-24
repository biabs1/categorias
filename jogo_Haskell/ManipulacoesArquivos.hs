module ManipulacoesArquivos where

import System.IO

{-numLinhasArquivo :: IO Handle -> Int -> Int
numLinhasArquivo arquivo numLinhasContadas =
  do eof <- hIsEOF arquivo
     if eof
       then numLinhasContadas
       else do
         hGetLine arquivo
         numLinhasArquivo arquivo (numLinhasContadas + 1)-}
