import java.util.Iterator;

class Shape {
	private int id;
	private String name;
	public Shape(String name){
		this.name = name;}
	public String getName() {
		return name;}
	public void setName(String name) {
		this.name = name;}
	public String toString(){
		return " Shape: "+name;}
}

class ShapeStorage {
	private Shape[] shapes = new Shape[5];
	private int index;
	public void addShape(String name){
		int i = index++;
		shapes[i] = new Shape(name);
	}
	public Shape[] getShapes(){
		return shapes;
	}
}

class ShapeIterator implements Iterator<Shape>{
	private Shape[] shapes;
	int index;
	public ShapeIterator(Shape[]shapes){
		this.shapes = shapes;
	}
	public boolean hasNext() {
		if(index >= shapes.length)
			return false;
		return true;
	}
	public Shape next() {
		return shapes[index++];
	}
}

public class main {
	public static void main(String[] args) {
		ShapeStorage storage = new ShapeStorage();
 		storage.addShape("Polygon");
		storage.addShape("Hexagon");
		storage.addShape("Circle");
		storage.addShape("Rectangle");
		storage.addShape("Square");
		
		ShapeIterator iterator = new ShapeIterator(storage.getShapes());
		while(iterator.hasNext()){
			System.out.println(iterator.next());
		}
	}

}
/*
Result:
ID: 0 Shape: Polygon
ID: 1 Shape: Hexagon
ID: 2 Shape: Circle
ID: 3 Shape: Rectangle
ID: 4 Shape: Square
Apply removing while iterating...
ID: 0 Shape: Polygon
ID: 2 Shape: Circle
ID: 4 Shape: Square
*/
