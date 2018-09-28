/* PLP - 2018.2

Jogo Categorias.

Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo,
Matheus Medeiros e Wener Wagner.
*/

#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

#ifdef _WIN32
#include <stdlib.h>
#define limpaTela() system("cls")
#else
#include <stdio.h>
#define limpaTela() printf("\e[1;1H\e[2J")
#endif 


// ---- jogo_mensagem.h ---- START
// BUG: A acentuação está ficando esquisita entre sistemas operacionais diferentes.
void cabecalho() {
    printf("========== JOGO CATEGORIAS ==========\n\n");
}

void mensagem_apresentacao() {
	/**
    limpaTela();
    cabecalho();
    printf("Bem vind@ ao jogo Categorias!\n");
    printf("Você testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias.\n");
    sleep(3);
    printf("IMPORTANTE: seu tempo é limitado, então seu cérebro deve funcionar rápido!\n");
    printf("COOOORRE Cérebro!\n");
    sleep(4);
	**/
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
	sleep(2);
}

void mensagem_modoAlternadoSelecionado() {
	limpaTela();
	cabecalho();
	printf("Modo Alternado selecionado\n");
	sleep(2);
}

void mensagem_modoTreinoSelecionado() {
	limpaTela();
	cabecalho();
	printf("Modo Treino selecionado\n");
	sleep(2);
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
// ---- jogo_entrada.h ---- END

void receberNomeSobrenomeJogadores(int numParticipantes, char nomeJogadores[][20], char sobrenomeJogadores[][20]) {
	
	mensagem_nomeJogadores();
	
	for (int i = 0; i < numParticipantes; i++) {
		printf("Jogador %d: ", i + 1);
		scanf("%s %s", nomeJogadores[i], sobrenomeJogadores[i]);
	}
	
	mensagem_jogadoresCadastrados(numParticipantes, nomeJogadores, sobrenomeJogadores);
}

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

void modoAlternado() {
	
	mensagem_modoAlternadoSelecionado();
	
	int numParticipantes = loopEscolhaNumJogadores();
	char nomeJogadores[numParticipantes + 1][20], sobrenomeJogadores[numParticipantes + 1][20];
	
	receberNomeSobrenomeJogadores(numParticipantes, nomeJogadores, sobrenomeJogadores);
}

void modoClassico() {
	
	mensagem_modoClassicoSelecionado();
	
	int numParticipantes = loopEscolhaNumJogadores();
	char nomeJogadores[numParticipantes + 1][20], sobrenomeJogadores[numParticipantes + 1][20];
	
	receberNomeSobrenomeJogadores(numParticipantes, nomeJogadores, sobrenomeJogadores);
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
				printf("A ser implementado, voce sera redirecionado para o menu inicial\n");
				system("pause");
			break;
			case MODO_CLASSICO:
				modoClassico();
				printf("A ser implementado, voce sera redirecionado para o menu inicial\n");
				system("pause");
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