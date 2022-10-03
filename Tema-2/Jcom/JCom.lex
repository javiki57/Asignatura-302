

%%

%int

%xstate LINE
%xstate LINE2
%xstate BLOCK

%%

<YYINITIAL> {

  \/\/            {yybegin(LINE);}

  \/\*\*          {yybegin(LINE2);}

  \/\*            {yybegin(BLOCK);}

  \"[^]*\"        { }

  [^]             { }
}


<LINE> {
  
  [^\t\n\r\ ]      {JCom.line++;}

  \n               {yybegin(YYINITIAL);}

  [^]              { }
}


<LINE2> {
  
  [^\t\n\r\ ]      {JCom.line2++;} 

  \*\/             {yybegin(YYINITIAL);}

  [^]              { }

}


<BLOCK> {
  
  [^\t\n\r\ ]      {JCom.block++;}

  \*\/             {yybegin(YYINITIAL);}

  [^]   { }

}
