import java.util.ArrayList;
import java.util.List;

class Memento {	
   private String state;
   public Memento(String state){
      this.state = state;
   }
   public String gets(){
      return state;
   }  
}

class Originator {	//tip
   private String state;
   public void sets(String state){
      this.state = state;
   }
   public String gets(){
      System.out.println("state:" + state);
      return state;
   }
   public Memento saves(){
   	  System.out.println("save:" + state);
      return new Memento(state);
   }
   public void undo(Memento Memento){
      state = Memento.gets();
      System.out.println("Undo:"+state);
   }
}

class CareTaker {	//tipssss
   private ArrayList<Memento> List = new ArrayList<Memento>();
   public void add(Memento state){
      List.add(state);
   }
   public Memento get(int index){
      return List.get(index);
   }
}

public class main{
   public static void main(String[] args) {
      Originator originator = new Originator();
      CareTaker careTaker = new CareTaker();
      originator.sets("State #1");
      originator.sets("State #2");
      careTaker.add(originator.saves());
      originator.sets("State #3");
      originator.sets("State #4");
      careTaker.add(originator.saves());

      originator.undo(careTaker.get(0));
   }
}
