%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex(void);
    int yywrap(void);
    int yyerror(const char *s);
%}

%union {
    int num;
}

%start statement
%token <num> NUM
%token MULT EOL
%type <num> expression

%%

statement: 
    expression EOL { printf("= %d\n", $1); }
    ;

expression:
    NUMBER               { $$ = $1; printf("número: %d\n", $$); }
    | expression MULT NUM { $$ = $1 * $3; printf("multiplicacion: %d\n", $$); }
    ;

%%

int main()
{
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    fprintf(stderr, "Error de Sintaxis! - %s\n", s);
    return 0;
}
