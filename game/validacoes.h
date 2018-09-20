/*
** As funções implementadas neste módulo servem para validar os dados
** informados pelo usuário.

Autora: Beatriz Souza
*/

/*
** Verifica se um valor referente ao controle de execucao do jogo é válido.
** Retorna 1 caso seja e 0 caso contrário.
*/
int novoJogoValido(int novoJogo) {
  int resultado = 0;
  if (novoJogo == 0 || novoJogo == 1) {
    resultado = 1;
  }
  return resultado;
}

/*
** Verifica se um modo de jogo informado é valido.
** Retorna 1 caso seja e 0 caso contrário.
*/
int modoDeJogoValido(int modoDeJogo) {
  int resultado = 0;
  if (modoDeJogo == 1 || modoDeJogo == 2 || modoDeJogo == 3) {
    resultado = 1;
  }
  return resultado;
}

/*
** Verifica se o número de participantes informado é válido.
** Retorna 1 caso seja e 0 caso contrário.
*/
int numParticipantesValido(int numParticipantes) {
  int resultado = 0;
  if (numParticipantes >= 2 && numParticipantes <= 8) {
    resultado = 1;
  }
  return resultado;
}
