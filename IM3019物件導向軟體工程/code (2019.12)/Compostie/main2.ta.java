 import java.util.ArrayList;

abstract class Component {
	public void addComponent(Component c) {
		throw new UnsupportedOperationException();
	}
	public abstract void print();
}
class Composite extends Component {
	private String name = null;
	private ArrayList<Component> productList 
		= new ArrayList<>();
	
	public Composite(String name) {
		this.name = name;
	}
	public void addComponent(Component c) {
		productList.add(c);
	}
	public void print() {
		//...
		for(Component product : productList) {
			product.print();}
	}
}
class Leaf extends Component {
	private String leafName = null;
	
	public Leaf(String leafName) {
		this.leafName = leafName;
	}
	public void print() {
		//...
	}
}
public class TransparencyMain {
	public static void main(String[] args) {
		Component asus = new Composite("Asus");
		asus.addComponent(new Leaf("ROG phone"));
		asus.addComponent(new Leaf("Zen phone"));
		Component sony = new Composite("Sony");
		sony.addComponent(new Leaf("Sony ZX"));
		sony.addComponent(new Leaf("Sony Z1"));
	}
}
