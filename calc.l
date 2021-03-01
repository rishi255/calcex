	/* BT18CSE091 Rishikesh Rachchh */

real_number		([0-9]+([.][0-9]+)?)|([.][0-9]+)
operators		[-+*/^()\n]
whitespace		[ \t]
exit_command	exit

%{
	#include <stdlib.h>
	void yyerror(char *);
	#include "calc.tab.h"
%}

%%

	/* real numbers */
{real_number}	{
					yylval = atof(yytext);
					return REAL;
				}

	/* operators */
{operators}		return *yytext;
	
	/* whitespace */
{whitespace} 	;

	/* exit command */
{exit_command}	return EXIT;

	/* everything else */
. 				;

%%

int yywrap(void) 
{
	return 1;
}