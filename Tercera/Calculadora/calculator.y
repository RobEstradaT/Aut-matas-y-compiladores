/* SECCION DE DECLARACIONES C */
%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex(void);
    int yywrap(void);
    int yyerror(const char *s);
%}

/* SECCION DE DECLARACIONES YACC */
%union {
    int num;
}

%start statement
%token <num> NUMBER
%token PLUS EOL
%type <num> expression

%%

statement: 
    expression EOL { printf("= %d\n", $1); }
    ;

expression:
    NUMBER               { $$ = $1; printf("número: %d\n", $$); }
    | expression PLUS NUMBER { $$ = $1 + $3; printf("suma: %d\n", $$); }
    ;

%%

/* CODIGO C */
int main()
{
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    fprintf(stderr, "Error de Sintaxis! - %s\n", s);
    return 0;
}
