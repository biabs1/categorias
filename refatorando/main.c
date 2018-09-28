/* PLP - 2018.2

Jogo Categorias.

Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo,
Matheus Medeiros e Wener Wagner.
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdbool.h>
#include <string.h>
#include "manipulacoesArquivos.c"

#ifdef _WIN32
#include <stdlib.h>
#define limpaTela() system("cls")
#else
#include <stdio.h>
#define limpaTela() printf("\e[1;1H\e[2J")
#endif 

int numItensCadastradosCategoria(char *categoria) {
  FILE *arquivo;
  char caminhoCategoria[400] = "../palavras/";
  strcat(caminhoCategoria, categoria);
  strcat(caminhoCategoria, ".txt");

  arquivo = fopen(caminhoCategoria, "r");
  int numItens = numLinhasArquivo(arquivo);
  fclose(arquivo);
  return numItens;
}

int itemCadastradoCategoria(char *item, char *categoria) {
  FILE *arquivo;
  char caminhoCategoria[400] = "../palavras/";
  strcat(caminhoCategoria, categoria);
  strcat(caminhoCategoria, ".txt");

  arquivo = fopen(caminhoCategoria, "r");
  int resultado = palavraExisteArquivo(item, arquivo, numItensCadastradosCategoria(categoria));
  fclose(arquivo);
  return resultado;
}

void cadastrarItemCategoria(char *item, char *categoria) {
  FILE *arquivo;
  char caminhoCategoria[400] = "../palavras/";
  strcat(caminhoCategoria, categoria);
  strcat(caminhoCategoria, ".txt");

  arquivo = fopen(caminhoCategoria, "a");
  inserirItemArquivo(item, arquivo);
  fclose(arquivo);
}

void cadastrarItemInformadosNaJogada(char *item, char itensInformados[][100], int numItensInformados) {
  strcpy(itensInformados[numItensInformados], item);
}

void removerJogador(char nomeJogadores[][20], char sobrenomeJogadores[][20],
   int numJogador, int numParticipantes) {
     printf("\n%s %s, infelizmente você está fora da jogada.\n",
     nomeJogadores[numJogador], sobrenomeJogadores[numJogador]);
	 sleep(1);

     for (int j = numJogador; j < numParticipantes - 1; j++) {
         strcpy(nomeJogadores[j], nomeJogadores[j + 1]);
         strcpy(sobrenomeJogadores[j], sobrenomeJogadores[j + 1]);
     }
}

void retiraQuebraDeLinha(char c[]) {
	size_t len = strlen(c);
	if (c[len - 1] == '\n') c[--len] = 0;
}

char* sorteiaCategoria() {
  FILE *arquivo;
  /*O caminho do arquivo deve ser generalizado*/
  arquivo = fopen("../palavras/categorias.txt", "r");
  int numCategoriasCadastradas = numLinhasArquivo(arquivo);
  fclose(arquivo);

  // Gera um valor aleatório entre zero e o número de categorias cadastradas -1.
  int linhaCategoriaSorteada = rand() % numCategoriasCadastradas - 1;

  arquivo = fopen("../palavras/categorias.txt", "r");
  char *palavra;
  palavra = (char*)malloc(50 *sizeof(char));
  palavra = palavraLinha(linhaCategoriaSorteada, arquivo);
  fclose(arquivo);
  return palavra;
}

int itemInformadoAntes(char *item, char itensInformados[][100], int numItensInformados) {
  int resultado = 0;
  for (int i = 0; i < numItensInformados; i++) {
    if (strcmp(item, itensInformados[i]) == 0) {
      resultado = 1;
      break;
    }
  }
  return resultado;
}
// ---- jogo_mensagem.h ---- START
// BUG: A acentuação está ficando esquisita entre sistemas operacionais diferentes.
void cabecalho() {
    printf("========== JOGO CATEGORIAS ==========\n\n");
}

