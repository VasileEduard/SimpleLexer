// SimpleLexer.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
#include "symbols.h"
extern int yylex(void);
extern FILE* yyin;
int main()
{
	yyin = fopen("input.csrc", "rt");
	if (yyin == NULL)
	{
		printf("Fisierul sursa nu poate fi deschis");
		return;
	}
	int token = 0;
	while ((token = yylex()) != END)
	{
		printf("\t Token: %d \n", token);
	}

	fclose(yyin);

}

