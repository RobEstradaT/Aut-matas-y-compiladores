%option noyywrap
%{
	#include<stdio.h>
%}

%%
[-+]?[0-9]*\.[0-9]+	{ printf("NUMERO DECIMAL reconocido :)");}
.	{ printf("Caracter NO RECONOCIDO :(");}

%%
int main()
{
	yylex();
	return 0;
}