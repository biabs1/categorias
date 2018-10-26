module ModoTreino where

import ManipulacoesArquivos
import System.IO.Unsafe
import System.Random
import Data.Char.isSpace

numAleatorio :: (Int, Int) -> Int
numAleatorio (a, b) = unsafePerformIO (randomRIO (a, b))

definirNomeSobrenomeBots :: Int -> Int -> [[Char]] -> IO [[Char]]
definirNomeSobrenomeBots botAtual numParticipantes nomeSobrenomeJogadores =
  if (botAtual == numParticipantes)
    then return(nomeSobrenomeJogadores)
    else definirNomeSobrenomeBots (botAtual + 1) numParticipantes (nomeSobrenomeJogadores ++ ["Bot" ++ (show botAtual) ++ " Smith"])

sorteiaItemCategoria :: [Char] -> IO [Char]
sorteiaItemCategoria categoria = do
  numItensCadastrados <- numLinhasArquivo ("../palavras/" ++ categoria ++ ".txt")
  palavraSorteada <- palavraLinha (numAleatorio (0, (numItensCadastrados - 1))) ("../palavras/" ++ categoria ++ ".txt")
  return(palavraSorteada)

jogadorEBot :: [Char] -> IO Bool
jogadorEBot nomeJogador = do
  words nomeJogador
  print(nomeJogador)
  if(elem "Smith" nomeJogador || elem "Bot" nomeJogador)
    then True
    else False

botSabeResposta :: Bool
botSabeResposta = do
  if((numAleatorio (1,100)) > 50)
    then True
    else False
