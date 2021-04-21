%{
/* Declarations section */
#include <stdio.h>
#define YYSTYPE int
#include "parser.tab.hpp"
#include "output.hpp"
%}

%option yylineno
%option noyywrap
digit   ([1-9])
letter  ([a-zA-Z])
whitespace  ([\r\n\t ])
hexchar ([0-9a-fA-F])
escape  (\\n|\\r|\\t|\\0|\\x{hexchar}{2}|\\.)
%x          STRINGS_TERM

%%

void                                                                                                                                                return VOID;
int                                                                                                                                                 return INT;
byte                                                                                                                                                return BYTE;
b                                                                                                                                                   return B;
bool                                                                                                                                                return BOOL;
and                                                                                                                                                 return AND;
or                                                                                                                                                  return OR;
not                                                                                                                                                 return NOT;
true                                                                                                                                                return TRUE;
false                                                                                                                                               return FALSE;
return                                                                                                                                              return RETURN;
if                                                                                                                                                  return IF;
else                                                                                                                                                return ELSE;
while                                                                                                                                               return WHILE;
break                                                                                                                                               return BREAK;
continue                                                                                                                                            return CONTINUE;
switch                                                                                                                                              return SWITCH;
case                                                                                                                                                return CASE;
default                                                                                                                                             return DEFAULT;
(\:)                                                                                                                                                return COLON;
(\;)                                                                                                                                                return SC;
(\,)                                                                                                                                                return COMMA;
(\()                                                                                                                                                return LPAREN;
(\))                                                                                                                                                return RPAREN;
(\{)                                                                                                                                                return LBRACE;
(\})                                                                                                                                                return RBRACE;
(=)                                                                                                                                                 return ASSIGN;
( == | != | < | > | <= | >= )                                                                                                                       return RELOP;
( \+ | \- | \* | \/ )                                                                                                                               return BINOP;
\/\/[^\r\n]*(\r|\n|\r\n)?                                                                                                                           return COMMENT;
[a-zA-Z][a-zA-Z0-9]*                                                                                                                                return ID;
0|[1-9][0-9]*                                                                                                                                       return NUM;
{whitespace}                                                                                                                                        ;
"([^\n\r\"\\]|\\[rnt"\\])+"                                                                                                                         return STRING;
.                                                                                                                                                   return ERRORCHAR;

%%