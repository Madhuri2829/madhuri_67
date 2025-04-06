%{
#include "parser.tab.h"
#include <string.h>
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*     { yylval.str = strdup(yytext); return IDENTIFIER; }
[0-9]+                     { yylval.str = strdup(yytext); return NUMBER; }
"="                        { return ASSIGN; }
"*"                        { return MUL; }
"+"                        { return ADD; }
";"                        { return SEMICOLON; }
[ \t\n\r]+                 { /* skip whitespace */ }
.                          { return yytext[0]; }

%%

int yywrap(void) {
    return 1;
}
