typedef struct btreeNode
{
	int childrenCount;
	char nodeData[255];
	int nodeType;
	struct btreeNode** children;
}BtreeNode;

BtreeNode* CreateTree(int nodeType, const char* data);
BtreeNode* Add(BtreeNode* parent, int nodeType, const char* data);
void DisplayTreeInfo(BtreeNode* root);