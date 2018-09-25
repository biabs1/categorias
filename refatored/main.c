/* PLP - 2018.2

Jogo Categorias.

Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo,
Matheus Medeiros e Wener Wagner.
*/

#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

#ifdef _WIN32
#include <conio.h>
#else
#include <stdio.h>
#define clrscr() printf("\e[1;1H\e[2J")
#endif


// ---- game_messages.h ---- START

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
}

void messageInvalidOption() {
    printf("** Opção inválida. **\n** Reveja as opções possíveis. **\n");
    sleep(2);
}
// ---- game_messages.h ---- END


// ---- game_options.h ---- START
#define INVALID_OPTION -1

#define NEW_GAME 1
#define EXIT 2

// ---- game_options.h ---- END



// ---- game_input.h ---- START
void prompt() {
    printf(">> ");
}

int input_getOption() {
    
    prompt();

    int option;
    scanf("%d", &option);
    setbuf(stdin, NULL);

    if (option != NEW_GAME && option != EXIT) {
        option = INVALID_OPTION;
    }
    return option;
}
// ---- game_input.h ---- END

int main() {

    messagePresentation();

    bool gameRunning = true;

    while (gameRunning) {
        messageNewGame();
        int option = input_getOption();
        switch (option) {
            case NEW_GAME:
                // faz algo
            break;
            case EXIT:
                gameRunning = false;
            break;
            case INVALID_OPTION:
                messageInvalidOption();
                // BUG: Quando digita texto, a msg de erro permanece.
            break;
        }
    }

    return 0;
}

























