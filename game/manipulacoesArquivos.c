/*
** As funções implementadas neste módulo servem para manipular
** os arquivos do diretório palavras.
*/

#include <string.h>

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
  return numLinhas + 1;
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
          palavra[indice++] = c;
          if (c == '\n') {
            break;
          }
        }
      } while (linhaAtual++ != linha);
    }

    return palavra;
}

/*
Verifica se uma dada palavra pertence a um dado arquivo.
Retorna 1 caso exista e 0 caso contrário.
*/
int palavraExisteArquivo(char *palavra, FILE *arquivo) {
   char *palavraAtual;
   palavraAtual = (char*)malloc(50 *sizeof(char));
   int existe = 0;

   if (arquivo == NULL) {
     printf("O arquivo não foi encontrado\n");
   } else {
     while (fgets(palavraAtual, sizeof(palavraAtual), arquivo) != NULL && existe == 0) {
       printf("%s %s\n", palavra, palavraAtual);
       if (strcmp(palavra, palavraAtual) == 0) {
         existe = 1;
       }
     }
   }

   return existe;
}

/*
Insere um ítem informado em uma linha de uma dado arquivo.
*/
void inserirItemArtigo(char *item, FILE *arquivo) {
  if (arquivo == NULL) {
    printf("O arquivo não foi encontrado\n");
  } else {
    strcat(item, "\n");
    fprintf(arquivo, item);
  }
}
