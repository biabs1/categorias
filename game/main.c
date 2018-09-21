/* PLP - 2018.2

Jogo Categorias.

Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo,
Matheus Medeiros e Wener Wagner.
*/

#include<stdio.h>
#include "validacoes.c"

void imprimePequenaApresentacaoJogo() {
  printf("Bem vind@ ao jogo Categorias!\nVocê testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias.\nIMPORTANTE: seu tempo é limitado, então seu cérebro deve funcionar rápido!\nCOOOORRE Cérebro!\n");
}

int main() {

    imprimePequenaApresentacaoJogo();

    int novoJogo, numParticipantes, modoDeJogo;

   //Laço responsável por iniciar novos jogos ou encerrar as jogadas.
    do {
        printf("\nVocê deseja começar um novo jogo?\nInforme 1 se sim e 0 caso contrário:\n");
        scanf("%d", &novoJogo);
        setbuf(stdin, NULL);

        if (novoJogoValido(novoJogo)) {
            if (novoJogo == 1) {
                //Laço responsável por receber e validar o modo de jogo.
                do {
                    printf("\nDigite o número correspondente ao modo que você quer.\nTreino(1), Modo Alternado(2) ou Modo Clássico(3):\n");
                    scanf("%d", &modoDeJogo);
                    setbuf(stdin, NULL);

                    if (!modoDeJogoValido(modoDeJogo)) {
                        printf("\nModo inválido.\nReveja os modos de jogo possíveis.\n");
                    }
                } while (!modoDeJogoValido(modoDeJogo));

               //Laço responsável por receber e validar a quantidade de jogadores.
                do {
                    printf("\nDigite a quantidade de jogadores.\nEste valor deve estar entre 2 e 8 inclusive:\n");
                    scanf("%d", &numParticipantes);
                    setbuf(stdin, NULL);

                    if (!numParticipantesValido(numParticipantes)) {
                        printf("\nNúmero de participantes inválido.\nReveja a quantidade de jogadores possível\n");
                    }
                } while (!numParticipantesValido(numParticipantes));

                char nomeJogadores[numParticipantes + 1][20], sobrenomeJogadores[numParticipantes + 1][20];

                printf("\nDigite o nome e sobrenome dos jogadores.\nUm jogador por linha:\n");
                for (int i = 0; i < numParticipantes; i++) {
                    printf("Jogador %d: ", i + 1);
                    scanf("%s %s", nomeJogadores[i], sobrenomeJogadores[i]);
                }

                printf("\n\nJogadores:\n");
                for (int i = 0; i < numParticipantes; i++) {
                    printf("Jogador %d: %s %s\n", i + 1, nomeJogadores[i], sobrenomeJogadores[i]);
                }



                if (modoDeJogo == 1) {
                    printf("\nVocê escolheu a opção Treino!\n");
                } else if (modoDeJogo == 2) {
                    printf("\nVocê escolheu a opção Modo Alternado!\n");
                } else if (modoDeJogo == 3) {
                    printf("\nVocê escolheu a opção de Modo Clássico!\n");

                    FILE *arquivo;
                    /*O caminho do arquivo deve ser generalizado*/
                    arquivo = fopen("/home//beatriz//Downloads//categorias-master//palavras//categorias.txt", "r");
                    int numCategoriasCadastradas = numLinhasArquivo(arquivo);
                    // Gera um valor aleatório entre zero e o número de categorias cadastradas.
                    int linhaCategoriaSorteada = rand() % numCategoriasCadastradas - 1;
                    printf("\ncategoria sorteada: %d\n", linhaCategoriaSorteada);

                    /* Deve-se sortear novas categorias até que não exista vencedor. */
                }

           } else {
               printf("\nQue pena!\nVolte logo!\n");
           }

       } else {
           printf("\nNúmero inválido.\nReveja as opções possíveis.\n");
       }

   } while(novoJogo);

  return 0;
}

