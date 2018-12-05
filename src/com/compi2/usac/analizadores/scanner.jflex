/**
 * @author Elmer Alay
 * @version 4.0
 * @since   05-12-2018
*/


package com.compi2.usac.analizadores;
import java_cup.runtime.Symbol; 

%% 

// ---------------------------------------------------------- 
// ...................... Directivas ........................
// ----------------------------------------------------------
%cupsym Simbolo
%class Scanner
%public 
%line
%column 
%char 
%cup 
%unicode


// ---------------------------------------------------------- 
// .......... Inicializamos fila y columna en 1 .............
// ----------------------------------------------------------
%init{ 
    yyline = 1; 
    yycolumn = 1; 
%init} 
 

// ---------------------------------------------------------- 
// ................ Expresiones Regulares ...................
// ----------------------------------------------------------
number = [0-9]+
id = [A-Za-z]+["_"0-9A-Za-z]*

%%

// ----------------------------------------------------------------------------- 
// ........................... Palabras reservadas .............................
// -----------------------------------------------------------------------------

"var"   {
            return new Symbol(Simbolo.var, yyline, yycolumn, yytext());
        }
"println"   {
                return new Symbol(Simbolo.println, yyline, yycolumn, yytext());
            }
"if"    {
            return new Symbol(Simbolo.cond_if, yyline, yycolumn, yytext());
        }
"else"  {
            return new Symbol(Simbolo.cond_else, yyline, yycolumn, yytext());
        }

// ................................. Signos ....................................
"="     {
            return new Symbol(Simbolo.asign, yyline, yycolumn, yytext());
        } 
";"     {
            return new Symbol(Simbolo.semicolon, yyline, yycolumn, yytext());
        }

// .......................... Operadores Aritméticos ...........................
"+"     {
            return new Symbol(Simbolo.plus, yyline, yycolumn, yytext());
        } 
"-"     {
            return new Symbol(Simbolo.minus, yyline, yycolumn, yytext());
        } 
"*"     {
            return new Symbol(Simbolo.mult, yyline, yycolumn, yytext());
        } 
"/"     {
            return new Symbol(Simbolo.div, yyline, yycolumn, yytext());
        }

// ................................ booleanos  .................................
"true"  {
            return new Symbol(Simbolo.bool_true, yyline, yycolumn, yytext());
        }
"false" {
            return new Symbol(Simbolo.bool_false, yyline, yycolumn, yytext());
        }

// ................................ Agrupación .................................
"{"     {
            return new Symbol(Simbolo.bracket_o, yyline, yycolumn, yytext());
        }
"}"     {
            return new Symbol(Simbolo.bracket_c, yyline, yycolumn, yytext());
        }
"("     {
            return new Symbol(Simbolo.par_o, yyline, yycolumn, yytext());
        }
")"     {
            return new Symbol(Simbolo.par_c, yyline, yycolumn, yytext());
        }


// ----------------------------------------------------------------------------- 
// .......................... Expresiones Regulares ............................
// -----------------------------------------------------------------------------

// ........................... Expresiones Regulares ...........................
{id}        {
                return new Symbol(Simbolo.id,yyline,yychar, yytext());
            } 
{number}    {
                return new Symbol(Simbolo.number, yyline, yycolumn, yytext());
            }

// .............................. Saltos de linea ..............................
\n          {
                yycolumn = 1;
            }
// .................................. Blancos ..................................
[ \r\t]+ {} 

// --------------------------------------------------------------------------------------------------------------
// .................................................. Errores ...................................................
// --------------------------------------------------------------------------------------------------------------
.   {
        System.out.println("Este es un error lexico: "+yytext()+", en la linea: "+yyline+", en la columna: "+yychar);
    }
