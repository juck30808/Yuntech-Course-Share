//Creator
interface Factory{
   public Shape getShape(String shapeType);
} 
class ShapeFactory implements Factory {
   public Shape getShape(String shapeType){       
      if(shapeType =="CIRCLE"){
         return new Circle();
      } else if(shapeType =="RECTANGLE"){
         return new Rectangle();
      } else if(shapeType == "SQUARE"){
         return new Square();
      }
      return null;
   }
}

//Product 
interface Shape {
   void draw();
}
class Rectangle implements Shape {
   public void draw() {
      System.out.println("Inside Rectangle::draw() method.");}
}
class Square implements Shape {
   public void draw() {
      System.out.println("Inside Square::draw() method.");}
}
class Circle implements Shape {
   public void draw() {
      System.out.println("Inside Circle::draw() method.");}
}

public class main2 {
   public static void main(String[] args) {
      ShapeFactory shapeFactory = new ShapeFactory();
      shapeFactory.getShape("CIRCLE").draw();
      shapeFactory.getShape("RECTANGLE").draw();
      shapeFactory.getShape("SQUARE").draw(); 
   }
}

