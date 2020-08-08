//Context
// c = 禮盒驗
class Context{  //selesman
   private Strategy s;
   
   public void set(Strategy s){
      this.s = s;
   }
   public void execute(){
      s.execute();  
   }
}

//Strategy
interface Strategy{
   public void execute();
}
class FoodPanda implements Strategy{
   public void execute(){
      //...
}
class UberEat implements Strategy{
   public void execute(){
      //...
}

public class main{
   public static void main(String[] args) {
      Context c = new Context();
      c.set(new FoodPanda());
      c.execute();
      c.set(new UberEat());
      c.execute();
   }
}

