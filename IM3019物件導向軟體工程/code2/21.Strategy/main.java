class Context{  //selesman
   private Strategy s;
   public void set(Strategy s){
      this.s = s;
   }
   public void execute(){
      s.execute();  
   }
}

interface Strategy{
   public void execute();
}
class StrategyA implements Strategy{
   public void execute(){
      System.out.println("Merry X'mas!");}
}
class StrategyB implements Strategy{
   public void execute(){
      System.out.println("Happy New Year!");}
}



public class main{
   public static void main(String[] args) {
      Context c = new Context();
      c.set(new StrategyA());
      c.execute();
      c.set(new StrategyB());
      c.execute();
   }
}

