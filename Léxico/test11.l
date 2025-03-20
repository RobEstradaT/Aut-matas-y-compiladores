%option noyywrap

%{
#include <stdio.h>
%}

%x COMENTARIO

%%

"//".*           { printf("Comentario de una sola linea: %s\n", yytext); }

"/*"                  { 
                           printf("Inicio comentario multilinea: /*");
                           BEGIN(COMENTARIO); 
                         }

<COMENTARIO> {
    "*/"               { printf("Fin comentario multilinea: */\n"); BEGIN(INITIAL); }
    (.|\n)             { printf("%s", yytext); }
}

\"([^\"\n\\]|\\.)*\"    { printf("Cadena de texto: %s\n", yytext); }

[ \t\n]+              { /* Ignorar espacios en blanco */ }

[a-zA-ZáéíóúÁÉÍÓÚñÑ]+  { printf("Palabra: %s\n", yytext); }

.                      { /* Ignorar caracteres no relevantes */ }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *archivo = fopen(argv[1], "r");
        if (!archivo) {
            perror("Error al abrir el archivo");
            return 1;
        }
        yyin = archivo;
    }
    yylex();
    return 0;
}
