

%%

Octal       = ^0[1-7][0-7]*
Hexadecimal = 0x[0-9a-fA-F]+
Entero      = [0-9] | [1-9][0-9]*
Decimal     = [0-9]+\.[0-9]* | [0-9]*\.[0-9]+

%%

/*Representación Entero */
{Entero}                                             {return new Yytoken(Yytoken.TOKEN_CTE_ENTERO_LARGO, yytext());}

/*Representación Hexadecimal*/

{Hexadecimal}                                        {return new Yytoken(Yytoken.TOKEN_CTE_ENTERO, yytext());}

/*Representación octal*/

{Octal}                                              {return new Yytoken(Yytoken.TOKEN_CTE_ENTERO, yytext());}

/*Representación Largos*/

({Hexadecimal} | {Octal} | {Entero})[lL]             {return new Yytoken(Yytoken.TOKEN_CTE_ENTERO_LARGO, yytext());}

/*Hexadecimal incorrecto*/

(^[0-9]*|^00+)x+[0-9a-zA-Z]*[lL]?                    {return new Yytoken(Yytoken.TOKEN_ERROR, yytext());}

/*Octal incorrecto*/

^0[0-9]+[lL]?                                        {return new Yytoken(Yytoken.TOKEN_ERROR, yytext());}

/*Representación Real sin exponente*/

{Decimal}                                            {return new Yytoken(Yytoken.TOKEN_CTE_REAL_LARGO, yytext());}


