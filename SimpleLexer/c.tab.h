/* A Bison parser, made by GNU Bison 3.7.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_C_TAB_H_INCLUDED
# define YY_YY_C_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ANCHOR = 258,                  /* ANCHOR  */
    BILLBOARD = 259,               /* BILLBOARD  */
    COLLISION = 260,               /* COLLISION  */
    GROUP = 261,                   /* GROUP  */
    INLINE = 262,                  /* INLINE  */
    LOD = 263,                     /* LOD  */
    SWITCH = 264,                  /* SWITCH  */
    TRANSFORM = 265,               /* TRANSFORM  */
    BACKGROUND = 266,              /* BACKGROUND  */
    FOG = 267,                     /* FOG  */
    NAVIGATIONINFO = 268,          /* NAVIGATIONINFO  */
    VIEWPOINT = 269,               /* VIEWPOINT  */
    DIRECTIONALLIGHT = 270,        /* DIRECTIONALLIGHT  */
    POINTLIGHT = 271,              /* POINTLIGHT  */
    SPOTLIGHT = 272,               /* SPOTLIGHT  */
    SCRIPT = 273,                  /* SCRIPT  */
    SHAPE = 274,                   /* SHAPE  */
    SOUND = 275,                   /* SOUND  */
    WORLDINFO = 276,               /* WORLDINFO  */
    CYLINDERSENSOR = 277,          /* CYLINDERSENSOR  */
    PLANESENSOR = 278,             /* PLANESENSOR  */
    PROXIMITYSENSOR = 279,         /* PROXIMITYSENSOR  */
    SPHERESENSOR = 280,            /* SPHERESENSOR  */
    TIMESENSOR = 281,              /* TIMESENSOR  */
    TOUCHSENSOR = 282,             /* TOUCHSENSOR  */
    VISIBILITYSENSOR = 283,        /* VISIBILITYSENSOR  */
    COLORINTERPOLATOR = 284,       /* COLORINTERPOLATOR  */
    COORDINATEINTERPOLATOR = 285,  /* COORDINATEINTERPOLATOR  */
    NORMALINTERPOLATOR = 286,      /* NORMALINTERPOLATOR  */
    ORIENTATIONINTERPOLATOR = 287, /* ORIENTATIONINTERPOLATOR  */
    POSITIONINTERPOLATOR = 288,    /* POSITIONINTERPOLATOR  */
    SCALARINTERPOLATOR = 289,      /* SCALARINTERPOLATOR  */
    APPEARANCE = 290,              /* APPEARANCE  */
    AUDIOCLIP = 291,               /* AUDIOCLIP  */
    FONTSTYLE = 292,               /* FONTSTYLE  */
    BOX = 293,                     /* BOX  */
    CONE = 294,                    /* CONE  */
    CYLINDER = 295,                /* CYLINDER  */
    ELEVATIONGRID = 296,           /* ELEVATIONGRID  */
    EXTRUSION = 297,               /* EXTRUSION  */
    INDEXEDFACESET = 298,          /* INDEXEDFACESET  */
    INDEXEDLINESET = 299,          /* INDEXEDLINESET  */
    POINTSET = 300,                /* POINTSET  */
    SPHERE = 301,                  /* SPHERE  */
    TEXT = 302,                    /* TEXT  */
    COLOR = 303,                   /* COLOR  */
    COORDINATE = 304,              /* COORDINATE  */
    NORMAL = 305,                  /* NORMAL  */
    TEXTURECOORDINATE = 306,       /* TEXTURECOORDINATE  */
    IMAGETEXTURE = 307,            /* IMAGETEXTURE  */
    MATERIAL = 308,                /* MATERIAL  */
    MOVIETEXTURE = 309,            /* MOVIETEXTURE  */
    PIXELTEXTURE = 310,            /* PIXELTEXTURE  */
    TEXTURETRANSFORM = 311,        /* TEXTURETRANSFORM  */
    END = 312,                     /* END  */
    IDENTIFIER = 313               /* IDENTIFIER  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_C_TAB_H_INCLUDED  */
