#pragma once

#define MAX_SYMBOL_NAME 255
#define MAX_DATATYPE_NAME 50

enum IdentifierScope { Local = 0, Global };
enum SymbolType { Function = 0, Variable = 1, DataType = 2 };

typedef struct symTableEntry {

	char symbolName[MAX_SYMBOL_NAME];
	char dataType[MAX_DATATYPE_NAME];
	enum SymbolType symbolType;
	enum IdentifierScope symbolScope;
	char contextName[MAX_SYMBOL_NAME];

}SymTableEntry;


typedef struct symbolsList {
	unsigned int size;
	unsigned int actualCount;
	SymTableEntry* elements;
}SymbolsList;

SymbolsList* createSymbolsList(int initialDimension);
int addToSymbolsList(SymbolsList* listHandle, SymTableEntry element);
void printSymbolsList(SymbolsList* listHandle);

//remove
//clearList
//destroyList