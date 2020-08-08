/** "Abstraction" */
abstract class Shape {
   private DrawAPI drawAPI;

   public Shape(DrawAPI drawAPI){
      this.drawAPI = drawAPI;
   }
   public abstract void draw();  
}

class Circle extends Shape {
   private DrawingAPI drawingAPI;
   private int x, y;

   public Circle(int x, int y, DrawAPI drawAPI) {
      super(drawAPI);
      this.x = x;  
      this.y = y;  
   }
   public void draw() {
      //...
   }
}






/** "Implementor" */
interface DrawAPI {
   public void drawCircle(int x, int y);
}
class RedCircle implements DrawAPI {
   public void drawCircle(int x, int y) {
      //...
}
class GreenCircle implements DrawAPI {
   public void drawCircle(int x, int y) {
      //...
}


public class main {
   public static void main(String[] args) {
      Shape redCircle = new Circle(100,100,new RedCircle());
      Shape greenCircle = new Circle(100,100,new GreenCircle());
      redCircle.draw();
      greenCircle.draw();
   }
}
