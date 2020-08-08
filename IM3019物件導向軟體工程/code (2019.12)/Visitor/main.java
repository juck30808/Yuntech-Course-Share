interface Element {
   public void accept(Visitor visitor);
}
class Keyboard implements Element {
   public void accept(Visitor visitor) {
      visitor.visit(this);
   }
}
class Mouse implements Element {
   public void accept(Visitor visitor) {
      visitor.visit(this);
   }
}

interface Visitor {
   public void visit(Mouse mouse);
   public void visit(Keyboard keyboard);
}
class ConcreteVisitor implements Visitor {
   public void visit(Mouse mouse) {
      System.out.println("Displaying Mouse.");}
   public void visit(Keyboard keyboard) {
      System.out.println("Displaying Keyboard.");}
}

public class main {
   public static void main(String[] args) {
      Element element = new  Keyboard();
      element.accept(new ConcreteVisitor());

      element = new Mouse();
      element.accept(new ConcreteVisitor());
   }
}


