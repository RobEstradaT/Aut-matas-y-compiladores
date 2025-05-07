%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "calculator.tab.h"
    extern YYSTYPE yylval;
%}

%%
[0-9]+           { yylval.num = atoi(yytext); return NUM; }
"*"              { return MULT; }
\n               { return EOL; }
[ \t\f\v]+       ;
.                { return *yytext; } 
%%

int yywrap(void)
{
    return 1;
}

int yyerror(const char *s) {
    fprintf(stderr, "Error de Sintaxis! - %s\n", s);
    return 0;
}
