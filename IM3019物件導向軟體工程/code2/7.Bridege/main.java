abstract class Shape {
   DrawAPI drawAPI;
   public Shape(DrawAPI drawAPI){
      this.drawAPI = drawAPI;
   }
   public abstract void draw();  
}

class Circle extends Shape {
   private int x, y, radius;
   public Circle(int x, int y, int radius, DrawAPI drawAPI) {
      super(drawAPI);
      this.x = x;  
      this.y = y;  
      this.radius = radius;
   }
   public void draw() {
      drawAPI.drawCircle(radius,x,y);
   }
}

interface DrawAPI {
   public void drawCircle(int radius, int x, int y);
}
class RedCircle implements DrawAPI {
   public void drawCircle(int radius, int x, int y) {
      System.out.println("color:red, radius:"+radius +",x:" +x+","+y+"]");}
}
class GreenCircle implements DrawAPI {
   public void drawCircle(int radius, int x, int y) {
      System.out.println("color:green, radius:"+radius +",x:" +x+","+y+"]");}
}

public class main {
   public static void main(String[] args) {
      Shape redCircle = new Circle(100,100, 10, new RedCircle());
      Shape greenCircle = new Circle(100,100, 10, new GreenCircle());
      redCircle.draw();
      greenCircle.draw();
   }
}
