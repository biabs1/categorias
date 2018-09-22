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
