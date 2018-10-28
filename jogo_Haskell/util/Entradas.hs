module Entradas where

import Data.List
import System.IO

import Mensagens

prompt :: IO()
prompt = do putStr(">> ")

entrada_receberNomeSobrenomeJogadores :: Int -> [[Char]] -> IO [[Char]]
entrada_receberNomeSobrenomeJogadores numParticipantes nomeSobrenomeJogadores =
  if numParticipantes == 0
    then return(nomeSobrenomeJogadores)
    else do
      nomeSobrenome <- getLine
      entrada_receberNomeSobrenomeJogadores (numParticipantes - 1) (nomeSobrenomeJogadores ++ [nomeSobrenome])
