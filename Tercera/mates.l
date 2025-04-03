%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>

/* Variables contadoras */
int lineCount = 0, wordCount = 0, charCount = 0;
int countNI = 0, countNUM = 0, countBto = 0, countJO = 0, countDigits = 0;

/* Macro para acumular el número de caracteres en cada token */
#define YY_USER_ACTION  charCount += yyleng;
%}

/* Deshabilitar yywrap para evitar problemas de macro */
%option noyywrap

%

\n          { cont_lineas++; }
[0-9]+      { cont_digit += yyleng; total_num++;cont_caract+= yyleng; }
ni[a-zA-Z\xE1\xE9\xED\xF3\xFA\xC1\xC9\xCD\xD3\xDA\xF1\xD1]* { empi_ni++;cont_caract+= yyleng; }
b[a-zA-Z\xE1\xE9\xED\xF3\xFA\xC1\xC9\xCD\xD3\xDA\xF1\xD1]*to { b_to++; cont_caract+= yyleng;}
n[\xFA]m[a-zA-Z]* { empi_num++; cont_caract += yyleng;} // Contamos palabras que empiezan con "Núm"
[a-zA-Z\xE1\xE9\xED\xF3\xFA\xC1\xC9\xCD\xD3\xDA\xF1\xD1]+jo { termi_jo++;cont_caract+= yyleng; }
[a-zA-Z\xE1\xE9\xED\xF3\xFA\xC1\xC9\xCD\xD3\xDA\xF1\xD1]+   { cont_palabras++; cont_caract+= yyleng;}
.          { cont_caract++;  }  // Contamos todos los caracteres (incluyendo letras y símbolos)
[ ][ \t\r]    { cont_caract += yyleng; }  // Contamos espacios, tabuladores y retornos de carro


%%


/* Función principal */
int main(int argc, char **argv) {
    if(argc < 2) {
        fprintf(stderr, "Uso: %s archivo\n", argv[0]);
        return 1;
    }
    FILE *file = fopen(argv[1], "r");
    if(!file) {
        perror(argv[1]);
        return 1;
    }
    yyin = file;
    yylex();
    fclose(file);

    printf("Total de lineas: %d\n", cont_lineas );
    printf("Total de palabras: %d\n", (cont_palabras+total_num+empi_ni+ b_to+termi_jo));
    printf("Total de caracteres: %d\n", cont_caract);
    printf("Total de numeros: %d\n", total_num);
    printf("Palabras que empiezan con 'ni': %d\n", empi_ni);
    printf("Palabras que empiezan con 'b' y terminan con 'to': %d\n", b_to);
    printf("Palabras que terminan con 'jo': %d\n", termi_jo);
    printf("Total de digitos: %d\n", cont_digit);
    printf("Palabras que empiezan con 'N\xFAm': %d\n", empi_num);
    
    return 0;
}
