import java.io.IOException;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.io.BufferedReader;


public class MainNumJava {
  

  public static void main(String[] args) {
    Yylex lex = null;

    try {
      if(args.length > 0){

        lex = new Yylex(new FileReader(args[0])); //Lee el fichero que se le pone en el primer argumento

      } else {

        lex = new Yylex(new BufferedReader(new InputStreamReader(System.in))); //Si no se le pasa ningún argumento, usa la entrada standard.

      }
      
      if(lex != null){
        Yytoken yytoken = null;
        
        while((yytoken = lex.yylex()) != null) {

          System.out.println("token = " + yytoken.getToken() + ", lexema = " + yytoken.getLexema());
                
        }

      }

    } catch (IOException e) {
        System.out.println("Error al abrir el fichero de entrada");

  }
}
