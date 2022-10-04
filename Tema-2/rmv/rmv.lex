

%%
%int

variable = [a-zA-Z_][a-zA-Z_0-9]*
command  = [a-zA-Z][a-zA-Z_0-9]*

%xstate COMMAND, VALOR, STRING

%{
    String variable, valor;
%}


%%


<YYINITIAL>{

  {variable}=           {variable = yytext().substring(0, yytext().length()-1); valor = ""; yybegin(VALOR);}

  {command}" "          {System.out.print(yytext()); yybegin(COMMAND);}

  [^]                   { }

}

<COMMAND>{
  
  \${variable}          {System.out.print(TablaSimbolos.get(yytext()));}

  [^]                   {System.out.print(yytext());}

}

<VALOR>{
  
  \"                    {yybegin(STRING);}

  \${variable}          {valor += TablaSimbolos.get(yytext());}

  \\. | [^\n\t\ |;]     {valor += yytext();}

  [\t\n|;]              {TablaSimbolos.put(variable, valor); yybegin(YYINITIAL);}

}

<STRING>{

  \${variable}          {valor += TablaSimbolos.get(yytext());}

  \\. | [^\"]           {valor += yytext();}

  \"                    {TablaSimbolos.put(variable, valor); yybegin(YYINITIAL);}

}
