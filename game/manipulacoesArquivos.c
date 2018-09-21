/*
** As funções implementadas neste módulo servem para manipulacoesArquivar
** os arquivos do diretório palavras.
*/

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
    fclose(arquivo);
  }
  return numLinhas + 1;
}
