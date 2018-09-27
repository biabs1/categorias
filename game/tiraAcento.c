#include <string.h>


#define char comAcentos[50] = '����������������������������������������������';
#define char semAcentos[50] = 'AAAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUuuuuCc';


void tiraAcentoDoCaractere(char * c) {
	for (int i = 0; i < strlen(comAcentos); i++) {
		if ( c == comAcentos[i]) {
			c = semAcentos[i];
		}
	}
} 

void tiraAcentoDaString(char c[]) {
    for (int i = 0; i < strlen(c); i++) {
        tiraAcentoDoCaractere(c[i]);
    }
}
