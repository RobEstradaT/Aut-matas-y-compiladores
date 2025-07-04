/* SECCION DE DECLARACIONES */
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "calculator.tab.h"
    extern YYSTYPE yylval;
%}

/* SECCION DE REGLAS */
%%
[0-9]+           { yylval.num = atoi(yytext); return NUMBER; }
"+"              { return PLUS; }
\n               { return EOL; }
[ \t\f\v]+       ; // Ignorar espacios y tabulaciones
.                { return *yytext; } 
%%

int yywrap(void)
{
    return 1;
}

/* MENSAJE DE ERROR */
int yyerror(const char *s) {
    fprintf(stderr, "Error de Sintaxis! - %s\n", s);
    return 0;
}
