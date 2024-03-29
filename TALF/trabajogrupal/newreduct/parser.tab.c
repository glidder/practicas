/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison implementation for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.5"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */

/* Line 268 of yacc.c  */
#line 1 "parser.y"

#include <iostream>
#include <string>
#include <stdio.h>
using namespace std;
int yyerror(const char* msj);
int yylex(void);
extern FILE *yyin;


/* Line 268 of yacc.c  */
#line 82 "parser.tab.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 1
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ID = 258,
     ENTERO = 259,
     REAL = 260,
     CADENA = 261
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 293 of yacc.c  */
#line 12 "parser.y"

  int valor;
  string * nombre;



/* Line 293 of yacc.c  */
#line 131 "parser.tab.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 343 of yacc.c  */
#line 143 "parser.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  10
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   166

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  33
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  27
/* YYNRULES -- Number of rules.  */
#define YYNRULES  72
/* YYNRULES -- Number of states.  */
#define YYNSTATES  145

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   269

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    26,     2,     2,     2,     2,    25,     2,
       9,    10,    31,    29,    18,    30,     2,    32,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    11,
      27,    23,    28,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     7,     2,     8,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    12,    24,    13,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,    14,    15,    16,    17,    19,    20,    21,    22
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint8 yyprhs[] =
{
       0,     0,     3,     7,     8,    17,    20,    24,    29,    31,
      33,    37,    40,    41,    43,    46,    52,    59,    61,    65,
      67,    68,    71,    75,    80,    86,    87,    89,    92,    94,
      97,    99,   102,   106,   107,   112,   115,   116,   119,   120,
     125,   127,   129,   134,   136,   141,   143,   148,   153,   155,
     160,   165,   170,   175,   179,   183,   185,   189,   193,   195,
     199,   203,   206,   208,   210,   212,   214,   218,   223,   228,
     229,   232,   236
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      34,     0,    -1,    44,    35,    34,    -1,    -1,     7,     8,
      45,     3,     9,    43,    10,    37,    -1,     3,    36,    -1,
      58,    47,    48,    -1,     9,    43,    10,    37,    -1,    38,
      -1,    11,    -1,    12,    39,    13,    -1,    40,    39,    -1,
      -1,    42,    -1,    49,    11,    -1,    14,     9,    49,    10,
      40,    -1,    15,     9,    49,    10,    40,    41,    -1,    38,
      -1,    16,    49,    11,    -1,    11,    -1,    -1,    17,    40,
      -1,    44,    46,    11,    -1,    44,     3,    45,    43,    -1,
      18,    44,     3,    45,    43,    -1,    -1,    19,    -1,    20,
      19,    -1,    21,    -1,    20,    21,    -1,    22,    -1,    20,
      22,    -1,    45,     7,     8,    -1,    -1,     3,    58,    47,
      48,    -1,    23,    49,    -1,    -1,    18,    46,    -1,    -1,
       3,    58,    23,    49,    -1,    50,    -1,    51,    -1,    50,
      24,    24,    51,    -1,    52,    -1,    51,    25,    25,    52,
      -1,    53,    -1,    52,    23,    23,    53,    -1,    52,    26,
      23,    53,    -1,    54,    -1,    53,    27,    23,    54,    -1,
      53,    28,    23,    54,    -1,    53,    23,    23,    54,    -1,
      53,    26,    23,    54,    -1,    53,    27,    54,    -1,    53,
      28,    54,    -1,    55,    -1,    54,    29,    55,    -1,    54,
      30,    55,    -1,    56,    -1,    55,    31,    56,    -1,    55,
      32,    56,    -1,     3,    58,    -1,     4,    -1,     5,    -1,
       6,    -1,    57,    -1,     9,    49,    10,    -1,     3,     9,
      59,    10,    -1,    58,     7,    49,     8,    -1,    -1,    49,
      59,    -1,    18,    49,    59,    -1,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    22,    22,    23,    26,    27,    29,    30,    32,    33,
      35,    37,    38,    40,    41,    42,    43,    44,    45,    46,
      48,    49,    51,    53,    54,    55,    57,    58,    59,    60,
      61,    62,    64,    65,    67,    69,    70,    72,    73,    75,
      76,    78,    79,    81,    82,    84,    85,    86,    88,    89,
      90,    91,    92,    93,    94,    96,    97,    98,   100,   101,
     102,   104,   105,   106,   107,   108,   109,   111,   113,   114,
     116,   117,   118
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "ID", "ENTERO", "REAL", "CADENA", "'['",
  "']'", "'('", "')'", "';'", "'{'", "'}'", "\"while\"", "\"if\"",
  "\"return\"", "\"else\"", "','", "\"int\"", "\"const\"", "\"char\"",
  "\"float\"", "'='", "'|'", "'&'", "'!'", "'<'", "'>'", "'+'", "'-'",
  "'*'", "'/'", "$accept", "inicio", "definiciones", "cuerpo", "funcion",
  "llaves", "bloque", "sentencia", "else", "definicionv", "atributos",
  "tipo", "lc", "lista", "ldefine", "lcontinua", "asignacion", "or", "and",
  "igualdad", "relacional", "suma", "producto", "basico", "llamada", "lcn",
  "valores", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,    91,    93,    40,
      41,    59,   123,   125,   262,   263,   264,   265,    44,   266,
     267,   268,   269,    61,   124,    38,    33,    60,    62,    43,
      45,    42,    47
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    33,    34,    34,    35,    35,    36,    36,    37,    37,
      38,    39,    39,    40,    40,    40,    40,    40,    40,    40,
      41,    41,    42,    43,    43,    43,    44,    44,    44,    44,
      44,    44,    45,    45,    46,    47,    47,    48,    48,    49,
      49,    50,    50,    51,    51,    52,    52,    52,    53,    53,
      53,    53,    53,    53,    53,    54,    54,    54,    55,    55,
      55,    56,    56,    56,    56,    56,    56,    57,    58,    58,
      59,    59,    59
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     8,     2,     3,     4,     1,     1,
       3,     2,     0,     1,     2,     5,     6,     1,     3,     1,
       0,     2,     3,     4,     5,     0,     1,     2,     1,     2,
       1,     2,     3,     0,     4,     2,     0,     2,     0,     4,
       1,     1,     4,     1,     4,     1,     4,     4,     1,     4,
       4,     4,     4,     3,     3,     1,     3,     3,     1,     3,
       3,     2,     1,     1,     1,     1,     3,     4,     4,     0,
       2,     3,     0
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,    26,     0,    28,    30,     0,     0,    27,    29,    31,
       1,    69,     0,     3,    25,     5,    36,    33,     2,     0,
       0,     0,     0,     0,    38,     0,     0,     0,    33,    69,
      62,    63,    64,     0,     0,    40,    41,    43,    45,    48,
      55,    58,    65,    35,     0,     6,     0,     0,    33,     9,
      12,     7,     8,    25,    72,    61,     0,    68,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      69,    37,    25,    32,    25,    19,     0,     0,     0,    17,
       0,    12,    13,     0,     0,    23,     0,    72,     0,     0,
      66,     0,     0,     0,     0,     0,     0,    69,     0,    53,
       0,    54,    56,    57,    59,    60,    36,     0,    24,     0,
       0,     0,    10,    11,     0,    14,    72,    70,    67,    39,
      42,    44,    46,    47,    51,    52,    61,    49,    50,    38,
       0,     0,     0,    18,    22,    71,    34,     4,     0,     0,
      15,    20,     0,    16,    21
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     5,    13,    15,    51,    79,    80,    81,   143,    82,
      20,    83,    25,    71,    24,    45,    84,    35,    36,    37,
      38,    39,    40,    41,    42,    16,    88
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -97
static const yytype_int16 yypact[] =
{
      71,   -97,    48,   -97,   -97,    23,    18,   -97,   -97,   -97,
     -97,    38,    63,    71,   112,   -97,     1,   -97,   -97,    71,
      40,    73,   113,   113,    88,    41,   117,    51,   -97,   118,
     -97,   -97,   -97,   113,   127,    97,   103,   -13,    -8,    44,
      52,   -97,   -97,   -97,   133,   -97,   128,   130,   -97,   -97,
      93,   -97,   -97,    33,    76,     4,   129,   -97,   116,   119,
     122,   123,   124,   125,    26,    55,   120,   120,   120,   120,
     -97,   -97,   112,   -97,    33,   -97,   132,   134,   113,   -97,
     136,    93,   -97,   133,   131,   -97,   113,    76,   140,   113,
     -97,   120,   120,   120,   120,   120,   120,   118,   120,    44,
     120,    44,    52,    52,   -97,   -97,     1,   141,   -97,   113,
     113,   142,   -97,   -97,   143,   -97,    76,   -97,   -97,   -97,
     103,   -13,    -8,    -8,    44,    44,   145,    44,    44,    88,
      51,   146,   147,   -97,   -97,   -97,   -97,   -97,    93,    93,
     -97,   138,    93,   -97,   -97
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -97,   148,   -97,   -97,    28,   -27,    78,   -96,   -97,   -97,
     -46,     3,   -14,    77,    56,    35,   -21,   -97,    72,    74,
      -7,   -59,    34,    42,   -97,   -25,   -78
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      52,    34,    43,     6,    55,    99,   101,    85,    22,   117,
      60,    22,    56,    61,    53,    62,     6,    21,    63,    64,
      65,    11,    26,    10,    23,    12,   107,    89,   108,    97,
      30,    31,    32,    87,    74,    33,   124,   125,   135,   127,
      47,   128,   140,   141,    46,   106,   144,    14,    47,    98,
      27,    19,     1,     2,     3,     4,    21,   111,    97,    30,
      31,    32,    49,    50,    33,   116,    87,     7,   119,     8,
       9,    17,   126,    66,    67,    21,    28,    21,   100,    29,
      30,    31,    32,    68,    69,    33,   122,   123,   131,   132,
       1,     2,     3,     4,    86,    87,    29,    30,    31,    32,
     102,   103,    33,    52,    75,    50,    44,    76,    77,    78,
     104,   105,     1,     2,     3,     4,    29,    30,    31,    32,
      48,    58,    33,    97,    30,    31,    32,    54,    59,    33,
      19,     1,     2,     3,     4,    57,    70,    72,    73,    90,
      91,   109,   115,   110,    92,    93,    94,    95,    96,   112,
     118,   130,    22,   133,   134,   142,   138,   139,   137,   113,
     114,    18,   129,   120,   136,     0,   121
};

#define yypact_value_is_default(yystate) \
  ((yystate) == (-97))

#define yytable_value_is_error(yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
      27,    22,    23,     0,    29,    64,    65,    53,     7,    87,
      23,     7,    33,    26,    28,    23,    13,    14,    26,    27,
      28,     3,    19,     0,    23,     7,    72,    23,    74,     3,
       4,     5,     6,    54,    48,     9,    95,    96,   116,    98,
       7,   100,   138,   139,     3,    70,   142,     9,     7,    23,
      10,    18,    19,    20,    21,    22,    53,    78,     3,     4,
       5,     6,    11,    12,     9,    86,    87,    19,    89,    21,
      22,     8,    97,    29,    30,    72,     3,    74,    23,     3,
       4,     5,     6,    31,    32,     9,    93,    94,   109,   110,
      19,    20,    21,    22,    18,   116,     3,     4,     5,     6,
      66,    67,     9,   130,    11,    12,    18,    14,    15,    16,
      68,    69,    19,    20,    21,    22,     3,     4,     5,     6,
       3,    24,     9,     3,     4,     5,     6,     9,    25,     9,
      18,    19,    20,    21,    22,     8,     3,     9,     8,    10,
      24,     9,    11,     9,    25,    23,    23,    23,    23,    13,
      10,    10,     7,    11,    11,    17,    10,    10,   130,    81,
      83,    13,   106,    91,   129,    -1,    92
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    19,    20,    21,    22,    34,    44,    19,    21,    22,
       0,     3,     7,    35,     9,    36,    58,     8,    34,    18,
      43,    44,     7,    23,    47,    45,    44,    10,     3,     3,
       4,     5,     6,     9,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    49,    18,    48,     3,     7,     3,    11,
      12,    37,    38,    45,     9,    58,    49,     8,    24,    25,
      23,    26,    23,    26,    27,    28,    29,    30,    31,    32,
       3,    46,     9,     8,    45,    11,    14,    15,    16,    38,
      39,    40,    42,    44,    49,    43,    18,    49,    59,    23,
      10,    24,    25,    23,    23,    23,    23,     3,    23,    54,
      23,    54,    55,    55,    56,    56,    58,    43,    43,     9,
       9,    49,    13,    39,    46,    11,    49,    59,    10,    49,
      51,    52,    53,    53,    54,    54,    58,    54,    54,    47,
      10,    49,    49,    11,    11,    59,    48,    37,    10,    10,
      40,    40,    17,    41,    40
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* This macro is provided for backward compatibility. */

#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  YYSIZE_T yysize1;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = 0;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - Assume YYFAIL is not used.  It's too flawed to consider.  See
       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
       for details.  YYERROR is fine as it does not invoke this
       function.
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                yysize1 = yysize + yytnamerr (0, yytname[yyx]);
                if (! (yysize <= yysize1
                       && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                  return 2;
                yysize = yysize1;
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  yysize1 = yysize + yystrlen (yyformat);
  if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
    return 2;
  yysize = yysize1;

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:

/* Line 1806 of yacc.c  */
#line 22 "parser.y"
    {cout<<"inicio -> tipo definiciones inicio"<<endl;}
    break;

  case 3:

/* Line 1806 of yacc.c  */
#line 23 "parser.y"
    {cout<<"inicio -> EPSILON"<<endl;}
    break;

  case 4:

/* Line 1806 of yacc.c  */
#line 26 "parser.y"
    {cout<<"dcuerpo -> lista ;"<<endl;}
    break;

  case 5:

/* Line 1806 of yacc.c  */
#line 27 "parser.y"
    {cout<<"dcuerpo -> lista ;"<<endl;}
    break;

  case 6:

/* Line 1806 of yacc.c  */
#line 29 "parser.y"
    {cout<<"dcuerpo -> lista ;"<<endl;}
    break;

  case 7:

/* Line 1806 of yacc.c  */
#line 30 "parser.y"
    {cout<<"dcuerpo -> lista ;"<<endl;}
    break;

  case 8:

/* Line 1806 of yacc.c  */
#line 32 "parser.y"
    {cout<<"funcion -> llaves"<<endl;}
    break;

  case 9:

/* Line 1806 of yacc.c  */
#line 33 "parser.y"
    {cout<<"funcion -> ;"<<endl;}
    break;

  case 10:

/* Line 1806 of yacc.c  */
#line 35 "parser.y"
    {cout<<"llaves -> { bloque }"<<endl;}
    break;

  case 11:

/* Line 1806 of yacc.c  */
#line 37 "parser.y"
    {cout<<"bloque -> sentencia bloque"<<endl;}
    break;

  case 12:

/* Line 1806 of yacc.c  */
#line 38 "parser.y"
    {cout<<"bloque -> EPSILON"<<endl;}
    break;

  case 13:

/* Line 1806 of yacc.c  */
#line 40 "parser.y"
    {cout<<"sentencia -> definicion"<<endl;}
    break;

  case 14:

/* Line 1806 of yacc.c  */
#line 41 "parser.y"
    {cout<<"sentencia -> asignacion ;"<<endl;}
    break;

  case 15:

/* Line 1806 of yacc.c  */
#line 42 "parser.y"
    {cout<<"sentencia -> while ( asignacion ) sentencia"<<endl;}
    break;

  case 16:

/* Line 1806 of yacc.c  */
#line 43 "parser.y"
    {cout<<"sentencia -> if ( asignacion ) sentencia else"<<endl;}
    break;

  case 17:

/* Line 1806 of yacc.c  */
#line 44 "parser.y"
    {cout<<"sentencia -> llaves"<<endl;}
    break;

  case 18:

/* Line 1806 of yacc.c  */
#line 45 "parser.y"
    {cout<<"sentencia -> return asignacion ;"<<endl;}
    break;

  case 19:

/* Line 1806 of yacc.c  */
#line 46 "parser.y"
    {cout<<"sentencia -> ;"<<endl;}
    break;

  case 20:

/* Line 1806 of yacc.c  */
#line 48 "parser.y"
    {cout<<"else -> EPSILON"<<endl;}
    break;

  case 21:

/* Line 1806 of yacc.c  */
#line 49 "parser.y"
    {cout<<"else -> else sentencia"<<endl;}
    break;

  case 22:

/* Line 1806 of yacc.c  */
#line 51 "parser.y"
    {cout<<"definicionv -> tipo lista ;"<<endl;}
    break;

  case 23:

/* Line 1806 of yacc.c  */
#line 53 "parser.y"
    {cout<<"atributos -> tipo ID lc atributos "<<endl;}
    break;

  case 24:

/* Line 1806 of yacc.c  */
#line 54 "parser.y"
    {cout<<"atributos -> , tipo ID lc atributos"<<endl;}
    break;

  case 25:

/* Line 1806 of yacc.c  */
#line 55 "parser.y"
    {cout<<"atributos -> EPSILON "<<endl;}
    break;

  case 26:

/* Line 1806 of yacc.c  */
#line 57 "parser.y"
    {cout<<"tipo -> int"<<endl;}
    break;

  case 27:

/* Line 1806 of yacc.c  */
#line 58 "parser.y"
    {cout<<"tipo -> const int"<<endl;}
    break;

  case 28:

/* Line 1806 of yacc.c  */
#line 59 "parser.y"
    {cout<<"tipo -> char"<<endl;}
    break;

  case 29:

/* Line 1806 of yacc.c  */
#line 60 "parser.y"
    {cout<<"tipo -> const char"<<endl;}
    break;

  case 30:

/* Line 1806 of yacc.c  */
#line 61 "parser.y"
    {cout<<"tipo -> float"<<endl;}
    break;

  case 31:

/* Line 1806 of yacc.c  */
#line 62 "parser.y"
    {cout<<"tipo -> const float"<<endl;}
    break;

  case 32:

/* Line 1806 of yacc.c  */
#line 64 "parser.y"
    {cout<<"lc -> lc [ ]"<<endl;}
    break;

  case 33:

/* Line 1806 of yacc.c  */
#line 65 "parser.y"
    {cout<<"lc -> EPSILON"<<endl;}
    break;

  case 34:

/* Line 1806 of yacc.c  */
#line 67 "parser.y"
    {cout<<"lista -> ID lcn ldefine lcontinua"<<endl;}
    break;

  case 35:

/* Line 1806 of yacc.c  */
#line 69 "parser.y"
    {cout<<"ldefine -> = asignacion"<<endl;}
    break;

  case 36:

/* Line 1806 of yacc.c  */
#line 70 "parser.y"
    {cout<<"ldefine -> EPSILON"<<endl;}
    break;

  case 37:

/* Line 1806 of yacc.c  */
#line 72 "parser.y"
    {cout<<"lcontinua -> , lista"<<endl;}
    break;

  case 38:

/* Line 1806 of yacc.c  */
#line 73 "parser.y"
    {cout<<"lcontinua -> EPSILON"<<endl;}
    break;

  case 39:

/* Line 1806 of yacc.c  */
#line 75 "parser.y"
    {cout<<"asignacion -> ID lcn = asignacion"<<endl;}
    break;

  case 40:

/* Line 1806 of yacc.c  */
#line 76 "parser.y"
    {cout<<"asignacion -> or"<<endl;}
    break;

  case 41:

/* Line 1806 of yacc.c  */
#line 78 "parser.y"
    {cout<<"or -> and"<<endl;}
    break;

  case 42:

/* Line 1806 of yacc.c  */
#line 79 "parser.y"
    {cout<<"or -> or || and"<<endl;}
    break;

  case 43:

/* Line 1806 of yacc.c  */
#line 81 "parser.y"
    {cout<<"and -> igualdad"<<endl;}
    break;

  case 44:

/* Line 1806 of yacc.c  */
#line 82 "parser.y"
    {cout<<"and -> and && igualdad"<<endl;}
    break;

  case 45:

/* Line 1806 of yacc.c  */
#line 84 "parser.y"
    {cout<<"igualdad -> relacional"<<endl;}
    break;

  case 46:

/* Line 1806 of yacc.c  */
#line 85 "parser.y"
    {cout<<"igualdad -> igualdad == relacional"<<endl;}
    break;

  case 47:

/* Line 1806 of yacc.c  */
#line 86 "parser.y"
    {cout<<"igualdad -> igualdad != relacional"<<endl;}
    break;

  case 48:

/* Line 1806 of yacc.c  */
#line 88 "parser.y"
    {cout<<"relacional -> suma"<<endl;}
    break;

  case 49:

/* Line 1806 of yacc.c  */
#line 89 "parser.y"
    {cout<<"relacional -> relacional <= suma"<<endl;}
    break;

  case 50:

/* Line 1806 of yacc.c  */
#line 90 "parser.y"
    {cout<<"relacional -> relacional >= suma"<<endl;}
    break;

  case 51:

/* Line 1806 of yacc.c  */
#line 91 "parser.y"
    {cout<<"relacional -> relacional == suma"<<endl;}
    break;

  case 52:

/* Line 1806 of yacc.c  */
#line 92 "parser.y"
    {cout<<"relacional -> relacional != suma"<<endl;}
    break;

  case 53:

/* Line 1806 of yacc.c  */
#line 93 "parser.y"
    {cout<<"relacional -> relacional < suma"<<endl;}
    break;

  case 54:

/* Line 1806 of yacc.c  */
#line 94 "parser.y"
    {cout<<"relacional -> relacional > suma"<<endl;}
    break;

  case 55:

/* Line 1806 of yacc.c  */
#line 96 "parser.y"
    {cout<<"suma -> producto"<<endl;}
    break;

  case 56:

/* Line 1806 of yacc.c  */
#line 97 "parser.y"
    {cout<<"suma -> suma + producto"<<endl;}
    break;

  case 57:

/* Line 1806 of yacc.c  */
#line 98 "parser.y"
    {cout<<"suma -> suma - producto"<<endl;}
    break;

  case 58:

/* Line 1806 of yacc.c  */
#line 100 "parser.y"
    {cout<<"producto -> basico"<<endl;}
    break;

  case 59:

/* Line 1806 of yacc.c  */
#line 101 "parser.y"
    {cout<<"producto -> producto * basico"<<endl;}
    break;

  case 60:

/* Line 1806 of yacc.c  */
#line 102 "parser.y"
    {cout<<"producto -> producto / basico"<<endl;}
    break;

  case 61:

/* Line 1806 of yacc.c  */
#line 104 "parser.y"
    {cout<<"basico -> ID lcn"<<endl;}
    break;

  case 62:

/* Line 1806 of yacc.c  */
#line 105 "parser.y"
    {cout<<"basico -> ENTERO"<<endl;}
    break;

  case 63:

/* Line 1806 of yacc.c  */
#line 106 "parser.y"
    {cout<<"basico -> REAL"<<endl;}
    break;

  case 64:

/* Line 1806 of yacc.c  */
#line 107 "parser.y"
    {cout<<"basico -> CADENA"<<endl;}
    break;

  case 65:

/* Line 1806 of yacc.c  */
#line 108 "parser.y"
    {cout<<"basico -> llamada"<<endl;}
    break;

  case 66:

/* Line 1806 of yacc.c  */
#line 109 "parser.y"
    {cout<<"basico -> ( asignacion )"<<endl;}
    break;

  case 67:

/* Line 1806 of yacc.c  */
#line 111 "parser.y"
    {cout<<"llamada -> ID ( valores )"<<endl;}
    break;

  case 68:

/* Line 1806 of yacc.c  */
#line 113 "parser.y"
    {cout<<"lcn -> lcn [ asignacion ]"<<endl;}
    break;

  case 69:

/* Line 1806 of yacc.c  */
#line 114 "parser.y"
    {cout<<"lcn -> EPSILON"<<endl;}
    break;

  case 70:

/* Line 1806 of yacc.c  */
#line 116 "parser.y"
    {cout<<"valores -> asignacion valores"<<endl;}
    break;

  case 71:

/* Line 1806 of yacc.c  */
#line 117 "parser.y"
    {cout<<"valores -> , asignacion valores"<<endl;}
    break;

  case 72:

/* Line 1806 of yacc.c  */
#line 118 "parser.y"
    {cout<<"valores -> EPSILON"<<endl;}
    break;



/* Line 1806 of yacc.c  */
#line 1989 "parser.tab.c"
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 2067 of yacc.c  */
#line 120 "parser.y"


int main() {
  /*cout << "Introduzca el nombre del archivo:\n";
  char* nombre;
  cin>>nombre;
  cout<<nombre<<endl;
  yyin = fopen(nombre, "r");
  yyparse();
  cout << "Final del programa\n";
  fclose(yyin);*/
  cout << "Teclee el programa:\n"; yyparse(); cout << "Final del programa\n";
  return EXIT_SUCCESS;
} // fin de main()

int yyerror(const char* msj) {
  cerr << msj << endl;
  return 1;
} // fin de yyerror()


