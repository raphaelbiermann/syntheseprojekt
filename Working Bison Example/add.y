
%{

#include <stdio.h>

extern int yylex();
extern int yyparse();
int yyerror(char *s);


%}

//alle Tokens
%token ZAHL PLUS GLEICH SEMIKOLON OTHER MAL RETURN KLOFFEN KLZU

//ZAHL bekommt einen Wert vom Typ zahl
%type <zahl> ZAHL
%type <zahl> faktor
%type <zahl> term
%type <zahl> ausdruck


//Definition des Typs zahl
%union{
    int zahl;
}

%%

prog:
    ausdruck {
            printf("Ergebnis: %d", $1);
        }
;
ausdruck:
    ausdruck PLUS ausdruck{
        $$=$1+$3;
    }
    | term{
        $$=$1;
    }
;
term:
    term MAL term{
            $$=$1*$3;
    }
    | faktor{
            $$=$1;
    }
;
faktor:
    KLOFFEN ausdruck KLZU{
        $$=$2;
    }
    | ZAHL{
        $$=$1;
    }
;

%%

int yyerror(char *s)
{
	printf("Syntax Fehler in Zeile %s\n", s);
	return 0;
}

int main()
{
    yyparse();
    return 0;
}