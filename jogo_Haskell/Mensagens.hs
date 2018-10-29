module Mensagens where

import Tela
import Data.List

cabecalho = do putStrLn "========== JOGO CATEGORIAS ==========\n\n"

mensagem_apresentacao = do
    limparTela
    cabecalho
    putStrLn "Bem vind@ ao Jogo Categorias!\n"
    sleep 2
    putStrLn "Você testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias.\n"
    sleep 3

mensagem_menuPrincipal = do
    limparTela
    cabecalho
    putStrLn "Você deseja começar um novo jogo?\n1 - Novo Jogo\n2 - Sair\n"

mensagem_opcaoInvalida = do
    putStrLn "** Opção inválida! **\n** Reveja as opções possíveis. **\n"
    sleep 3

mensagem_modosJogo = do
    limparTela
    cabecalho
    putStrLn "Digite o número correspondente ao modo que você quer\n"
    putStrLn "1 - Modo Treino\n2 - Modo Alternado\n3 - Modo Clássico\n4 - Voltar\n"

mensagem_modoClassicoSelecionado = do
    limparTela
    cabecalho
    putStrLn "Modo Clássico selecionado!\n"
    sleep 2

mensagem_modoAlternadoSelecionado = do
    limparTela
    cabecalho
    putStrLn "Modo Alternado selecionado!\n"
    sleep 2

mensagem_modoTreinoSelecionado = do
    limparTela
    cabecalho
    putStrLn "Modo Treino Selecionado!\n"
    sleep 2
    putStrLn "Cuidado para não ser derrotado(a) pelo(s) bot(s)!\n"
    sleep 3

mensagem_numJogadores = do
    limparTela
    cabecalho
    putStrLn "Digite a quantidade de jogadores\nEste valor deve estar entre 2 e 8 inclusive:\n"

mensagem_nomeJogadores = do
    limparTela
    cabecalho
    putStrLn "Digite o nome e sobrenome do(s) jogador(es) humano(s)\nUm jogador por linha:\n"

mensagem_itemAceito = do
    putStrLn "\nItem aceito!\n"
    sleep 1

mensagem_palavraNaoCadastrada = do
    putStrLn "\nATENÇÃO! Esta palavra não está cadastrada!\n"
    putStrLn "\nEste item pertence mesmo a esta categoria? s/n\n"

mensagem_jogadoresCadastrados :: [String] -> IO()
mensagem_jogadoresCadastrados nomeJogadores = do
    putStrLn (unlines $ "\nJogador(es) cadastrado(s):\n" : nomeJogadores)
    sleep 2

mensagem_categoriaSorteada :: String -> IO()
mensagem_categoriaSorteada categoria = do
    limparTela
    cabecalho
    putStrLn ("Categoria sorteada: " ++ categoria ++ "\n\n")
    putStrLn "Cada jogador deverá informar um ítem pertencente à categoria sorteada.\n"
    putStrLn "Caso não se recorde de algum item, digite #\n"
    sleep 5

mensagem_informarPalavraCategoria :: String -> String -> IO()
mensagem_informarPalavraCategoria categoriaSorteada nomeJogador = do
    limparTela
    cabecalho
    putStrLn ("Categoria: " ++ categoriaSorteada ++ "\n")
    putStrLn ("Vez do jogador(a): " ++ nomeJogador ++ "\n\n")
    putStrLn "Informe um ítem desta categoria (sem acentos): \n"

{-mensagem_umaNovaCategoriaSorteada :: IO()
mensagem-mensagem_umaNovaCategoriaSorteada categoria = do
    limparTela
    putStrLn ("Uma nova categoria foi sorteada, por ter esgotado as palavras da categoria anterior." ++ "\n")
-}------
mensagem_vencedor :: String -> IO()
mensagem_vencedor nomeJogador = do
    limparTela
    cabecalho
    putStrLn ("O vencedor da vez é: " ++ nomeJogador ++ ". Parabéns!\n\n")
    sleep 4

mensagem_perdedor :: String -> IO()
mensagem_perdedor nomeJogador = do
    limparTela
    cabecalho
    putStrLn ("Que pena, " ++ nomeJogador ++ " está fora do jogo!\n")
    sleep 4

mensagem_modoAlternadoSorteio :: String -> IO()
mensagem_modoAlternadoSorteio categoriaSorteada = do
    limparTela
    cabecalho
    putStrLn ("Modo Alternado\nUma nova categoria foi sorteada: " ++ categoriaSorteada ++ "\n")
    sleep 3
