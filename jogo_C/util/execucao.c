#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h> 
#include "manipulacoesArquivos.c"
#include "../modos/classico.c"
#include "../modos/treino.c"
#include "mensagens.c"
#include "entradas.c"

#ifdef _WIN32
#include <stdlib.h>
#define limpaTela() system("cls")
#else
#include <stdio.h>
#define limpaTela() printf("\e[1;1H\e[2J")
#endif 

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

void modoGenerico(int modo) {
	
	int numParticipantes = loopEscolhaNumJogadores();
	char nomeJogadores[numParticipantes + 1][20], sobrenomeJogadores[numParticipantes + 1][20];
	
	if(modo == MODO_TREINO) {
		entrada_receberNomeSobrenomeJogadores(1, nomeJogadores, sobrenomeJogadores);
		definirNomeSobrenomeBots(numParticipantes, nomeJogadores, sobrenomeJogadores);
	} else {
		entrada_receberNomeSobrenomeJogadores(numParticipantes, nomeJogadores, sobrenomeJogadores);
	}
	
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
				
				if (modo == MODO_TREINO && jogadorEBot(nomeJogadores[i], sobrenomeJogadores[i])) {
					if (botSabeResposta()) {
						strcpy(itemInformado, sorteiaItemCategoria(categoriaSorteada));
						printf("%s\n", itemInformado);
					} else {
						printf("#\n");
						strcpy(itemInformado, "#");
					}
				} else {
					entrada_pegarPalavraInformada(itemInformado);
				}

				//o jogador não sabe de um ítem ou disse um que já foi dito.
				if (strcmp(itemInformado, "#") == 0 || itemInformadoAntes(itemInformado, itensInformados, numItensInformados)) {
                    mensagem_perdedor(nomeJogadores[i], sobrenomeJogadores[i]);
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
					if (modo == MODO_TREINO) {
						sleep(1);
					}
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
                        mensagem_perdedor(nomeJogadores[i], sobrenomeJogadores[i]);
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

void modoTreino() {
	mensagem_modoTreinoSelecionado();	
	
	modoGenerico(MODO_TREINO);
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