void mensagem_apresentacao() {
    limpaTela();
    cabecalho();
    printf("Bem vind@ ao jogo Categorias!\n");
    printf("Você testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias.\n");
    sleep(3);
}

void mensagem_menuPrincipal() {
    limpaTela();
    cabecalho();
    printf("Você deseja começar um novo jogo?\n");
    printf("1 - Novo Jogo\n");
    printf("2 - Sair\n");
}

void mensagem_opcaoInvalida() {
    printf("** Opção inválida. **\n** Reveja as opções possíveis. **\n");
    sleep(2);
}

void mensagem_modosJogo() {
	limpaTela();
	cabecalho();
	printf("Digite o número correspondente ao modo que você quer.\n");
	printf("1 - Modo Treino\n"); 
	printf("2 - Modo Alternado\n");
	printf("3 - Modo Clássico\n");
	printf("4 - Voltar\n");
}

void mensagem_modoClassicoSelecionado() {
	limpaTela();
	cabecalho();
	printf("Modo Clássico selecionado\n");
	sleep(1);
}

void mensagem_modoAlternadoSelecionado() {
	limpaTela();
	cabecalho();
	printf("Modo Alternado selecionado\n");
	sleep(1);
}

void mensagem_modoTreinoSelecionado() {
	limpaTela();
	cabecalho();
	printf("Modo Treino selecionado\n");
	sleep(1);
}

void mensagem_numJogadores() {
	limpaTela();
	cabecalho();
	printf("Digite a quantidade de jogadores.\n");
	printf("Este valor deve estar entre 2 e 8 inclusive:\n");
}

void mensagem_nomeJogadores() {
	limpaTela();
	cabecalho();
	
	printf("Digite o nome e sobrenome do(s) jogador(es) humano(s).\n");
	printf("Um jogador por linha:\n");
}

void mensagem_jogadoresCadastrados(int numParticipantes, char nomeJogadores[][20], char sobrenomeJogadores[][20]) {
	
	printf("\nJogador(es) cadastrado(s):\n");
	for (int i = 0; i < numParticipantes; i++) {
		printf("Jogador %d: %s %s\n", i + 1, nomeJogadores[i], sobrenomeJogadores[i]);
	}
	sleep(2);
}

void mensagem_categoriaSorteada(char categoriaSorteada[]) {
	limpaTela();
	cabecalho();
	printf("Categoria sorteada: %s\n\n", categoriaSorteada);
	printf("Cada jogador deverá informar um ítem pertencente à categoria sorteada.\n");
	printf("Caso não se recorde de algum item, digite #\n");
	
	sleep(5);
}

void mensagem_informarPalavraCategoria(char categoriaSorteada[], char nomeJogador[], char sobrenomeJogador[]) {
	limpaTela();
	cabecalho();
	printf("Categoria: %s\n", categoriaSorteada);
	printf("Vez do jogador(a): %s %s\n\n", nomeJogador, sobrenomeJogador);
	printf("Informe um ítem desta categoria (sem acentos): \n");
}

void mensagem_itemAceito() {
	printf("\nAceito!\n");
	sleep(1);
}

void mensagem_palavraNaoCadastrada() {
	printf("\nATENÇÂO! Esta palavra não está cadastrada!\n");
	printf("\nEste ítem pertence mesmo a esta categoria? s/n\n");
}

void mensagem_vencedor(char nomeJogador[], char sobrenomeJogador[]) {
	limpaTela();
	cabecalho();
	printf("O vencedor da vez é: %s %s. Parabéns!\n\n", nomeJogador, sobrenomeJogador);
	sleep(4);
}

void mensagem_modoAlternadoSorteio(char categoriaSorteada[]) {
	limpaTela();
	cabecalho();
	printf("Modo Alternado: Uma nova categoria foi sorteada: %s\n", categoriaSorteada);
	sleep(3);
}
// ---- jogo_mensagem.h ---- END


