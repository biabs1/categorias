module Entradas where

import Data.List
import System.IO

import Mensagens

prompt :: IO()
prompt = do putStr(">> ")

entrada_receberNomeSobrenomeJogadores :: Int -> [[Char]] -> [[Char]]
entrada_receberNomeSobrenomeJogadores numParticipantes nomeSobrenomeJogadores =
  if numParticipantes == 0
    then nomeSobrenomeJogadores
    else do
    --  nomeSobrenome <- readLn
      entrada_receberNomeSobrenomeJogadores (numParticipantes - 1) (nomeSobrenomeJogadores)
