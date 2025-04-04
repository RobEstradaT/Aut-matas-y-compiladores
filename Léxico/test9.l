%option noyywrap

%{
#include<stdio.h>
#include <ctype.h>
%}

%%
comparar|distinguir|organizar|atribuir|descomponer|estructurar|relacionar {
    printf("Verbo de la taxonomia de Bloom (Analisis): %s\n", yytext);
}

brillante|duradero|eficiente|elegante|encantador|fiable|hermoso|impresionante|innovador|llamativo|vers�til {
    printf("Adjetivo positivo: %s\n", yytext);
}

y|e|ni|tambi�n|o|u|pero|sino|excepto|salvo|menos|pues|as�|adem�s|como|aunque|porque {
    printf("Conjuncion: %s\n", yytext);
}

a|ante|bajo|cabe|con|contra|de|desde|durante|en|entre|hacia|hasta|mediante|para|por|seg�n|sin|sobre|tras|v�a {
    printf("Preposicion: %s\n", yytext);
}
	
yo|t�|usted|�l|ella|nosotros|ustedes|ellos|ellas|me|te|lo|la|nos|los|las|le||se|les {
    printf("Pronombre: %s\n", yytext);
}

[a-zA-Z������������]+    { printf("Otra palabra: %s\n", yytext); }

[ \t\n]+    { /* no espacios*/ }

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