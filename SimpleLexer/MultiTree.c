#include <stdio.h>
#include <stdlib.h>
#include "Mtree.h"

int main()
{
	BtreeNode* tree = CreateTree(1, "root");
	BtreeNode* firstchild = Add(tree, 1, "child 1");
	Add(tree, 2, "child 2");
	Add(tree, 3, "child 3");
	Add(firstchild, 1, "first child of child 1");
	Add(firstchild, 2, "second child of child 1");
	Add(firstchild, 3, "third child of child 1");
	DisplayTreeInfo(tree);
}