// ---- jogo_constantes.h ---- START
// Opcoes menu inicial
#define OPCAO_INVALIDA -1
#define NOVO_JOGO 1
#define SAIDA 2

// Opcoes menu modos
#define MODO_NAO_SELECIONADO -1
#define MODO_TREINO 1
#define MODO_ALTERNADO 2
#define MODO_CLASSICO 3
#define VOLTAR 4

// Numero de jogadores
#define NUM_MINIMO_JOGADORES 2
#define NUM_MAXIMO_JOGADORES 8
#define NUM_JOGADORES_INVALIDO -1

// ---- jogo_constantes.h ---- END


// ---- jogo_entrada.h ---- START
void prompt() {
    printf(">> ");
}

int entrada_pegarOpcaoMenu() {
	
	prompt();
	
	int opcao;
    scanf("%d", &opcao);
    setbuf(stdin, NULL);	// TODO: checar funcionamento do setbuf direito
	
    if (opcao != NOVO_JOGO && opcao != SAIDA) {
        opcao = OPCAO_INVALIDA;
    }
    return opcao;
}

int entrada_pegarModoJogo() {
    
    prompt();

    int modo;
    scanf("%d", &modo);
    setbuf(stdin, NULL);	// TODO: checar funcionamento do setbuf direito
	
    if (modo != MODO_TREINO && modo != MODO_ALTERNADO && modo != MODO_CLASSICO && modo != VOLTAR) {
        modo = MODO_NAO_SELECIONADO;
    }
    return modo;
}

int entrada_pegarNumJogadores() {
	
	prompt();
	
	int numJogadores;
	scanf("%d", &numJogadores);
	setbuf(stdin, NULL);	// TODO: checar funcionamento do setbuf direito
	
	if (numJogadores < NUM_MINIMO_JOGADORES || numJogadores > NUM_MAXIMO_JOGADORES) {
		numJogadores = NUM_JOGADORES_INVALIDO;
	}
	
	return numJogadores;
}


void entrada_receberNomeSobrenomeJogadores(int numParticipantes, char nomeJogadores[][20], char sobrenomeJogadores[][20]) {
	
	mensagem_nomeJogadores();
	
	for (int i = 0; i < numParticipantes; i++) {
		printf("Jogador %d: ", i + 1);
		scanf("%s %s", nomeJogadores[i], sobrenomeJogadores[i]);
	}
	
	mensagem_jogadoresCadastrados(numParticipantes, nomeJogadores, sobrenomeJogadores);
}

void entrada_pegarPalavraInformada(char itemInformado[]) {
	prompt();
	setbuf(stdin, NULL);
	fgets(itemInformado, 100, stdin);
	retiraQuebraDeLinha(itemInformado);
	setbuf(stdin, NULL);
}

// ---- jogo_entrada.h ---- END

int loopEscolhaNumJogadores() {
	
	int numParticipantes = NUM_JOGADORES_INVALIDO;
	
	while (numParticipantes == NUM_JOGADORES_INVALIDO) {
		
		mensagem_numJogadores();
		
		numParticipantes = entrada_pegarNumJogadores();
	
		if (numParticipantes == NUM_JOGADORES_INVALIDO) {
			mensagem_opcaoInvalida();
		}
	}
	return numParticipantes;
}

void modoTreino() {
	mensagem_modoTreinoSelecionado();
}

