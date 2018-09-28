/*
Definir o nome e o sobrenome dos bots.
*/
void definirNomeSobrenomeBots(int numParticipantes,
  char nomeJogadores[][20], char sobrenomeJogadores[][20]) {

  for (int i = 1; i < numParticipantes; i++) {
      char nomeBot[5];
      char idBot[2];
      strcpy(nomeBot, "Bot");
      sprintf(idBot, "%i", i);
      strcat(nomeBot, idBot);
      strcpy(nomeJogadores[i], nomeBot);
      strcpy(sobrenomeJogadores[i], "Smith");
  }

  printf("\n\nBot(s) cadastrado(s):\n");
  for (int i = 1; i < numParticipantes; i++) {
      printf("Bot %d: %s %s\n", i + 1, nomeJogadores[i], sobrenomeJogadores[i]);
  }
  sleep(2);
}

/*
Verifica se um dado jogador é bot.
*/
int jogadorEBot(char *nomeJogador, char *sobrenomeJogador) {
  int resultado = 0;
  if (strstr(nomeJogador, "Bot") != NULL && strcmp(sobrenomeJogador, "Smith") == 0) {
    resultado = 1;
  }
  return resultado;
}

/*
Verifica se um bot sabe de ítem para a categoria.
*/
int botSabeResposta() {
  int result = 0;
  if (rand() > 0.5) {
    result = 1;
  }
  return result;
}

/*
Sorteia um ítem de uma dada categoria.
*/
char* sorteiaItemCategoria(char *categoria) {
  FILE *arquivo;
  char caminhoCategoria[400] = "../palavras/";
  strcat(caminhoCategoria, categoria);
  strcat(caminhoCategoria, ".txt");

  arquivo = fopen(caminhoCategoria, "r");
  int numItens = numLinhasArquivo(arquivo);
  fclose(arquivo);

  // Gera um valor aleatório entre zero e o número de itens cadastrados -1.
  int linhaItemSorteado = rand() % numItens - 1;

  arquivo = fopen(caminhoCategoria, "r");
  char *item;
  item = (char*)malloc(50 *sizeof(char));
  item = palavraLinha(linhaItemSorteado, arquivo);
  fclose(arquivo);

  return item;
}

