import java.util.ArrayList;

interface Component {
	public void print();
}
class Composite implements Component {
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
class Leaf implements Component {
	private String productName = null;
	
	public Leaf(String productName) {
		this.productName = productName;
	}
	public void print() {
		//...
	}
}
public class SafetyMain {
	public static void main(String[] args) {
		Component asus = new Composite("Asus");
		((Composite)asus).addComponent(new Leaf("ROG phone"));
		((Composite)asus).addComponent(new Leaf("Zen phone"));
		Component sony = new Composite("Sony");
		((Composite)sony).addComponent(new Leaf("Sony ZX"));
		((Composite)sony).addComponent(new Leaf("Sony Z1"));
	}
}
