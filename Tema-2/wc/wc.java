import java.io.FileReader;
import java.io.IOException;

public class wc {
  
  public static int lineas = 0;
  public static int palabras = 0;
  public static int caracteres = 0;

  public static void main(String[] args) {
  
    if(args.length > 0){

      try{

        Yylex lex = new Yylex(new FileReader(args[0]));

        while (lex.yylex() != -1) {
          
        }

        System.out.println(lineas + "\t" + palabras + "\t" + caracteres + " " + args[0]);

      } catch (IOException e){
          System.err.println("Error: '" + e.getMessage() + "'.");
      }
    }
  }

}
