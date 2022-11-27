import java.io.IOException;
import java.io.FileReader;


public class srt {

   public static int NUM_SUBTITULOS, TIEMPO_TOTAL, NUM_LINEAS, NUM_PALABRAS;

    public static void main(String[] args) {
        if (args.length > 0) {

            try {
                Yylex lex = new Yylex(new FileReader(args[0]));
		            
                lex.yylex();
	               
	              
	           
                System.out.println("NUM_SUBTITULOS " + NUM_SUBTITULOS);
                System.out.println("TIEMPO_TOTAL " + TIEMPO_TOTAL);
                System.out.println("NUM_LINEAS " + NUM_LINEAS);
                System.out.println("NUM_PALABRAS " + NUM_PALABRAS);

            } catch (IOException e) {
                System.err.println("Error: '" + e.getMessage() + "'.");
            }
            
        } else {
        	System.out.println("Se necesita un archivo .srt como argumento.");
        }
    }
}
