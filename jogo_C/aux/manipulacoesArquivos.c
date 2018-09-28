/*
** As funções implementadas neste módulo servem para manipular
** os arquivos do diretório palavras.
*/
#ifndef MANIPULACOESARQUIVOS
#define MANIPULACOESARQUIVOS
#include <string.h>
#include "refatoraString.c"

/*
Retorna a quantidade de linhas de um arquivo.
*/
int numLinhasArquivo(FILE *arquivo) {
  int numLinhas = 0;
  char c;

  if (arquivo == NULL) {
    printf("O arquivo não foi encontrado\n");
  } else {
    while (fread(&c, sizeof(char), 1, arquivo)) {
      if (c == '\n') {
        numLinhas++;
      }
    }
  }
  return numLinhas;
}

/*
Retorna a palavra presente em uma dada linha de um arquivo.
*/
char* palavraLinha(int linha, FILE *arquivo) {
    int linhaAtual = 0;
    char *palavra;
    char c;
    int indice = 0;
    palavra = (char*)malloc(50 *sizeof(char));

    if (arquivo == NULL) {
      printf("O arquivo não foi encontrado\n");
    } else {
      do {
        indice = 0;
        while (fread(&c, sizeof(char), 1, arquivo)) {
          if (c == '\n') {
            break;
          }
          palavra[indice++] = c;
        }
        palavra[indice] = '\0';
      } while (linhaAtual++ != linha);
    }

    return palavra;
}

/*
Verifica se uma dada palavra pertence a um dado arquivo.
Retorna 1 caso exista e 0 caso contrário.
*/
int palavraExisteArquivo(char *palavra, FILE *arquivo, int numLinhas) {
   char *palavraAtual;
   palavraAtual = (char*)malloc(50 *sizeof(char));
   char c;
   int existe = 0;
   int linhaAtual = 0;

   if (arquivo == NULL) {
     printf("O arquivo não foi encontrado\n");
   } else {
     do {
       int indice = 0;
       while (fread(&c, sizeof(char), 1, arquivo)) {
         if (c == '\n') {
           linhaAtual++;
           break;
         }
         palavraAtual[indice++] = c;
       }
       palavraAtual[indice] = '\0';

       transformaMaiusculaEmMinuscula(palavra);
       if (strcmp(palavra, palavraAtual) == 0) {
         existe = 1;
         break;
       }
     } while (linhaAtual != numLinhas);
   }

   return existe;
}

/*
Insere um ítem informado em uma linha de uma dado arquivo.
*/
void inserirItemArquivo(char *item, FILE *arquivo) {
  if (arquivo == NULL) {
    printf("O arquivo não foi encontrado\n");
  } else {
	transformaMaiusculaEmMinuscula(item);
    fprintf(arquivo, "%s\n", item);
  }
}

#endif
