%option noyywrap

%{
#include<stdio.h>
#include <ctype.h>
%}

%%
"auto"              { printf("Palabra reservada en lenguaje C: auto\n"); }
"break"             { printf("Palabra reservada en lenguaje C: break\n"); }
"case"              { printf("Palabra reservada en lenguaje C: case\n"); }
"const"             { printf("Palabra reservada en lenguaje C: const\n"); }
"continue"          { printf("Palabra reservada en lenguaje C: continue\n"); }
"default"           { printf("Palabra reservada en lenguaje C: default\n"); }
"do"                { printf("Palabra reservada en lenguaje C: do\n"); }
"else"              { printf("Palabra reservada en lenguaje C: else\n"); }
"enum"              { printf("Palabra reservada en lenguaje C: enum\n"); }
"extern"            { printf("Palabra reservada en lenguaje C: extern\n"); }
"for"               { printf("Palabra reservada en lenguaje C: for\n"); }
"goto"              { printf("Palabra reservada en lenguaje C: goto\n"); }
"if"                { printf("Palabra reservada en lenguaje C: if\n"); }
"register"          { printf("Palabra reservada en lenguaje C: register\n"); }
"return"            { printf("Palabra reservada en lenguaje C: return\n"); }
"signed"            { printf("Palabra reservada en lenguaje C: signed\n"); }
"sizeof"            { printf("Palabra reservada en lenguaje C: sizeof\n"); }
"static"            { printf("Palabra reservada en lenguaje C: static\n"); }
"struct"            { printf("Palabra reservada en lenguaje C: struct\n"); }
"switch"            { printf("Palabra reservada en lenguaje C: switch\n"); }
"typedef"           { printf("Palabra reservada en lenguaje C: typedef\n"); }
"union"             { printf("Palabra reservada en lenguaje C: union\n"); }
"unsigned"          { printf("Palabra reservada en lenguaje C: unsigned\n"); }
"volatile"          { printf("Palabra reservada en lenguaje C: volatile\n"); }
"while"             { printf("Palabra reservada en lenguaje C: while\n"); }

"char"              { printf("Tipo de dato en lenguaje C: char\n"); }
"double"            { printf("Tipo de dato en lenguaje C: double\n"); }
"float"             { printf("Tipo de dato en lenguaje C: float\n"); }
"int"               { printf("Tipo de dato en lenguaje C: int\n"); }
"long"              { printf("Tipo de dato en lenguaje C: long\n"); }
"short"             { printf("Tipo de dato en lenguaje C: short\n"); }
"void"              { printf("Tipo de dato en lenguaje C: void\n"); }

"main"              { printf("Funcion principal: main\n"); }
"printf"            { printf("Funcion: printf\n"); }
"scanf"             { printf("Funcion: scanf\n"); }


[a-zA-Z_][a-zA-Z0-9_]*   { printf("Variable: %s\n", yytext); }

[ \t\n]+    { /* no espacios*/ }

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


