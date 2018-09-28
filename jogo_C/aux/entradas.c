#include <stdio.h>

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

void prompt() {
    printf(">> ");
}

int entrada_pegarOpcaoMenu() {
	
prompt();
	
    int opcao;
    scanf("%d", &opcao);
    setbuf(stdin, NULL);
	
    if (opcao != NOVO_JOGO && opcao != SAIDA) {
        opcao = OPCAO_INVALIDA;
    }
    return opcao;
}

int entrada_pegarModoJogo() {
    
    prompt();

    int modo;
    scanf("%d", &modo);
    setbuf(stdin, NULL);
	
    if (modo != MODO_TREINO && modo != MODO_ALTERNADO && modo != MODO_CLASSICO && modo != VOLTAR) {
        modo = MODO_NAO_SELECIONADO;
    }
    return modo;
}

int entrada_pegarNumJogadores() {
	
	prompt();
	
	int numJogadores;
	scanf("%d", &numJogadores);
	setbuf(stdin, NULL);
	
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
