%option noyywrap

%{
#include<stdio.h>
#include <ctype.h>
%}

%%
aplicar|calcular|delinear|ejemplificar|ilustrar|manejar|obtener|practicar|relacionar|trazar|seguir|usar    { printf("Verbo de la taxonom�a de Bloom (Aplicaci�n) encontrado: %s\n", yytext); }


[ \t\n]+    { /* no espacios*/ }

[a-zA-Z������������]+    { printf("Fuera de la taxonom�a de Bloom (Aplicaci�n): %s\n", yytext); }

.          { /* no caracteres */ }
%%

int main(int argc, char **argv){
	if(argc > 1){
		FILE *file = fopen(argv[1], "r");
		if(!file){
			perror("No se pudo abrir el archivo");
			return 1;
		}
		yyin = file;
	}
	yylex();
	return 0;
}