public class Yytoken {
  
  public final static int TOKEN_CTE_ENTERO = 50;
  public final static int TOKEN_CTE_ENTERO_LARGO = 51;
  public final static int TOKEN_CTE_REAL_CORTO = 52;
  public final static int TOKEN_CTE_REAL_LARGO = 53;
  public final static int TOKEN_ERROR = 54;

  private int token;
  private String lexema;

  public Yytoken(int token, String lexema){
    this.token = token;
    this.lexema = lexema;
  }

  public int getToken() {
    return token;
  }

  public String getLexema() {
    return lexema;
  }
  
  public String toString(){
    return "<"+token","+lexema+">";
  }

}
