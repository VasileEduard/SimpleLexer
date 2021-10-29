D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?(D)+
FS			[f|F|l|L]
IS			[u|U|l|L]*

Shape
geometry
appearance
material
Group
children
position
orientation
description
Background
skyColor
PointLight
radius
height
Transform
translation
specularColor
Anchor
url
texture
Inline
cycleInterval
ColorInterpolator
key
keyValue
coord
point
coordIndex
Script
eventIn
eventOut


%{
#include <stdio.h>
#include "symbols.h"

void count();
%}

%%
vrmlScene ::=
statements ;
statements ::=
statement |
statement statements |
empty ;
statement ::=
nodeStatement ;
nodeStatement ::=
node |
DEF nodeNameId node |
USE nodeNameId ;
empty ::=
; 

node ::=
nodeTypeId { nodeBody } |
Script { scriptBody } ;
nodeBody ::=
nodeBodyElement |
nodeBodyElement nodeBody |
empty ;
scriptBody ::=
scriptBodyElement |
scriptBodyElement scriptBody |
empty ;
scriptBodyElement ::=
nodeBodyElement |
field fieldType fieldId fieldValue |
field fieldType fieldId IS fieldId ;
nodeBodyElement ::=
fieldId fieldValue |
fieldId IS fieldId ;
nodeNameId ::=
Id ;
nodeTypeId ::=
Id ;
fieldId ::=
Id ;
eventInId ::=
Id ;
eventOutId ::=
Id ;
Id ::=
IdFirstChar |
IdFirstChar IdRestChars ;
IdFirstChar ::=
Any ISO-10646 character encoded using UTF-8 except: 0x30-0x39, 0x0-0x20, 0x22, 0x23, 0x27,
0x2b, 0x2c, 0x2d, 0x2e, 0x5b, 0x5c, 0x5d, 0x7b, 0x7d, 0x7f ;
IdRestChars ::=
Any number of ISO-10646 characters except: 0x0-0x20, 0x22, 0x23, 0x27, 0x2c, 0x2e, 0x5b,
0x5c, 0x5d, 0x7b, 0x7d, 0x7f ; 

fieldType ::=
MFColor |
MFFloat |
MFInt32 |
MFNode |
MFRotation |
MFString |
MFTime |
MFVec2f |
MFVec3f |
SFBool |
SFColor |
SFFloat |
SFImage |
SFInt32 |
SFNode |
SFRotation |
SFString |
SFTime |
SFVec2f |
SFVec3f ;
fieldValue ::=
sfboolValue |
sfcolorValue |
sffloatValue |
sfimageValue |
sfint32Value |
sfnodeValue |
sfrotationValue |
sfstringValue |
sftimeValue |
sfvec2fValue |
sfvec3fValue |
mfcolorValue |
mffloatValue |
mfint32Value |
mfnodeValue |
mfrotationValue |
mfstringValue |
mftimeValue |
mfvec2fValue |
mfvec3fValue ;
sfboolValue ::=
TRUE |
FALSE ;
sfcolorValue ::=
float float float ;
sffloatValue ::=
float ;
float ::=
([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?)).
sfimageValue ::= 
int32 int32 int32 ...
sfint32Value ::=
int32 ;
int32 ::=
([+\-]?(([0-9]+)|(0[xX][0-9a-fA-F]+)))
sfnodeValue ::=
nodeStatement |
NULL ;
sfrotationValue ::=
float float float float ;
sfstringValue ::=
string ;
string ::=
".*" ... double-quotes must be \", backslashes must be \\...
sftimeValue ::=
double ;
double ::=
([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))
mftimeValue ::=
sftimeValue |
[ ] |
[ sftimeValues ] ;
sftimeValues ::=
sftimeValue |
sftimeValue sftimeValues ;
sfvec2fValue ::=
float float ;
sfvec3fValue ::=
float float float ;
mfcolorValue ::=
sfcolorValue |
[ ] |
[ sfcolorValues ] ;
sfcolorValues ::=
sfcolorValue |
sfcolorValue sfcolorValues ;
mffloatValue ::=
sffloatValue |
[ ] |
[ sffloatValues ] ;
sffloatValues ::=
sffloatValue |
sffloatValue sffloatValues ;
mfint32Value ::=
sfint32Value |
[ ] |
[ sfint32Values ] ;
sfint32Values ::=
sfint32Value |
sfint32Value sfint32Values ;
mfnodeValue ::=
nodeStatement |
[ ] |
[ nodeStatements ] ;
nodeStatements ::=
nodeStatement | 
nodeStatement nodeStatements ;
mfrotationValue ::=
sfrotationValue |
[ ] |
[ sfrotationValues ] ;
sfrotationValues ::=
sfrotationValue |
sfrotationValue sfrotationValues ;
mfstringValue ::=
sfstringValue |
[ ] |
[ sfstringValues ] ;
sfstringValues ::=
sfstringValue |
sfstringValue sfstringValues ;
mfvec2fValue ::=
sfvec2fValue |
[ ] |
[ sfvec2fValues] ;
sfvec2fValues ::=
sfvec2fValue |
sfvec2fValue sfvec2fValues ;
mfvec3fValue ::=
sfvec3fValue |
[ ] |
[ sfvec3fValues ] ;
sfvec3fValues ::=
sfvec3fValue |
sfvec3fValue sfvec3fValues ; 

[ \t\v\n\f] { count(); }
		{ /* ignore bad characters */ }
%%

yywrap()
{
	return(1);
}

comment()
{
	char c, c1;

loop:
	while((c = input()) != '*' && c != 0)
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

	for(i = 0; yytext[i] != '\0'; i++)
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