abstract class Cook {  
    public final void cookProcess(){  
         this.pourOil();
         this.HeatOil(); 
         this.pourMeal();
         this.pourSauce();
    }  
    public void pourOil(){  
        System.out.println("pourOil!");}  
    public void HeatOil(){
        System.out.println("HeatOil!");}   
    public abstract void pourMeal();
    public abstract void pourSauce();
}

class Meet extends Cook{
    public void pourMeal(){  
        System.out.println("put:pork");}  
    public void pourSauce(){
        System.out.println("put:BBQ_sauce\n");}
}
class TomatoEgg extends Cook{
    public void pourMeal(){  
        System.out.println("put:Egg");}
    public void pourSauce(){
        System.out.println("put:Tomato_Sauce\n");}
}

public class main2{
  public static void main(String[] args){
    Meet m = new Meet();
    m.cookProcess();
    TomatoEgg egg= new TomatoEgg();
    egg.cookProcess();
    }
}
