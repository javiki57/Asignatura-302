import java.util.List;
import java.util.LinkedList;

%%
%int

numero   = [0-9]+
operador = [\+\-\*\/]

%{
  List<Integer> lista = new LinkedList();
  String operator;

  public void operar(List pila, String op) {
    int ida, idb, a, b, res = 0;
    
    a = (int) pila.get(pila.size()-2);
    b = (int) pila.get(pila.size()-1);
    
    ida = pila.size()-2;
    idb = pila.size()-1;
            
    switch (op) {
        case "+":
            res = a + b;
            break;
            
        case "-":
            res = a - b;
            break;
            
        case "*":
            res = a * b;
            break;
            
        case "/":
            res = a / b;
            break;
            
        default:
            System.err.println("Error: operador = " + op);
            break;
    }
    
    // System.out.print(pila + " " + operador);
    
    pila.set(ida, res);
    pila.remove(idb);
    
    // System.out.println(" -> " + pila);
  }

  
%}

%xstate OPERATION, PARENTESIS

%%

<YYINITIAL>{

  {numero}                      {lista.add(Integer.parseInt(yytext()));}

  {operador}                    {operator = yytext(); yybegin(OPERATION);}

  \(                            {yybegin(PARENTESIS);}

  \)                            {if (lista.size() > 1){ operar(lista, "*");};}

  ;                             {System.out.println(lista.get(0)); lista.clear();}

  [^]                           { }

}

<OPERATION>{

  {numero}                      {lista.add(Integer.parseInt(yytext())); operar(lista, operator); yybegin(YYINITIAL);}

}

<PARENTESIS>{

  {numero}                      {lista.add(Integer.parseInt(yytext()));}


  {operador}                    {operator = yytext(); yybegin(OPERATION);}

  ")"                           {if (lista.size() > 1) { operar(lista, "*"); };}

  ";"                           {System.out.println(lista.get(0));}

  [^]                           { }


}
