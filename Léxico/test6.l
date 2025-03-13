%option noyywrap

%{
	#include<stdio.h>
%}

%%
[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.edu\.mx	  {printf("CORREO INSTITUCIONAL reconocido :)");}
.   { printf("Caracter(es) NO RECONOCIDO(S) :(");}

%%
int main()
{
	yylex();
	return 0;
}