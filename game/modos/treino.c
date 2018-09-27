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
}
