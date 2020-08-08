//AbstractA
interface Shape {   
   public void draw();
}
class Square implements Shape {
   public void draw() {
      //...
   }
}
class Circle implements Shape {
   public void draw() {
      //...
   }
}

//AbstractB
interface Color {
   public void fill();
}
class Red implements Color {
   public void fill() {
      //...
   }
}
class Green implements Color {
   public void fill() {
      //...
   }
}


//AbstractFactory
interface AbstractFactory {    
   public Color c(String color); 
   public Shape s(String shape); 
}


class ColorFactory extends AbstractFactory {
   public Color c(String in){   
      switch (in) {
         case "RED": return new Red();
         case "GREEN": return new Green();
      }
      return  null;
   }
}
class ShapeFactory extends AbstractFactory {
   public Shape s(String in){   
      switch (in) {
         case "CIRCLE": return new Circle();
         case "SQUARE": return new SQUARE();
      }
      return  null;
}


public class main {
   public static void main(String[] args) {
      AbstractFactory shape = new ShapeFactory();
      shape.s("CIRCLE").draw();
      shape.s("SQUARE").draw();
      AbstractFactory color = new ColorFactory();
      color.c("RED").fill();
      color.c("Green").fill();
   }
}

