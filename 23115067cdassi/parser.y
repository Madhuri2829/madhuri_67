%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }
int yylex(void); // forward declaration for lexer
%}

%union {
    char* str;
}

%token <str> IDENTIFIER NUMBER
%token ASSIGN MUL ADD SEMICOLON

%type <str> stmt program

%start program

%%

program:
      stmt SEMICOLON {
          printf("Custom instruction: %s\n", $1);
          free($1);
      }
    ;

stmt:
      IDENTIFIER ASSIGN IDENTIFIER MUL IDENTIFIER ADD IDENTIFIER {
          char *result = malloc(100);
          snprintf(result, 100, "muladd %s, %s, %s, %s", $1, $3, $5, $7);
          $$ = result;
      }
    ;

%%

int main() {
    return yyparse();
}
