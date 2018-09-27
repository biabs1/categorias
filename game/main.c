/* PLP - 2018.2

Jogo Categorias.

Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo,
Matheus Medeiros e Wener Wagner.
*/

#include <stdio.h>
#include <stdlib.h>
#include "validacoes.c"
#include "modos/classico.c"
#include "modos/treino.c"

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

                if (modoDeJogo == 1) {
                  printf("Cuidado para não ser derrotado(a) pelo(s) bot(s)!\n");

                  receberNomeSobrenomeJogadores(1, nomeJogadores, sobrenomeJogadores);
                  definirNomeSobrenomeBots(numParticipantes, nomeJogadores, sobrenomeJogadores);

                  printf("\nVocê escolheu a opção de Modo Treino!\n");


                  char *categoriaSorteada;
                  categoriaSorteada = (char*)malloc(50 *sizeof(char));

                  do {
                    categoriaSorteada = sorteiaCategoria();
                    printf("\ncategoria sorteada: %s\n", categoriaSorteada);

                    printf("\nCada jogador deverá informar um ítem pertencente à categoria sorteada.\n");
                    printf("Caso não se recorde de algum item, digite #\n\n");

                    int numItensInformados = 0;
                    char itensInformados[500][100];
                    char itemInformado[100];

                    while (numItensInformados <= numItensCadastradosCategoria(categoriaSorteada)
                      && numParticipantes > 1) {
                        int i = 0;

                        while (i < numParticipantes && numParticipantes > 1) {
                          printf("Jogador(a): %s %s, informe um ítem desta categoria: ",
                            nomeJogadores[i], sobrenomeJogadores[i]);

                            if (jogadorEBot(nomeJogadores[i], sobrenomeJogadores[i])) {
                              if (botSabeResposta()) {
                                itemInformado = sorteiaItemCategoria(categoriaSorteada);
                                printf("%s\n", itemInformado);
                              } else {
                                printf("#\n");
                                strcpy(itemInformado, "#");
                              }

                            } else {
                              scanf("%s", itemInformado);
                            }
                          
                            //o jogador não sabe de um ítem ou disse um que já foi dito.
                            if (strcmp(itemInformado, "#") == 0 || itemInformadoAntes(
                              itemInformado, itensInformados, numItensInformados)) {
                                removerJogador(nomeJogadores, sobrenomeJogadores, i, numParticipantes);
                                numParticipantes--;
                            } //o jogador informou um ítem cadastrado na categoria.
                            else if (itemCadastradoCategoria(itemInformado, categoriaSorteada)) {
                              cadastrarItemInformadosNaJogada(
                                itemInformado, itensInformados, numItensInformados);
                              numItensInformados++;

                              for (int k = 0; k < numItensInformados; k++) {
                                printf("%s\n", itensInformados[k]);
                              }
                            } //o jogador informou um ítem ainda não cadastrado.
                            else {
                              printf("\n\nATENÇÂO!\nEste ítem pertence mesmo a esta categoria? s/n\n");
                              char resposta[5];
                              scanf("%s", resposta);
                              if (strcmp(resposta, "s") == 0) {
                                cadastrarItemInformadosNaJogada(
                                  itemInformado, itensInformados, ++numItensInformados);
                                cadastrarItemCategoria(itemInformado, categoriaSorteada);
                              } else {
                                removerJogador(nomeJogadores, sobrenomeJogadores, i, numParticipantes);
                                numParticipantes--;
                              }
                            }

                            i++;
                        }
                      }
                  } while (numParticipantes > 1);

                  printf("\n\nO vencedor da vez é: %s %s. Parabéns!\n\n", nomeJogadores[0], sobrenomeJogadores[0]);

                } else if (modoDeJogo == 2) {
                    receberNomeSobrenomeJogadores(numParticipantes, nomeJogadores, sobrenomeJogadores);
                    printf("\nVocê escolheu a opção Modo Alternado!\n");

                    char *categoriaSorteada;
                    categoriaSorteada = (char*)malloc(50 *sizeof(char));
                    categoriaSorteada = sorteiaCategoria();
                    printf("\ncategoria sorteada: %s\n", categoriaSorteada);

                    do {
                      printf("\nCada jogador deverá informar um ítem pertencente à categoria sorteada.\n");
                      printf("Caso não se recorde de algum item, digite #\n\n");

                      int numItensInformados = 0;
                      char itensInformados[500][100];
                      char itemInformado[100];

                      while (numItensInformados <= numItensCadastradosCategoria(categoriaSorteada)
                        && numParticipantes > 1) {
                          int i = 0;

                          while (i < numParticipantes && numParticipantes > 1) {
                            printf("Jogador(a): %s %s, informe um ítem desta categoria: ",
                              nomeJogadores[i], sobrenomeJogadores[i]);

              if(cronometro(10) == 0){
                                printf("\n%s\n", "Tempo esgotado, informe um í­tem desta categoria: ");
                              }
                              scanf("%s", itemInformado);

                              //o jogador não sabe de um ítem ou disse um que já foi dito.
                              if (strcmp(itemInformado, "#") == 0 || itemInformadoAntes(
                                itemInformado, itensInformados, numItensInformados)) {
                                  removerJogador(nomeJogadores, sobrenomeJogadores, i, numParticipantes);
                                  numParticipantes--;

                                if (numParticipantes > 1) {
                                  categoriaSorteada = sorteiaCategoria();
                                  printf("\n\ncategoria sorteada: %s\n", categoriaSorteada);
                                }

                              } //o jogador informou um ítem cadastrado na categoria.
                              else if (itemCadastradoCategoria(itemInformado, categoriaSorteada)) {
                                cadastrarItemInformadosNaJogada(
                                  itemInformado, itensInformados, numItensInformados);
                                numItensInformados++;

                                for (int k = 0; k < numItensInformados; k++) {
                                  printf("%s\n", itensInformados[k]);
                                }
                              } //o jogador informou um ítem ainda não cadastrado.
                              else {
                                printf("\n\nATENÇÂO!\nEste ítem pertence mesmo a esta categoria? s/n\n");
                                char resposta[5];
                                scanf("%s", resposta);
                                if (strcmp(resposta, "s") == 0) {
                                  cadastrarItemInformadosNaJogada(
                                    itemInformado, itensInformados, ++numItensInformados);
                                  cadastrarItemCategoria(itemInformado, categoriaSorteada);
                                } else {
                                  removerJogador(nomeJogadores, sobrenomeJogadores, i, numParticipantes);
                                  numParticipantes--;

                                  if (numParticipantes > 1) {
                                    categoriaSorteada = sorteiaCategoria();
                                    printf("\n\ncategoria sorteada: %s\n", categoriaSorteada);
                                  }
                                }
                              }

                              i++;
                          }
                        }
                    } while (numParticipantes > 1);

                    printf("\n\nO vencedor da vez é: %s %s. Parabéns!\n\n", nomeJogadores[0], sobrenomeJogadores[0]);

                } else if (modoDeJogo == 3) {
                    receberNomeSobrenomeJogadores(numParticipantes, nomeJogadores, sobrenomeJogadores);
                    printf("\nVocê escolheu a opção de Modo Clássico!\n");

                    char *categoriaSorteada;
                    categoriaSorteada = (char*)malloc(50 *sizeof(char));

                    do {
                      categoriaSorteada = sorteiaCategoria();
                      printf("\ncategoria sorteada: %s\n", categoriaSorteada);

                      printf("\nCada jogador deverá informar um ítem pertencente à categoria sorteada.\n");
                      printf("Caso não se recorde de algum item, digite #\n\n");

                      int numItensInformados = 0;
                      char itensInformados[500][100];
                      char itemInformado[100];

                      while (numItensInformados <= numItensCadastradosCategoria(categoriaSorteada)
                        && numParticipantes > 1) {
                          int i = 0;

                          while (i < numParticipantes && numParticipantes > 1) {
                            printf("Jogador(a): %s %s, informe um ítem desta categoria: ",
                              nomeJogadores[i], sobrenomeJogadores[i]);
                  
                    if(cronometro(10) == 0){
                                printf("\n%s\n", "Tempo esgotado, informe um Ã­tem desta categoria: ");
                              }
                              scanf("%s", itemInformado);

                              //o jogador não sabe de um ítem ou disse um que já foi dito.
                              if (strcmp(itemInformado, "#") == 0 || itemInformadoAntes(
                                itemInformado, itensInformados, numItensInformados)) {
                                  removerJogador(nomeJogadores, sobrenomeJogadores, i, numParticipantes);
                                  numParticipantes--;
                              } //o jogador informou um ítem cadastrado na categoria.
                              else if (itemCadastradoCategoria(itemInformado, categoriaSorteada)) {
                                cadastrarItemInformadosNaJogada(
                                  itemInformado, itensInformados, numItensInformados);
                                numItensInformados++;

                                for (int k = 0; k < numItensInformados; k++) {
                                  printf("%s\n", itensInformados[k]);
                                }
                              } //o jogador informou um ítem ainda não cadastrado.
                              else {
                                printf("\n\nATENÇÂO!\nEste ítem pertence mesmo a esta categoria? s/n\n");
                                char resposta[5];
                                scanf("%s", resposta);
                                if (strcmp(resposta, "s") == 0) {
                                  cadastrarItemInformadosNaJogada(
                                    itemInformado, itensInformados, ++numItensInformados);
                                  cadastrarItemCategoria(itemInformado, categoriaSorteada);
                                } else {
                                  removerJogador(nomeJogadores, sobrenomeJogadores, i, numParticipantes);
                                  numParticipantes--;
                                }
                              }

                              i++;
                          }
                        }
                    } while (numParticipantes > 1);

                    printf("\n\nO vencedor da vez é: %s %s. Parabéns!\n\n", nomeJogadores[0], sobrenomeJogadores[0]);
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
