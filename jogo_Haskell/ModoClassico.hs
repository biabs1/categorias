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

numItensCadastradosCategoria :: [Char] -> IO Int
numItensCadastradosCategoria categoria =
  numLinhasArquivo ("../palavras/" ++ categoria ++ ".txt")

itemCadastradoCategoria ::  [Char] -> [Char] -> IO Bool
itemCadastradoCategoria palavra categoria = do
  arquivo <- openFile ("../palavras/" ++ categoria ++ ".txt") ReadMode
  conteudo <- hGetContents arquivo
  return(tratarTexto palavra (lines conteudo))

tratarTexto ::[Char] -> [[Char]] -> Bool
tratarTexto palavra [] = False
tratarTexto palavra (a:as) =
  if(comparaString palavra a)
    then True
    else tratarTexto palavra as

comparaString :: [Char] -> [Char] -> Bool
comparaString [] [] = True
comparaString [] (b:bs) = False
comparaString (a:as) [] = False
comparaString (a:as) (b:bs) =
  if(a == b)
    then comparaString as bs
    else False

cadastrarItemCategoria :: [Char] -> [Char] -> IO()
cadastrarItemCategoria categoria palavra = appendFile ("../palavras/" ++ categoria ++ ".txt") palavra

itemInformadoAntes :: [Char] -> [[Char]] -> Bool
itemInformadoAntes item itensInformados = do
  if(length itensInformados > 0)
    then do
      if(comparaString item (head itensInformados))
        then True
        else itemInformadoAntes item (tail itensInformados)
    else False


cadastrarItemInformadosNaJogada :: [Char] -> [[Char]] -> [[Char]]
cadastrarItemInformadosNaJogada [] [] = []
cadastrarItemInformadosNaJogada item [] = [item]
cadastrarItemInformadosNaJogada item (i:is) = do
  a <- is ++ [item]
  return(a)

nomeJogadorIndice :: [[Char]] -> Int -> Int -> [Char]
nomeJogadorIndice [] indiceAtual indiceJogador = "Jogador inexistente"
nomeJogadorIndice nomeJogadores indiceAtual indiceJogador =
  if indiceAtual == indiceJogador
    then (head nomeJogadores)
    else nomeJogadorIndice (tail nomeJogadores) (indiceAtual + 1) indiceJogador

removeJogador :: [[Char]] -> Int -> Int -> [[Char]]
removeJogador [] b c = []
removeJogador (a:as) b c = if b == c then removeJogador as (b+1) c else [a] ++ removeJogador as (b+1) c
