#include "SemanticAnalyzer.h"
#include <stdio.h>
#include <string.h>
#include <memory.h>

int extractSymbolsFromNode(Node* root, SymbolsList* destList, const char* context, enum IdentifierScope scope)
{
	int idx = 0;
	char currentContext[MAX_SYMBOL_NAME] = { 0 };
	strcpy(currentContext, context);
	int unableToAddElement = 0;
	enum IdentifierScope currentScope = scope;
	int retValue = 1;

	if (root)
	{
		
		if (stricmp(root->type,"VariableDeclaration") == 0)
		{
			SymTableEntry newEntry = {0};
			strcpy(newEntry.contextName, currentContext);
			strcpy(newEntry.symbolName, root->extraData);
			if (root->links[0])
			{
				strcpy(newEntry.dataType, root->links[0]->extraData);
			}
			newEntry.symbolScope = scope;
			newEntry.symbolType = Variable;	
			if (!addToSymbolsList(destList, newEntry))
				unableToAddElement = 1;
		}

		if (stricmp(root->type, "FunctionDefinition") == 0)
		{
			SymTableEntry newEntry = { 0 };
			strcpy(newEntry.contextName, currentContext);
			currentScope = Local;

			strcpy(newEntry.symbolName, root->extraData);
			if (root->links[0])
			{
				strcpy(newEntry.dataType, root->links[0]->extraData);
			}
			newEntry.symbolScope = scope;
			newEntry.symbolType = Function;
			strcpy(currentContext, newEntry.symbolName);
			if (!addToSymbolsList(destList, newEntry))
			{
				unableToAddElement = 1;
			}	

		}
		if (unableToAddElement == 0)
		{
			for (idx = 0; idx < root->numLinks; idx++)
			{
				retValue = extractSymbolsFromNode(root->links[idx], destList, currentContext, currentScope);
				if (retValue == 0)
					break;
			}
		}
		else
		{
			retValue = 0;
		}
	}
	return retValue;
}

SymbolsList* generateSymbolsTable(Node* root)
{
	SymbolsList* retList = createSymbolsList(100);
	if (!extractSymbolsFromNode(root, retList, "Global", Global))	
	{
		//destroyList should be called here before set to NULL
		//right now we have a memory leak
		retList = NULL;
	}

	return retList;
}
