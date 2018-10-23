#ifndef CLASSICO
#define CLASSICO
#include "../util/manipulacoesArquivos.c"
 
/*
Retorna uma categoria sorteada entre as categorias cadastradas.
*/
char* sorteiaCategoria() {
  FILE *arquivo;
  arquivo = fopen("../palavras/categorias.txt", "r");
  int numCategoriasCadastradas = numLinhasArquivo(arquivo);
  fclose(arquivo);

  // Gera um valor aleatório entre zero e o número de categorias cadastradas -1.
  int linhaCategoriaSorteada = rand() % numCategoriasCadastradas - 1;

  arquivo = fopen("../palavras/categorias.txt", "r");
  char *palavra;
  palavra = (char*)malloc(50 *sizeof(char));
  palavra = palavraLinha(linhaCategoriaSorteada, arquivo);
  fclose(arquivo);
  return palavra;
}

/*
Retorna a quantidade de ítens cadastrados em um dada categoria.
*/
int numItensCadastradosCategoria(char *categoria) {
  FILE *arquivo;
  char caminhoCategoria[400] = "../palavras/";
  strcat(caminhoCategoria, categoria);
  strcat(caminhoCategoria, ".txt");

  arquivo = fopen(caminhoCategoria, "r");
  int numItens = numLinhasArquivo(arquivo);
  fclose(arquivo);
  return numItens;
}

/*
Cadastra um novo ítem no arquivo que contém os ítens de uma categoria.
*/
void cadastrarItemCategoria(char *item, char *categoria) {
	transformaMaiusculaEmMinuscula(item);
  FILE *arquivo;
  char caminhoCategoria[400] = "../palavras/";
  strcat(caminhoCategoria, categoria);
  strcat(caminhoCategoria, ".txt");

  arquivo = fopen(caminhoCategoria, "a");
  inserirItemArquivo(item, arquivo);
  fclose(arquivo);
}

/*
Verifica se um dado ítem foi cadastrado em uma dada categoria.
Retorna 1 se sim e 0 caso contrário.
*/
int itemCadastradoCategoria(char *item, char *categoria) {
	transformaMaiusculaEmMinuscula(item);
  FILE *arquivo;
  char caminhoCategoria[400] = "../palavras/";
  strcat(caminhoCategoria, categoria);
  strcat(caminhoCategoria, ".txt");

  arquivo = fopen(caminhoCategoria, "r");
  int resultado = palavraExisteArquivo(item, arquivo, numItensCadastradosCategoria(categoria));
  fclose(arquivo);
  return resultado;
}

/*
Verifica se um dado ítem já foi informado.
Retorna 1 se sim e 0 caso contrário.
*/
int itemInformadoAntes(char *item, char itensInformados[][100], int numItensInformados) {
	transformaMaiusculaEmMinuscula(item);
  int resultado = 0;
  for (int i = 0; i < numItensInformados; i++) {
    if (strcmp(item, itensInformados[i]) == 0) {
      resultado = 1;
      break;
    }
  }
  return resultado;
}

/*
Cadastra um novo ítem na matriz dos ítens informados na jogada.
*/
void cadastrarItemInformadosNaJogada(char *item, char itensInformados[][100], int numItensInformados) {
	transformaMaiusculaEmMinuscula(item);
  strcpy(itensInformados[numItensInformados], item);
}

/*
Remove um dado jogador de uma jogada.
*/
void removerJogador(char nomeJogadores[][20], char sobrenomeJogadores[][20], int numJogador, int numParticipantes) {
     for (int j = numJogador; j < numParticipantes - 1; j++) {
         strcpy(nomeJogadores[j], nomeJogadores[j + 1]);
         strcpy(sobrenomeJogadores[j], sobrenomeJogadores[j + 1]);
     }
}

#endif
