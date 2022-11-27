


%%

tiempo = 0[0-9]|1[0-9]|2[0-3]:[0-5][0-9]:[0-5][0-9]\,[0-9][0-9][0-9]


%xstate TIEMPO, SUBTITULOS, TEXTO
%int

%{
  int tiempoIni;
%}

%%

<YYINITIAL>{
  
  [1-9]+            {srt.NUM_SUBTITULOS = Integer.parseInt(yytext());}
  
  {tiempo}          {tiempoIni = Integer.parseInt(yytext().substring(0, yytext().length()-3)); yybegin(TIEMPO);}

  [^\n\t\r\ ]+      {srt.NUM_PALABRAS++; yybegin(TEXTO);}

  [^]               { }

}


<TIEMPO>{

  "-->"              { }

  {tiempo}           {tiempoIni = Integer.parseInt(yytext().substring(0, yytext().length()-3)) - tiempoIni; srt.TIEMPO_TOTAL+=tiempoIni; yybegin(YYINITIAL);}

}

<TEXTO>{

  \n                {srt.NUM_LINEAS++;}

  ^\s+$             {yybegin(YYINITIAL);}

}

