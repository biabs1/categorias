#ifndef REFATORASTRING
#define REFATORASTRING
#include <string.h>
#include <stdio.h>

void transformaMaiusculaEmMinuscula(char c[]) {
	for (int i = 0; i < strlen(c); i++) {
		c[i] = tolower(c[i]);
	}
}

void retiraQuebraDeLinha(char c[]) {
	size_t len = strlen(c);
	if (c[len - 1] == '\n') c[--len] = 0;
}

#endif
