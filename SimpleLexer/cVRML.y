%{
#include <stdio.h>
#include "ast.h"

Node* astRoot = NULL;
int yyerror(char * s);
extern int yylex(void);

%}
%union{	
	Node	*node;
	char* strings;
	int intVal;
	float floatVal;
	double dVal;
}
%token ANCHOR 
%token BILLBOARD
%token COLLISION
%token GROUP
%token INLINE
%token LOD
%token SWITCH
%token TRANSFORM
%token BACKGROUND
%token FOG
%token NAVIGATIONINFO
%token VIEWPOINT
%token DIRECTIONALLIGHT
%token POINTLIGHT
%token SPOTLIGHT
%token SCRIPT
%token SHAPE
%token SOUND
%token WORLDINFO
%token CYLINDERSENSOR
%token PLANESENSOR
%token PROXIMITYSENSOR
%token SPHERESENSOR
%token TIMESENSOR
%token TOUCHSENSOR
%token VISIBILITYSENSOR
%token COLORINTERPOLATOR
%token COORDINATEINTERPOLATOR
%token NORMALINTERPOLATOR
%token ORIENTATIONINTERPOLATOR
%token POSITIONINTERPOLATOR
%token SCALARINTERPOLATOR
%token APPEARANCE
%token AUDIOCLIP
%token FONTSTYLE
%token BOX
%token CONE
%token CYLINDER
%token ELEVATIONGRID
%token EXTRUSION
%token INDEXEDFACESET
%token INDEXEDLINESET
%token POINTSET
%token SPHERE
%token TEXT
%token COLOR
%token COORDINATE
%token NORMAL
%token TEXTURECOORDINATE
%token IMAGETEXTURE
%token MATERIAL
%token MOVIETEXTURE
%token PIXELTEXTURE
%token TEXTURETRANSFORM
%token END
%token IDENTIFIER


%type <node> vrmlScene
%type <node> statements
%type <node> statement
%type <node> nodeStatement
%type <node> protoStatement
%type <node> protoStatements
%type <node> proto
%type <node> protoBody
%type <node> interfaceDeclarations
%type <node> restrictedInterfaceDeclaration
%type <node> interfaceDeclaration
%type <node> externproto
%type <node> externInterfaceDeclarations
%type <node> externInterfaceDeclaration
%type <node> routeStatement
%type <node> fieldType
%type <node> fieldValue

%type <node> node
%type <node> nodeBody
%type <node> scriptBody
%type <node> scriptBodyElement
%type <node> nodeBodyElement
%type <node> nodeNameIDENTIFIER
%type <node> nodeTypeIDENTIFIER
%type <node> fieldIDENTIFIER
%type <node> eventInIDENTIFIER
%type <node> eventOutIDENTIFIER
%type <node> IDENTIFIER
%type <node> IDENTIFIERFirstChar
%type <node> IDENTIFIERRestChars


%start vrmlScene
%%
vrmlScene :
	statements ;
statements :
	statement |
	statement statements |
	empty ;
statement :
	nodeStatement |
	protoStatement |
	routeStatement ;
nodeStatement :
	node |
	DEF nodeNameIDENTIFIER node |
	USE nodeNameIDENTIFIER ;
protoStatement :
	proto |
	externproto ;
protoStatements :
	protoStatement |
	protoStatement protoStatements |
	empty ;
proto :
	PROTO nodeTypeIDENTIFIER [ interfaceDeclarations ] { protoBody } ;
protoBody :
	protoStatements node statements ;
interfaceDeclarations :
	interfaceDeclaration |
	interfaceDeclaration interfaceDeclarations |
	empty ;
restrictedInterfaceDeclaration :
	eventIn fieldType eventInIDENTIFIER |
	eventOut fieldType eventOutIDENTIFIER |
	field fieldType fieldIDENTIFIER fieldValue ;
interfaceDeclaration :
	restrictedInterfaceDeclaration |
	exposedField fieldType fieldIDENTIFIER fieldValue ;
externproto :
	EXTERNPROTO nodeTypeIDENTIFIER [ externInterfaceDeclarations ] URLList ;
externInterfaceDeclarations :
	externInterfaceDeclaration |
	externInterfaceDeclaration externInterfaceDeclarations |
	empty ;
externInterfaceDeclaration :
	eventIn fieldType eventInIDENTIFIER |
	eventOut fieldType eventOutIDENTIFIER |
	field fieldType fieldIDENTIFIER |
	exposedField fieldType fieldIDENTIFIER ;
routeStatement :
	ROUTE nodeNameIDENTIFIER . eventOutIDENTIFIER TO nodeNameIDENTIFIER . eventInIDENTIFIER ;
empty :
	;

	
node :
	nodeTypeIDENTIFIER { nodeBody } |
	Script { scriptBody } ;
nodeBody :
	nodeBodyElement |
	nodeBodyElement nodeBody |
	empty ;
