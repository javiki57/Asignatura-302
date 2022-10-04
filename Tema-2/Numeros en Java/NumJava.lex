

%%

Octal       = 0[1-7][0-7]*
Hexadecimal = 0x[0-9a-fA-F]+
Entero      = [0-9] | [1-9][0-9]*
Decimal     = [0-9]+\.[0-9]* | [0-9]*\.[0-9]+
Exponente   = [eE][-+]?[0-9]+

%%

/*Representación Entero */
{Entero}                                                    {return new Yytoken(Yytoken.TOKEN_CTE_ENTERO_LARGO, yytext());}

/*Representación Hexadecimal*/

{Hexadecimal}                                               {return new Yytoken(Yytoken.TOKEN_CTE_ENTERO, yytext());}

/*Representación octal*/
  
{Octal}                                                     {return new Yytoken(Yytoken.TOKEN_CTE_ENTERO, yytext());}

/*Representación Largos*/

({Hexadecimal} | {Octal} | {Entero})[lL]                    {return new Yytoken(Yytoken.TOKEN_CTE_ENTERO_LARGO, yytext());}

/*Hexadecimal incorrecto*/

(00+ | [0-9]*)x+[0-9a-zA-Z]*[lL]?                           {return new Yytoken(Yytoken.TOKEN_ERROR, yytext());}

/*Octal incorrecto*/

^0[0-9]+[lL]?                                               {return new Yytoken(Yytoken.TOKEN_ERROR, yytext());}

/*Representación Decimal sin exponente*/

({Entero} | {Octal} | {Decimal})[dD]?                       {return new Yytoken(Yytoken.TOKEN_CTE_REAL_LARGO, yytext());}

({Entero} | {Octal} | {Decimal})[fF]                        {return new Yytoken(Yytoken.TOKEN_CTE_REAL_CORTO, yytext());}

/* Números decimales sin exponente, 
omitiendo dígitos antes o detrás del punto */

(\.[0-9]+ | [0-9]+\.)[dD]?                                  {return new Yytoken(Yytoken.TOKEN_CTE_REAL_LARGO, yytext());}

(\.[0-9]+ | [0-9]+\.)[fF]                                   {return new Yytoken(Yytoken.TOKEN_CTE_REAL_CORTO, yytext());}

/* Decimales con exponente */
{Decimal}{Exponente}[dD]?                                   {return new Yytoken(Yytoken.TOKEN_CTE_REAL_LARGO, yytext());}
{Decimal}{Exponente}[fF]                                    {return new Yytoken(Yytoken.TOKEN_CTE_REAL_CORTO, yytext());}
 
/* Números con mantisa entera y exponente */
[0-9]+{Exponente}[dD]?                                      {return new Yytoken(Yytoken.TOKEN_CTE_REAL_LARGO, yytext());}
[0-9]+{Exponente}[fF]                                       {return new Yytoken(Yytoken.TOKEN_CTE_REAL_CORTO, yytext());}
 
/* Números reales incorrectos */
(['.'0-9eE+-]* | [0-9]*\.?{Exponente}{Decimal}?)[dDfF]?     {return new Yytoken(Yytoken.TOKEN_ERROR, yytext());}
 
 
/* Números con letras o solo letras */
[0-1a-zA-Z]+                                                {return new Yytoken(Yytoken.TOKEN_ERROR, yytext());}
 
 
/* Saltos y espacios */
[\ \b\t\r\n]                                                {/* Ignorar */}
 
/* Salida por defecto (nada de lo anterior) */
[^]                                                         {return new Yytoken(Yytoken.TOKEN_ERROR, yytext());}


