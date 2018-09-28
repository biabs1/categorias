# Jogo Categorias

## Descrição:

O jogo “Categorias” é jogado de 2 a 8 jogadores localmente através de uma interface de texto (terminal), e funciona da seguinte forma: existem categorias cadastradas no sistema, e para cada categoria existem palavras relacionadas (Ex.: categoria “Cor” possui as cores cadastradas como palavras relacionadas). Inicialmente é sorteada uma categoria, feito isso cada jogador (de forma sequencial) tem a sua vez, onde ele tem que informar uma palavra que exista nessa categoria e que ainda não tenha sido informada por nenhum outro jogador. Caso o jogador informe uma palavra repetida, uma que não conste na categoria ou não informe a palavra a tempo, o jogador é eliminado. Ganha quem permanecer no jogo por último após todos os outros serem eliminados.

## Especificações:

Interface com usuário - Qualquer usuário humano irá interagir com o jogo via terminal, digitando opções informadas ou digitando as palavras durante o jogo.

Fluxo de jogo - Ao selecionar um novo jogo, o usuário precisa escolher o modo de jogo, que pode ser Treino, Modo Alternado ou Modo Clássico. Após selecionar o modo de jogo informar o número de jogadores, digitar o nome dos jogadores, e em sequência, o usuário informa o tempo a ser usado no timer para resposta dos jogadores, o jogo se inicia. O jogo sorteia uma categoria e informa aos jogadores, a ordem de jogadores é a mesma ordem de informação dos nomes. Na vez de cada jogador o timer é acionado em contagem regressiva e ele precisa informar uma palavra relacionada a categoria. Caso ele informe uma palavra válida, ele continua no jogo e começa a vez do próximo jogador. Caso ele informe uma palavra inválida ou não informe uma palavra a tempo, ele é eliminado do jogo, e o jogo segue com o próximo jogador. Quando os jogadores forem sendo eliminados e restar apenas um, esse jogador é o vencedor.

Modos de jogo - Em todos os modos de jogo, quando for na vez de cada jogador, será informado “Vez do jogador X” e existirá um timer em contagem regressiva indicando quanto tempo o jogador tem para responder.
Treino: O jogador joga contra bots com as mesmas regras do Modo Clássico. Os bots terão uma “IA” simplificada, que sorteará randomicamente se ele saberá informar uma palavra e qual palavra ele irá informar.
Modo Clássico: Uma categoria é sorteada inicialmente, uma nova categoria só é sorteado caso as palavras dessa categoria tenham acabado e ainda restem jogadores no jogo.
Modo Alternado: Uma categoria é sorteada inicialmente, uma nova categoria é sorteada toda vez que um jogador for eliminado.

## Simplificações:

Acentuação - A acentuação será desconsiderada na validação de palavras. Exemplo: para a palavra cadastrada “México”, a entrada “Mexico” será considerada válida.

Maiúsculas/minúsculas - A validação não será case sensitive. Exemplo: para a palavra cadastrada “Azul”, as entradas “azul”, “AZUL” ou “AzUl” serão consideradas válidas.

Categorias - A priori as categorias serão cadastradas hard coded. As categorias existentes serão:
Países,
Cores,
Animais,
Esportes,
Frutas,
Verduras e Legumes,
Linguagens de Programação.

## Extras:
- Permitir o cadastro de novas categorias e palavras.
- Utilizar arquivos ou DB para armazenar as categorias e suas palavras.
