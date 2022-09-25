import java.io.FileReader;
import java.io.IOException;


public class cpv {

  public static int A = 0;
  public static int B = 0;
  public static int C = 0;
  public static int D = 0;
    
  public static void main(String[] args) {
    
    if(args.length > 0){
    
      try{

        Yylex lex = new Yylex(new FileReader(args[0]));  
      
        while (lex.yylex() != -1){ 
        
        }

        System.out.println("A " + A);
        System.out.println("B " + B);
        System.out.println("C " + C);
        System.out.println("D " + D);

      } catch (IOException e){
          System.err.println("Error: '" + e.getMessage() + "'.");
      }

    } else {

          System.out.println("Se necesita un archivo de texto como argumento.");

      }

  }

}
