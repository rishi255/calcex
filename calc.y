	/* BT18CSE091 Rishikesh Rachchh */

%code requires
	{
    	#define YYSTYPE double
	}

%token REAL EXIT
%left '+' '-'
%left '*' '/'
%expect 10

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <math.h>
	#define EXIT_WITH_MSG() { printf("\nGoodbye!\n"); exit(0); }

	int yylex(void);
	void yyerror(char *);
%}

%%

program: 
	program expr '\n' { printf("Answer = %f\n\n", $2); }
	|
	;
expr:

	REAL 			{ $$ = $1; 			}
	| '(' expr ')'	{ $$ = $2;			}
	| expr '/' expr { $$ = $1 / $3; 	}
	| expr '*' expr { $$ = $1 * $3; 	}
	| expr '+' expr { $$ = $1 + $3; 	}
	| expr '-' expr { $$ = $1 - $3; 	}
	| expr '^' expr { $$ = pow($1, $3); }
	| '-' expr		{ $$ = -$2; 		}
	| EXIT			{ EXIT_WITH_MSG() 	}
	;

%%

void yyerror(char *s) {
	fprintf(stderr, "ERROR: %s\n", s);
}

int main(void) {
	yyparse();
	EXIT_WITH_MSG()
	return 0;
}