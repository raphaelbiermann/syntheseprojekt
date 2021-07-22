
%{
#include <stdio.h>
#include <string.h>
#include "add.tab.h"



%}

%option noyywrap

%%

[-]*[0-9]+  { yylval.zahl = atoi(yytext); return(ZAHL);}
"+" {return(PLUS);}
"=" {return(GLEICH);}
";" {return(SEMIKOLON);}
"*" {return(MAL);}
"(" {return(KLOFFEN);}
")" {return(KLZU);}
"\n" {return(RETURN);}
.   {return(OTHER);}



%%