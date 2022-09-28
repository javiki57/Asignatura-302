

%%


%%

0x[0-9a-fA-F]+[lL]                  {return new Yytoken(Yytoken.TOKEN_CTE_ENTERO_LARGO, yytext());}

0x[0-9a-fA-F]+                      {return new Yytoken(Yytoken.TOKEN_CTE_ENTERO, yytext());}

^0[1-7][0-7]*                       {return new Yytoken(Yytoken.TOKEN_CTE_ENTERO, yytext());}


