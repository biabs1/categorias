#include <string.h>

void tiraAcentoDoCaractere(char * c) {
    if (c == 'á' || c == 'ã' || c == 'â') 
        c = 'a';
    else if (c == 'é' || c == 'ẽ' || c == 'ê')
        c = 'e';
    else if (c == 'í' || c == 'ĩ' || c == 'î')
        c = 'i';
    else if (c == 'ó' || c == 'õ' || c == 'ô')
        c = 'o';
    else if (c == 'ú' || c == 'ũ' || c == 'û' || c == 'ü')
        c = 'u';
    else if (c == 'ç')
        c = 'c';
}

void tiraAcentoDaString(char c[]) {
    for (int i = 0; i < strlen(c); i++) {
        tiraAcentoDoCaractere(c[i]);
    }
}
