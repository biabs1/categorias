#include "../manipulacoesArquivos.c"

/*
Retorna uma categoria sorteada entre as categorias cadastradas.
*/
char* sorteiaCategoria() {
  FILE *arquivo;
  /*O caminho do arquivo deve ser generalizado*/
  arquivo = fopen("/home//beatriz//Downloads//categorias-master//palavras//categorias.txt", "r");
  int numCategoriasCadastradas = numLinhasArquivo(arquivo);
  fclose(arquivo);

  // Gera um valor aleatório entre zero e o número de categorias cadastradas.
  int linhaCategoriaSorteada = rand() % numCategoriasCadastradas - 1;
  arquivo = fopen("/home//beatriz//Downloads//categorias-master//palavras//categorias.txt", "r");
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
  char caminhoCategoria[400] = "//home//beatriz//Downloads//categorias-master//palavras//";
  strcat(caminhoCategoria, categoria);
  strcat(caminhoCategoria, ".txt");

  arquivo = fopen(caminhoCategoria, "r");
  int numItens = numLinhasArquivo(arquivo);
  fclose(arquivo);
  printf("%d\n", numItens);
  return numItens;
}
