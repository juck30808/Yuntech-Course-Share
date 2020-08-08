
import java.util.HashMap;

class FlyweightFactory {
	private HashMap<String, Shape> shapeList = new HashMap<>();
	private Shape sh = shapeList.get(shape);
	
	public Shape getShape(String shape) {
		if(sh == null) {
			switch(shape) {
				case "circle":
					sh = new Circle();
					break;
				case "square":
					sh = new Square();
					break;}
		}	
		shapeList.put(shape, sh);
		return sh;
	}
}

interface Shape {
	public void draw();
	public void setColor(String color);
}

class Square implements Shape {
	private String color;
	
	public void setColor(String color) {
		this.color = color;
	}
	public String getColor() {
		return this.color;
	}
	public void draw() { //... }
}

class Circle implements Shape {
	private String color;
	
	public void setColor(String color) {
		this.color = color;
	}
	public String getColor() {
		return this.color;
	}
	public void draw() { //... }
}

public class FlyweightDemo {
	public static void main(String[] args) {
		FlyweightFactory ff = new FlyweightFactory();	
		Shape s = ff.getShape("circle");
		Shape s2 = ff.getShape("square");
		s.setColor("Blue");
		s.draw();
	}
}
