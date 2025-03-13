%option noyywrap

%{
	#include<stdio.h>
%}

%%
[a-zA-Z][a-zA-Z0-9_]*	{ printf("VARIBLE O IDENTIFICADOR reconocido :)");}
.	{ printf("Caracter(es) NO RECONOCIDO(S) :(");}


%%
int main()
{
	yylex();
	return 0;
}