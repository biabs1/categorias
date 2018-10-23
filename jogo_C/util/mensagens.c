#ifdef _WIN32
#include <stdlib.h>
#define limpaTela() system("cls")
#else
#include <stdio.h>
#define limpaTela() printf("\e[1;1H\e[2J")
#endif 

void cabecalho() {
    printf("========== JOGO CATEGORIAS ==========\n\n");
}

void mensagem_apresentacao() {
    limpaTela();
    cabecalho();
    printf("Bem vind@ ao jogo Categorias!\n");
    sleep(2);
    printf("Você testará o quanto de palavras você sabe ou consegue se lembrar de algumas categorias.\n");
    sleep(3);
}

void mensagem_menuPrincipal() {
    limpaTela();
    cabecalho();
    printf("Você deseja começar um novo jogo?\n");
    printf("1 - Novo Jogo\n");
    printf("2 - Sair\n");
}

void mensagem_opcaoInvalida() {
    printf("** Opção inválida! **\n** Reveja as opções possíveis. **\n");
    sleep(3);
}

void mensagem_modosJogo() {
	limpaTela();
	cabecalho();
	printf("Digite o número correspondente ao modo que você quer\n");
	printf("1 - Modo Treino\n"); 
	printf("2 - Modo Alternado\n");
	printf("3 - Modo Clássico\n");
	printf("4 - Voltar\n");
}

void mensagem_modoClassicoSelecionado() {
	limpaTela();
	cabecalho();
	printf("Modo Clássico selecionado!\n");
	sleep(2);
}

void mensagem_modoAlternadoSelecionado() {
	limpaTela();
	cabecalho();
	printf("Modo Alternado selecionado!\n");
	sleep(2);
}

void mensagem_modoTreinoSelecionado() {
	limpaTela();
	cabecalho();
	printf("Modo Treino selecionado!\n");
	sleep(2);
	printf("Cuidado para não ser derrotado(a) pelo(s) bot(s)!\n");
	sleep(3);
}

void mensagem_numJogadores() {
	limpaTela();
	cabecalho();
	printf("Digite a quantidade de jogadores\n");
	printf("Este valor deve estar entre 2 e 8 inclusive:\n");
}

void mensagem_nomeJogadores() {
	limpaTela();
	cabecalho();
	printf("Digite o nome e sobrenome do(s) jogador(es) humano(s)\n");
	printf("Um jogador por linha:\n");
}

void mensagem_jogadoresCadastrados(int numParticipantes, char nomeJogadores[][20], char sobrenomeJogadores[][20]) {
	printf("\nJogador(es) cadastrado(s):\n");
	for (int i = 0; i < numParticipantes; i++) {
		printf("Jogador %d: %s %s\n", i + 1, nomeJogadores[i], sobrenomeJogadores[i]);
	}
	sleep(2);
}

void mensagem_categoriaSorteada(char categoriaSorteada[]) {
	limpaTela();
	cabecalho();
	printf("Categoria sorteada: %s\n\n", categoriaSorteada);
	printf("Cada jogador deverá informar um ítem pertencente à categoria sorteada.\n");
	printf("Caso não se recorde de algum item, digite #\n");
	sleep(5);
}

void mensagem_informarPalavraCategoria(char categoriaSorteada[], char nomeJogador[], char sobrenomeJogador[]) {
	limpaTela();
	cabecalho();
	printf("Categoria: %s\n", categoriaSorteada);
	printf("Vez do jogador(a): %s %s\n\n", nomeJogador, sobrenomeJogador);
	printf("Informe um ítem desta categoria (sem acentos): \n");
}

void mensagem_itemAceito() {
	printf("\nItem aceito!\n");
	sleep(1);
}

void mensagem_palavraNaoCadastrada() {
	printf("\nATENÇÃO! Esta palavra não está cadastrada!\n");
	printf("\nEste ítem pertence mesmo a esta categoria? s/n\n");
}

void mensagem_vencedor(char nomeJogador[], char sobrenomeJogador[]) {
	limpaTela();
	cabecalho();
	printf("O vencedor da vez é: %s %s. Parabéns!\n\n", nomeJogador, sobrenomeJogador);
	sleep(4);
}

void mensagem_perdedor(char nomeJogador[], char sobrenomeJogador[]) {
    limpaTela();
	cabecalho();
	printf("Que pena, %s %s está fora do jogo!\n", nomeJogador, sobrenomeJogador);
	sleep(4);
}

void mensagem_modoAlternadoSorteio(char categoriaSorteada[]) {
	limpaTela();
	cabecalho();
	printf("Modo Alternado\nUma nova categoria foi sorteada: %s\n", categoriaSorteada);
	sleep(3);
}
