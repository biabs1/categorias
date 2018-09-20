/* PLP - 2018.2

Jogo Categorias.

Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo,
Matheus Medeiros e Wener Wagner.
*/

#include<stdio.h>
#include "validacoes.h"

void imprimePequenaApresentacaoJogo() {
  printf("Bem vind@ ao jogo Categorias!\n /
      Você testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias.\n /
      IMPORTANTE: seu tempo é limitado, então seu cérebro deve funcionar rápido!\n /
      COOOORRE Cérebro!\n\n");
}

int main() {

   imprimePequenaApresentacaoJogo();

   int novoJogo;
   int numParticipantes;
   int modoDeJogo;

   //Laço responsável por iniciar novos jogos ou encerrar as jogadas.
   do{
       printf("Você deseja começar um jogo?\n");
       printf("Informe 1 se sim e 0 caso contrário\n");
       scanf("%d", &novoJogo);

       if(novoJogoValido(novoJogo)){

           if (novoJogo == 1) {
               //Laço responsável por receber e validar o modo de jogo.
               do {
                   printf("Digite o número correspondente ao modo que você quer!\n /
                     Treino(1), Modo Alternado(2) ou Modo Clássico(3): ");
                   scanf("%d", &modoDeJogo);

                   if (!modoDeJogoValido(modoDeJogo)) {
                       printf("Modo inválido. Reveja os modos de jogo possíveis.\n");
                   }
               } while(!modoDeJogoValido(modoDeJogo));

               //Laço responsável por receber e validar a quantidade de jogadores.
               do {
                   printf("Digite a quantidade de jogadores.\n /
                     Este valor deve estar entre 2 e 8 inclusive: ");
                   scanf("%d", &numParticipantes);

                   if (!numParticipantesValido(numParticipantes)) {
                       printf("Número de participantes inválido. Reveja a quantidade de jogadores possível\n");
                   }
               } while(!numParticipantesValido(numParticipantes));

               if(modoDeJogo == 1){
                   printf("Você escolheu a opção Treino\n");
               } else if(modoDeJogo == 2){
                   printf("Você escolheu a opção Modo Alternado!\n");
               } else {
                   printf("Você escolheu a opção de Modo Clássico!\n");
               }

           } else {
               printf("Que pena! Volte logo.\n");
           }

       } else {
           printf("Número inválido. Reveja as opções possíveis.\n");
       }

   } while(novoJogo);

  return 0;
}
