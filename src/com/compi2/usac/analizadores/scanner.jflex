/**
 * @author Elmer Alay
 * @version 1.0
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
            return new Symbol(Simbolo.entero, yyline, yycolumn, yytext());
        }
"println"   {
                return new Symbol(Simbolo.print, yyline, yycolumn, yytext());
            }

// ................................. Signos ....................................
"="     {
            return new Symbol(Simbolo.equals, yyline, yycolumn, yytext());
        } 
";"     {
            return new Symbol(Simbolo.semiColon, yyline, yycolumn, yytext());
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

// ............................... Comparación .................................
"<"     {
            return new Symbol(Simbolo.lt, yyline, yycolumn, yytext());
        }
">"     {
            return new Symbol(Simbolo.gt, yyline, yycolumn, yytext());
        }
"<="    {
            return new Symbol(Simbolo.lte, yyline, yycolumn, yytext());
        }
">="    {
            return new Symbol(Simbolo.gte, yyline, yycolumn, yytext());
        }
"=="    {
            return new Symbol(Simbolo.eq, yyline, yycolumn, yytext());
        }
"!="    {
            return new Symbol(Simbolo.neq, yyline, yycolumn, yytext());
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