scriptBody :
	scriptBodyElement |
	scriptBodyElement scriptBody |
	empty ;
scriptBodyElement :
	nodeBodyElement |
	restrictedInterfaceDeclaration |
	eventIn fieldType eventInIDENTIFIER IS eventInIDENTIFIER |
	eventOut fieldType eventOutIDENTIFIER IS eventOutIDENTIFIER |
	field fieldType fieldIDENTIFIER IS fieldIDENTIFIER ;
nodeBodyElement :
	fieldIDENTIFIER fieldValue |
	fieldIDENTIFIER IS fieldIDENTIFIER |
	eventInIDENTIFIER IS eventInIDENTIFIER |
	eventOutIDENTIFIER IS eventOutIDENTIFIER |
	routeStatement |
	protoStatement ;
nodeNameIDENTIFIER :
	IDENTIFIER ;
nodeTypeIDENTIFIER :
	IDENTIFIER ;
fieldIDENTIFIER :
	IDENTIFIER ;
eventInIDENTIFIER :
	IDENTIFIER ;
eventOutIDENTIFIER :
	IDENTIFIER ;
IDENTIFIER :
	IDENTIFIERFirstChar |
	IDENTIFIERFirstChar IDENTIFIERRestChars ;
IDENTIFIERFirstChar :
	Any ISO-10646 character encoded using UTF-8 except: 0x30-0x39, 0x0-0x20, 0x22, 0x23, 0x27, 0x2b, 0x2c, 0x2d, 0x2e, 0x5b, 0x5c, 0x5d, 0x7b, 0x7d, 0x7f ;
IDENTIFIERRestChars :
	Any number of ISO-10646 characters except: 0x0-0x20, 0x22, 0x23, 0x27, 0x2c, 0x2e, 0x5b, 0x5c, 0x5d, 0x7b, 0x7d, 0x7f ;




fieldType :
	ANCHOR						|
	BILLBOARD					|
	COLLISION					|
	GROUP						|
	INLINE						|
	LOD							|
	SWITCH						|
	TRANSFORM					|
	BACKGROUND					|
	FOG							|
	NAVIGATIONINFO				|
	VIEWPOINT					|
	DIRECTIONALLIGHT			|
	POINTLIGHT					|
	SPOTLIGHT					|
	SCRIPT						|
	SHAPE						|
	SOUND						|
	WORLDINFO					|
	CYLINDERSENSOR				|
	PLANESENSOR					|
	PROXIMITYSENSOR				|
	SPHERESENSOR				|
	TIMESENSOR					|
	TOUCHSENSOR					|
	VISIBILITYSENSOR			|
	COLORINTERPOLATOR			|
	COORDINATEINTERPOLATOR		|
	NORMALINTERPOLATOR			|
	ORIENTATIONINTERPOLATOR		|
	POSITIONINTERPOLATOR		|
	SCALARINTERPOLATOR			|
	APPEARANCE					|
	AUDIOCLIP					|
	FONTSTYLE					|
	BOX							|
	CONE						|
	CYLINDER					|
	ELEVATIONGRID				|
	EXTRUSION					|
	INDEXEDFACESET				|
	INDEXEDLINESET				|
	POINTSET					|
	SPHERE						|
	TEXT						|
	COLOR						|
	COORDINATE					|
	NORMAL						|
	TEXTURECOORDINATE			|
	IMAGETEXTURE				|
	MATERIAL					|
	MOVIETEXTURE				|
	PIXELTEXTURE				|
	TEXTURETRANSFORM			;

fieldValue :
	Anchor						|
	Billboard					|
	Collision					|
	Group						|
	Inline						|
	LOD							|
	Switch						|
	Transform					|
	Background					|
	Fog							|
	NavigationInfo				|
	Viewpoint					|
	DirectionalLight			|
	PointLight					|
	SpotLight					|
	Script						|
	Shape						|
	Sound						|
	WorldInfo					|
	CylinderSensor				|
	PlaneSensor					|
	ProximitySensor				|
	SphereSensor				|
	TimeSensor					|
	TouchSensor					|
	VisibilitySensor			|
	ColorInterpolator			|
	CoordinateInterpolator		|
	NormalInterpolator			|
	OrientationInterpolator		|
	PositionInterpolator		|
	ScalarInterpolator			|
	Appearance					|
	AudioClip					|
	FontStyle					|
	Box							|
	Cone						|
	Cylinder					|
	ElevationGrid				|
	Extrusion					|
	IndexedFaceSet				|
	IndexedLineSet				|
	PointSet					|
	Sphere						|
	Text						|
	Color						|
	Coordinate					|
	Normal						|
	TextureCoordinate			|
	ImageTexture				|
	Material					|
	MovieTexture				|
	PixelTexture				|
	TextureTransform			;

%% int yyeror(char * s)
/* yacc error handler */
{
printf ("%s\n", s);
}


