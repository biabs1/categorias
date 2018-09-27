#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

void caractereMinusculo(char * c) {
	if (isupper(c)) {
		c = tolower(c);
	}
}

void trasnformaMaiusculaEmMinuscula(char c[]) {
	for (int i = 0; i < strlen(c); i++) {
		caractereMinusculo(c[i]);
	}
}