void modoGenerico(int modo) {
	
	int numParticipantes = loopEscolhaNumJogadores();
	char nomeJogadores[numParticipantes + 1][20], sobrenomeJogadores[numParticipantes + 1][20];
	
	entrada_receberNomeSobrenomeJogadores(numParticipantes, nomeJogadores, sobrenomeJogadores);
	
	char *categoriaSorteada;
    categoriaSorteada = (char*)malloc(50 *sizeof(char));
	
	do {
		categoriaSorteada = sorteiaCategoria();
		
		mensagem_categoriaSorteada(categoriaSorteada);

		int numItensInformados = 0;
        char itensInformados[500][100];
        char itemInformado[100];
		
		while (numItensInformados <= numItensCadastradosCategoria(categoriaSorteada) && numParticipantes > 1) {
			int i = 0;
			while (i < numParticipantes && numParticipantes > 1) {
				
				mensagem_informarPalavraCategoria(categoriaSorteada, nomeJogadores[i], sobrenomeJogadores[i]);
				
				entrada_pegarPalavraInformada(itemInformado);

				//o jogador não sabe de um ítem ou disse um que já foi dito.
				if (strcmp(itemInformado, "#") == 0 || itemInformadoAntes(itemInformado, itensInformados, numItensInformados)) {
					removerJogador(nomeJogadores, sobrenomeJogadores, i, numParticipantes);
					numParticipantes--;

					if (numParticipantes > 1 && modo == MODO_ALTERNADO) {
						categoriaSorteada = sorteiaCategoria();
						mensagem_modoAlternadoSorteio(categoriaSorteada);
					}
				} //o jogador informou um ítem cadastrado na categoria.
				else if (itemCadastradoCategoria(itemInformado, categoriaSorteada)) {
					cadastrarItemInformadosNaJogada(itemInformado, itensInformados, numItensInformados);
					numItensInformados++;

					mensagem_itemAceito();
				} //o jogador informou um ítem ainda não cadastrado.
				else {
					mensagem_palavraNaoCadastrada();
					
					prompt();
					char resposta[5];
					scanf("%s", resposta);
					if (strcmp(resposta, "s") == 0) {
						cadastrarItemInformadosNaJogada(itemInformado, itensInformados, ++numItensInformados);
						cadastrarItemCategoria(itemInformado, categoriaSorteada);
						
						mensagem_itemAceito();
					} else {
						removerJogador(nomeJogadores, sobrenomeJogadores, i, numParticipantes);
						numParticipantes--;
						
						if (numParticipantes > 1 && modo == MODO_ALTERNADO) {
							categoriaSorteada = sorteiaCategoria();
							mensagem_modoAlternadoSorteio(categoriaSorteada);
						}
					}
				}
				i++;
			}
		}
	} while (numParticipantes > 1);
	
	mensagem_vencedor(nomeJogadores[0], sobrenomeJogadores[0]);
}

void modoAlternado() {
	
	mensagem_modoAlternadoSelecionado();
	
	modoGenerico(MODO_ALTERNADO);
}

void modoClassico() {
	
	mensagem_modoClassicoSelecionado();
	
	modoGenerico(MODO_CLASSICO);	
}

void loopEscolhaModoJogo() {
	
	int modoDeJogo = MODO_NAO_SELECIONADO;
	while (modoDeJogo == MODO_NAO_SELECIONADO) {
	
		mensagem_modosJogo();
		
		modoDeJogo = entrada_pegarModoJogo();
		switch (modoDeJogo) {
			case MODO_TREINO:
				modoTreino();
				printf("A ser implementado, voce sera redirecionado para o menu inicial\n");
				system("pause");
			break;
			case MODO_ALTERNADO:
				modoAlternado();
			break;
			case MODO_CLASSICO:
				modoClassico();
			break;

			case MODO_NAO_SELECIONADO:
				mensagem_opcaoInvalida();
			break;
		}
	}
}

int main() {

    mensagem_apresentacao();

    bool jogoRodando = true;
    while (jogoRodando) {
		
        mensagem_menuPrincipal();
		
        int opcao = entrada_pegarOpcaoMenu();
		
        switch (opcao) {
            case NOVO_JOGO:
				loopEscolhaModoJogo();
			break;
            case SAIDA:
                jogoRodando = false;
            break;
            case OPCAO_INVALIDA:
                mensagem_opcaoInvalida();
                // BUG: Quando digita texto, a msg de erro permanece.
            break;
        }
    }

    return 0;
}