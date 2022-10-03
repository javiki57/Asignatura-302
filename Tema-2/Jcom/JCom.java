import java.io.IOException;
import java.io.FileReader;              

public class JCom {

  public static int line = 0;
  public static int line2 = 0;
  public static int block = 0;

  public static void main(String[] args) {
    
    if (args.length > 0) {
      
      try {
        Yylex lex = new Yylex(new FileReader(args[0]));
        
        while (lex.yylex() != -1) {

        }

        System.out.println("//  " + line);
        System.out.println("/*  " + line2);
        System.out.println("/** " + block);


      } catch (IOException e) {
        System.err.println("Error: '" + e.getMessage() + "'.");
      }

    } else {
      System.out.println("Se necesita un archivo de texto como argumento.");
    }

  }
}
