//AbstractFactory
abstract class AbstractFactory {    
   public abstract Color getColor(String color); 
   public abstract Shape getShape(String shape); 
}
class ShapeFactory extends AbstractFactory {
   public Shape getShape(String in){   
      if(in == "CIRCLE"){
         return new Circle();
      } else if(in =="SQUARE"){
         return new Square();
      }else{
         return null;
      }
   }
   public Color getColor(String color) {  
      return null;
   }
}
class ColorFactory extends AbstractFactory {
   public Color getColor(String color) {       
      if(color.equalsIgnoreCase("RED")){
         return new Red();
      } else if(color.equalsIgnoreCase("GREEN")){
         return new Green();
      }else{
         return null;
      }
   }
   public Shape getShape(String in){ 
      return null;
   }
}

//AbstractA
interface Shape {   
   public void draw();
}
class Square implements Shape {
   public void draw() {
      System.out.println("Inside Square::draw()");}
}
class Circle implements Shape {
   public void draw() {
      System.out.println("Inside Circle::draw()");}
}
//AbstractB
interface Color {
   void fill();
}
class Red implements Color {
   public void fill() {
      System.out.println("Inside Red::fill()");}
}
class Green implements Color {
   public void fill() {
      System.out.println("Inside Green::fill()");}
}


public class main {
   public static void main(String[] args) {
      AbstractFactory shape = new ShapeFactory();
      shape.getShape("CIRCLE").draw();
      shape.getShape("SQUARE").draw();
      AbstractFactory color = new ColorFactory();
      color.getColor("RED").fill();
      color.getColor("Green").fill();
   }
}
