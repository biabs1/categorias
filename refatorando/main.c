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
    limpaTela();
    cabecalho();
    printf("Bem vind@ ao jogo Categorias!\n");
    printf("Você testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias.\n");
    sleep(3);
    printf("IMPORTANTE: seu tempo é limitado, então seu cérebro deve funcionar rápido!\n");
    printf("COOOORRE Cérebro!\n");
    sleep(4);
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
// ---- jogo_mensagem.h ---- END


// ---- jogo_opcoes.h ---- START
#define OPCAO_INVALIDA -1
#define NOVO_JOGO 1
#define SAIDA 2

#define MODO_NAO_SELECIONADO -1
#define MODO_TREINO 1
#define MODO_ALTERNADO 2
#define MODO_CLASSICO 3
#define VOLTAR 4

// ---- jogo_opcoes.h ---- END


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
// ---- jogo_entrada.h ---- END

void loopEscolhaModoJogo() {
	
	int modoDeJogo = MODO_NAO_SELECIONADO;
	while (modoDeJogo == MODO_NAO_SELECIONADO) {
	
		mensagem_modosJogo();
		
		modoDeJogo = entrada_pegarModoJogo();
		switch (modoDeJogo) {
			case MODO_TREINO:
				printf("Modo Treino Selecionado\n");
				printf("A ser implementado, voce sera redirecionado para o menu inicial\n");
				system("pause");
			break;
			case MODO_ALTERNADO:
				printf("Modo Alternado Selecionado\n");
				printf("A ser implementado, voce sera redirecionado para o menu inicial\n");
				system("pause");
			break;
			case MODO_CLASSICO:
				printf("Modo Clássico Selecionado\n");
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