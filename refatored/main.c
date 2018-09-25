/* PLP - 2018.2

Jogo Categorias.

Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo,
Matheus Medeiros e Wener Wagner.
*/

#include <stdio.h>
#include <unistd.h>

#ifdef _WIN32
#include <conio.h>
#else
#include <stdio.h>
#define clrscr() printf("\e[1;1H\e[2J")
#endif


// ---- game_messages.h ---- START

void prompt() {
    printf(">> ");
}

void startBlock() {
    printf("==== JOGO CATEGORIAS ====\n");
}

void endBlock() {
    printf("\n");
}

void messagePresentation() {
    clrscr();
    startBlock();
    printf("Bem vind@ ao jogo Categorias!\n");
    printf("Você testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias.\n");
    sleep(3);
    printf("IMPORTANTE: seu tempo é limitado, então seu cérebro deve funcionar rápido!\n");
    printf("COOOORRE Cérebro!\n");
    sleep(4);
}

void messageNewGame() {
    clrscr();
    startBlock();
    printf("Você deseja começar um novo jogo?\n");
    printf("1 - Novo Jogo\n");
    printf("2 - Sair\n");

    // colocar no canto correto
    prompt();
    char resposta[5];
    scanf("%s", resposta);
    // ------------------------
}

// ---- game_messages.h ---- END

int main() {

    messagePresentation();
    messageNewGame();

    return 0;
}
