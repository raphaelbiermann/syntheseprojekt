
%{

#include <stdio.h>

extern int yylex();
extern int yyparse();
int yyerror(char *s);


%}

//alle Tokens
%token ZAHL PLUS GLEICH SEMIKOLON OTHER MAL

//ZAHL bekommt einen Wert vom Typ zahl
%type <zahl> ZAHL

//Definition des Typs zahl
%union{
    int zahl;
}

%%

prog:
    stmts
;

stmts: 
        | stmt stmts
;

stmt:
    ZAHL PLUS ZAHL {
            printf("Ergebnis: %d", ($1+$3));
    }
    | ZAHL MAL ZAHL {
            printf("Ergebnis: %d", ($1*$3));
    }
;

%%

int yyerror(char *s)
{
	printf("Syntax Error on line %s\n", s);
	return 0;
}

int main()
{
    yyparse();
    return 0;
}