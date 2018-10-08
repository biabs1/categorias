import Control.Concurrent
import qualified System.Process as SP

clearScreen :: IO ()
clearScreen = do
  _ <- SP.system "reset"
  return ()

cabecalho :: IO()
cabecalho =
    do
        putStrLn("========== JOGO CATEGORIAS ==========\n\n")

mensagem_apresentacao :: IO()
mensagem_apresentacao =
    do
        clearScreen
        cabecalho
        putStrLn("Bem vind@ ao jogo Categorias!")
        threadDelay 2000000
        putStrLn("Você testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias.\n")
        threadDelay 3000000

mensagem_menuPrincipal :: IO()
mensagem_menuPrincipal =
    do
        clearScreen
        cabecalho
        putStrLn("Você deseja começar um novo jogo?\n")
        putStrLn("1 - Novo Jogo\n")
        putStrLn("2 - Sair\n")

mensagem_opcaoInvalida :: IO()
mensagem_opcaoInvalida =
    do
        putStrLn("** Opção inválida! **\n** Reveja as opções possíveis. **\n")
        threadDelay 3000000

mensagem_modosJogo :: IO()
mensagem_modosJogo =
    do
        clearScreen
        cabecalho
        putStrLn("Digite o número correspondente ao modo que você quer\n")
        putStrLn("1 - Modo Treino\n")
        putStrLn("2 - Modo Alternado\n")
        putStrLn("3 - Modo Clássico\n")
        putStrLn("4 - Voltar\n")

mensagem_modoClassicoSelecionado :: IO()
mensagem_modoClassicoSelecionado =
    do
        clearScreen
        cabecalho
        putStrLn("Modo Clássico selecionado!\n")
        threadDelay 2000000

mensagem_modoAlternadoSelecionado :: IO()
mensagem_modoAlternadoSelecionado =
    do
        clearScreen
        cabecalho
        putStrLn("Modo Alternado selecionado!\n")
        threadDelay 2000000

mensagem_modoTreinoSelecionado :: IO()
mensagem_modoTreinoSelecionado =
    do
        clearScreen
        cabecalho
        putStrLn("Modo Treino selecionado!\n")
        threadDelay 2000000
        putStrLn("Cuidado para não ser derrotado(a) pelo(s) bot(s)!\n")
        threadDelay 3000000

mensagem_numJogadores :: IO()
mensagem_numJogadores =
    do
        clearScreen
        cabecalho
        putStrLn("Digite a quantidade de jogadores\n")
        putStrLn("Este valor deve estar entre 2 e 8 inclusive:\n")

mensagem_nomeJogadores :: IO()
mensagem_nomeJogadores =
    do
        clearScreen
        cabecalho
        putStrLn("Digite o nome e sobrenome do(s) jogador(es) humano(s)\n")
        putStrLn("Um jogador por linha:\n")

-- mensagem_jogadoresCadastrados

mensagem_categoriaSorteada :: String -> IO()
mensagem_categoriaSorteada categoriaSorteada =
    do
        clearScreen
        cabecalho
        putStrLn("Categoria: " ++ categoriaSorteada ++ "\n")
        putStrLn("Cada jogador deverá informar um ítem pertencente à categoria sorteada.\n")
        putStrLn("Caso não se recorde de algum item, digite #\n")
        threadDelay 5000000

mensagem_informarPalavraCategoria :: String -> String -> String -> IO()
mensagem_informarPalavraCategoria categoriaSorteada nomeJogador sobrenomeJogador =
    do
        clearScreen
        cabecalho
        putStrLn("Categoria: " ++ categoriaSorteada ++ "\n")
        putStrLn("Vez do jogador(a): " ++ nomeJogador ++ " " ++ sobrenomeJogador ++ "\n\n")
        putStrLn("Informe um ítem desta categoria (sem acentos): \n")

mensagem_itemAceito :: IO()
mensagem_itemAceito =
    do
        putStrLn("\nItem aceito!\n")
        threadDelay 1000000

mensagem_palavraNaoCadastrada :: IO()
mensagem_palavraNaoCadastrada =
    do
        putStrLn("\nATENÇÃO! Esta palavra não está cadastrada!\n")
        putStrLn("\nEste ítem pertence mesmo a esta categoria? s/n\n")

mensagem_vencedor :: String -> String -> IO()
mensagem_vencedor nomeJogador sobrenomeJogador =
    do
        clearScreen
        cabecalho
        putStrLn("O vencedor da vez é: " ++ nomeJogador ++ " " ++ sobrenomeJogador ++ ". Parabéns!\n\n")
        threadDelay 4000000

mensagem_perdedor :: String -> String -> IO()
mensagem_perdedor nomeJogador sobrenomeJogador =
    do
        clearScreen
        cabecalho
        putStrLn("Que pena, " ++ nomeJogador ++ " " ++ sobrenomeJogador ++ " está fora do jogo!\n")
        threadDelay 4000000

mensagem_modoAlternadoSorteio :: String -> IO()
mensagem_modoAlternadoSorteio categoriaSorteada =
    do
        clearScreen
        cabecalho
        putStrLn("Modo Alternado\nUma nova categoria foi sorteada: " ++ categoriaSorteada ++ "\n")
        threadDelay 3000000
