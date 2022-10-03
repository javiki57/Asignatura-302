

%%

%int

%xstate LINE
%xstate LINE2
%xstate BLOCK

%%

<YYINITIAL> {

  (\/\/)          {yybegin(LINE);}

  (\/\*\*)        {yybegin(LINE2);}

  (\/\*)          {yybegin(BLOCK);}

  [^]   { }
}


<LINE> {
    
  [^]   { }
}


<LINE2> {

 [^]   { }

}


<BLOCK> {

 [^]   { }

}
