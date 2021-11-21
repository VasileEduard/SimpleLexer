D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*

%{
#include <stdio.h>
#include "c.tab.h"

void count();
%}

%%
"/*"			{ comment(); }

"Anchor"					{count(); return(ANCHOR); }
"Billboard"					{count(); return(BILLBOARD); }
"Collision"					{count(); return(COLLISION); }
"Group"						{count(); return(GROUP); }
"Inline"					{count(); return(INLINE); }
"LOD"						{count(); return(LOD); }
"Switch"					{count(); return(SWITCH); }
"Transform"					{count(); return(TRANSFORM); }
"Background"				{count(); return(BACKGROUND); }
"Fog"						{count(); return(FOG); }
"NavigationInfo"			{count(); return(NAVIGATIONINFO); }
"Viewpoint"					{count(); return(VIEWPOINT); }
"DirectionalLight"			{count(); return(DIRECTIONALLIGHT); }
"PointLight"				{count(); return(POINTLIGHT); }
"SpotLight"					{count(); return(SPOTLIGHT); }
"Script"					{count(); return(SCRIPT); }
"Shape"						{count(); return(SHAPE); }
"Sound"						{count(); return(SOUND); }
"WorldInfo"					{count(); return(WORLDINFO); }
"CylinderSensor"			{count(); return(CYLINDERSENSOR); }
"PlaneSensor"				{count(); return(PLANESENSOR); }
"ProximitySensor"			{count(); return(PROXIMITYSENSOR); }
"SphereSensor"				{count(); return(SPHERESENSOR); }
"TimeSensor"				{count(); return(TIMESENSOR); }
"TouchSensor"				{count(); return(TOUCHSENSOR); }
"VisibilitySensor"			{count(); return(VISIBILITYSENSOR); }
"ColorInterpolator"			{count(); return(COLORINTERPOLATOR); }
"CoordinateInterpolator"	{count(); return(COORDINATEINTERPOLATOR); }
"NormalInterpolator"		{count(); return(NORMALINTERPOLATOR); }
"OrientationInterpolator"	{count(); return(ORIENTATIONINTERPOLATOR); }
"PositionInterpolator"		{count(); return(POSITIONINTERPOLATOR); }
"ScalarInterpolator"		{count(); return(SCALARINTERPOLATOR); }
"Appearance"				{count(); return(APPEARANCE); }
"AudioClip"					{count(); return(AUDIOCLIP); }
"FontStyle"					{count(); return(FONTSTYLE); }
"Box"						{count(); return(BOX); }
"Cone"						{count(); return(CONE); }
"Cylinder"					{count(); return(CYLINDER); }
"ElevationGrid"				{count(); return(ELEVATIONGRID); }
"Extrusion"					{count(); return(EXTRUSION); }
"IndexedFaceSet"			{count(); return(INDEXEDFACESET); }
"IndexedLineSet"			{count(); return(INDEXEDLINESET); }
"PointSet"					{count(); return(POINTSET); }
"Sphere"					{count(); return(SPHERE); }
"Text"						{count(); return(TEXT); }
"Color"						{count(); return(COLOR); }
"Coordinate"				{count(); return(COORDINATE); }
"Normal"					{count(); return(NORMAL); }
"TextureCoordinate"			{count(); return(TEXTURECOORDINATE); }
"ImageTexture"				{count(); return(IMAGETEXTURE); }
"Material"					{count(); return(MATERIAL); }
"MovieTexture"				{count(); return(MOVIETEXTURE); }
"PixelTexture"				{count(); return(PIXELTEXTURE); }
"TextureTransform"			{count(); return(TEXTURETRANSFORM); }


{L}({L}|{D})*		{ count(); return(check_type()); }


[ \t\v\n\f]		{ count(); }
.			{ /* ignore bad characters */ }

%%

yywrap()
{
	return(1);
}


comment()
{
	char c, c1;

loop:
	while ((c = input()) != '*' && c != 0)
		putchar(c);

	if ((c1 = input()) != '/' && c != 0)
	{
		unput(c1);
		goto loop;
	}

	if (c != 0)
		putchar(c1);
}


int column = 0;

void count()
{
	int i;

	for (i = 0; yytext[i] != '\0'; i++)
		if (yytext[i] == '\n')
			column = 0;
		else if (yytext[i] == '\t')
			column += 8 - (column % 8);
		else
			column++;

	ECHO;
}


int check_type()
{

	return(IDENTIFIER);
}