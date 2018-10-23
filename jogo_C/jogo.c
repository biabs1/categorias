/* PLP - 2018.2

Jogo Categorias.

Desenvolvedores: Alessandra Barros, Beatriz Souza, Luana Melo,
Matheus Medeiros e Wener Wagner.
*/

#include "util/execucao.c"

int main() {

    mensagem_apresentacao();

    bool jogoRodando = true;
    while (jogoRodando) {
		
        mensagem_menuPrincipal();
		
        int opcao = entrada_pegarOpcaoMenu();
		
        switch (opcao) {
            case NOVO_JOGO:
				loopEscolhaModoJogo();
			break;
            case SAIDA:
                jogoRodando = false;
            break;
            case OPCAO_INVALIDA:
                mensagem_opcaoInvalida();
            break;
        }
    }

    return 0;
}
