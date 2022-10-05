


%%

%int

variable = [a-zA-Z_][a-zA-Z0-9_]*
igual    = " "*\=" "*
union    = " "*\+" "*
especial = \\.

out =  System.out.print"ln"?" "*"("

%xstate PROGRAM, VARIABLE, PRINT, STRING, OUT

%{
    String variable="", valor="";
    boolean salida = false;
%}

%%


<YYINITIAL>{

  class                             {System.out.print(yytext());}

  {variable}                        {System.out.print(yytext() + "_rmj");}

  \{                                {System.out.print(yytext()); yybegin(PROGRAM);}

  \}                                {System.out.print(yytext());}

  [^]                               {System.out.print(yytext());}

}


<PROGRAM>{
  
  .*\{                              {System.out.print(yytext());}

  {igual}                           { }

  String" "*                        { }

  {variable}                        {variable = yytext(); yybegin(VARIABLE);}

  {out}                             {System.out.print(yytext() + "\""); yybegin(PRINT);}

  \}                                {System.out.print(yytext()); yybegin(YYINITIAL);}

  [^]                               {System.out.print(yytext());}

}


<VARIABLE>{

  {igual} | {union}                 { }

  \"                                {yybegin(STRING);}

  {variable}                        {valor += TablaSimbolos.get(yytext());}

  [\n;,]                            {TablaSimbolos.put(variable, valor); valor = ""; yybegin(PROGRAM);}

  [^]                               {System.out.print(yytext());}

}


<PRINT>{

  \"                                {yybegin(OUT);}

  {union}                           { }

  {variable}                        {System.out.print(TablaSimbolos.get(yytext()));}

  \\\"                              {System.out.print(yytext()); yybegin(OUT);}

  [^;\\\"+)]* | {especial}          {System.out.print(yytext());}

  \);                               {System.out.print("\"" + yytext()); yybegin(PROGRAM);}

  [^]                               {System.out.print(yytext());}

}


<STRING>{

  [^\\\"] | {especial}              {valor += yytext();}

  {union}                           { }

  \"                                {yybegin(VARIABLE);}

}

<OUT>{

  \"                                {yybegin(PRINT);}

  \\\"                              {System.out.print(yytext());}

  [^\\\"]* | {especial}             {System.out.print(yytext());}

  [^]                               {System.out.print(yytext());}

}
