%option noyywrap

%{
	#include<stdio.h>
%}

%%
[A-Z]{4}[0-9]{6}[HM][A-Z]{6}[0-9A-Z]	{ printf("CURP reconocido :)");}
. { printf("Caracter(es) NO RECONOCIDOS :(");}


%%
int main()
{
	yylex();
	return 0;
}