%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "multiplicacion.tab.h"
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


