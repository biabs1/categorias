module Treino where

definirNomeSobrenomeBots :: Int -> Int -> [[Char]] -> IO [[Char]]
definirNomeSobrenomeBots botAtual numParticipantes nomeSobrenomeJogadores =
  if (botAtual == numParticipantes)
    then return(nomeSobrenomeJogadores)
    else definirNomeSobrenomeBots (botAtual + 1) numParticipantes (nomeSobrenomeJogadores ++ ["Bot" ++ (show botAtual) ++ " Smith"])
