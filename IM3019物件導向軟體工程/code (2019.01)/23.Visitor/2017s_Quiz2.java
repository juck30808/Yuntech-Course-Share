interface DiagramElement{
   public void accept(Checker c);
}
class StateDiagram implements DiagramElement{
   public void accept(Checker c){
      c.check(this);
   }
}
class State implements DiagramElement{
   public void accept(Checker c){
      c.check(this);
   }
}
class Transition implements DiagramElement{
   public void accept(Checker c){
      c.check(this);
   }
}

interface Checker{
   public void check(State s);
   public void check(Transition t);
   public void check(StateDiagram sd);
}

class SyntaxCheck implements Checker{
   public void check(State s){
      System.out.println("SyntaxCheck_State");
   }
   public void check(Transition t){
      System.out.println("SyntaxCheck_Transition");
   }
   public void check(StateDiagram sd){
      System.out.println("SyntaxCheck_StateDiagram");
   }
}

class RelationCheck implements Checker{
   public void check(State s){
      System.out.println("RelationCheck_State");
   } 
   public void check(Transition t){
      System.out.println("RelationCheck_Transition");
   }
   public void check(StateDiagram sd){
      System.out.println("RelationCheck_StateDiagram");
   }
}


public class 2017s_Quiz2 {
   public static void main(String[] args) {
      DiagramElement de = new State();
      de.accept(new SyntaxCheck());

      de =new Transition();
      de.accept(new RelationCheck());
   }
}