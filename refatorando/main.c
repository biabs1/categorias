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


// ---- jogo_mensagens.h ---- START

void cabecalho() {
    printf("==== JOGO CATEGORIAS ====\n");
}

void mensagemApresentacao() {
    limpaTela();
    cabecalho();
    printf("Bem vind@ ao jogo Categorias!\n");
    printf("Você testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias.\n");
    sleep(3);
    printf("IMPORTANTE: seu tempo é limitado, então seu cérebro deve funcionar rápido!\n");
    printf("COOOORRE Cérebro!\n");
    sleep(4);
}

void mensagemNovoJogo() {
    limpaTela();
    cabecalho();
    printf("Você deseja começar um novo jogo?\n");
    printf("1 - Novo Jogo\n");
    printf("2 - Sair\n");
}

void mensagemOpcaoInvalida() {
    printf("** Opção inválida. **\n** Reveja as opções possíveis. **\n");
    sleep(2);
}
// ---- jogo_mensagens.h ---- END


// ---- jogo_opcoes.h ---- START
#define OPCAO_INVALIDA -1

#define NOVO_JOGO 1
#define SAIDA 2

// ---- jogo_opcoes.h ---- END



// ---- jogo_entrada.h ---- START
void prompt() {
    printf(">> ");
}

int entrada_pegarOpcao() {
    
    prompt();

    int opcao;
    scanf("%d", &opcao);
    setbuf(stdin, NULL);

	printf("opcao eh %d", opcao);
	
    if (opcao != NOVO_JOGO && opcao != SAIDA) {
        opcao = OPCAO_INVALIDA;
    }
    return opcao;
}
// ---- jogo_entrada.h ---- END

int main() {

    mensagemApresentacao();

    bool jogoRodando = true;
    while (jogoRodando) {
        mensagemNovoJogo();
        int opcao = entrada_pegarOpcao();
        switch (opcao) {
            case NOVO_JOGO:
                // faz algo
            break;
            case SAIDA:
                jogoRodando = false;
            break;
            case OPCAO_INVALIDA:
                mensagemOpcaoInvalida();
                // BUG: Quando digita texto, a msg de erro permanece.
            break;
        }
    }

    return 0;
}

























