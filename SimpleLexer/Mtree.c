#include "Mtree.h"
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

BtreeNode* CreateTree(int nodeType, const char* data)
{
	BtreeNode* root = NULL;
	root = malloc(sizeof(BtreeNode));
	if (root != NULL)
	{
		root->children = NULL;
		root->childrenCount = 0;
		root->nodeType = nodeType;
		strcpy_s(root->nodeData, sizeof(root->nodeData), data);
	}
	return root;
}

BtreeNode* Add(BtreeNode* parent, int nodeType, const char* data)
{
	BtreeNode* newnode = NULL;
	newnode = malloc(sizeof(BtreeNode));
	if (newnode != NULL)
	{
		newnode->children = NULL;
		newnode->childrenCount = 0;
		newnode->nodeType = nodeType;
		strcpy_s(newnode->nodeData, sizeof(newnode->nodeData), data);
		parent->childrenCount = parent->childrenCount + 1;
		if (parent->children != NULL)
		{
			parent->children = realloc(parent->children, sizeof(BtreeNode*) * parent->childrenCount);
			(parent->children)[parent->childrenCount - 1] = newnode;
		}
		else
		{
			parent->children = malloc(sizeof(BtreeNode*));
			parent->children[0] = newnode;
		}
	}
	return newnode;
}

void DisplayTreeInfo(BtreeNode* root)
{
	int i;
	if (root) {
		printf("%s ", (root->nodeData));
		for (i = 0; i < root->childrenCount; i++)
		{
			DisplayTreeInfo(root->children[i]);
		}
	}
}