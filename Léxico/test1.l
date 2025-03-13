%option noyywrap
%{
	#include<stdio.h>
%}

%%
[-+]?[0-9]+    { printf("NUMERO ENTERO reconocido :)");}
. {printf("Caracter NO RECONOCIDO");}
%%
int main()
{
	yylex();
	return 0;
}