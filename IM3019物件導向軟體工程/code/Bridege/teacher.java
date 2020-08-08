Bridge Pattern Example: Car Remote Controller

Class: Car

package car.remotecontrol;

public abstract class Car {

	private final Product product;
	private final String carType;
	
	public Car(Product product, String carType){
		this.product = product;
		this.carType = carType;
	}
	
	public abstract void assemble();
	public abstract void produceProduct();
	
	public void printDetails(){
		System.out.println("Car: "+carType+", Product:"+product.productName());
	}
}

Class: Motoren

package car.remotecontrol;

public class Motoren extends Car{

	private final Product product;
	private final String carType;
	
	public Motoren(Product product, String carType) {
		super(product, carType);
		this.product = product;
		this.carType = carType;
	}

	@Override
	public void assemble() {
		System.out.println("Assembling "+product.productName()+" for "+carType);
	}

	@Override
	public void produceProduct() {
		product.produce();
		System.out.println("Modifing product "+product.productName()+" according to "+carType);
	}

}


Class: BigWheel

package car.remotecontrol;

public class BigWheel extends Car{

	private final Product product;
	private final String carType;
	
	public BigWheel(Product product, String carType) {
		super(product, carType);
		this.product = product;
		this.carType = carType;
	}

	@Override
	public void assemble() {
		System.out.println("Assembling "+product.productName()+" for "+carType);
	}

	@Override
	public void produceProduct() {
		product.produce();
		System.out.println("Modifing product "+product.productName()+" according to "+carType);
	}

}


Interface: Product

package car.remotecontrol;

public interface Product {
	
	public String productName();
	public void produce();
}


Class: GearLocking

package car.remotecontrol;

public class GearLocking implements Product{

	private final String productName;
	
	public GearLocking(String productName){
		this.productName = productName;
	}
	
	@Override
	public String productName() {
		return productName;
	}

	@Override
	public void produce() {
		System.out.println("Producing Gear Locking System");
	}

}

Class: CentralLocking

package car.remotecontrol;

public class CentralLocking implements Product{

	private final String productName;
	
	public CentralLocking(String productName){
		this.productName = productName;
	}
	
	@Override
	public String productName() {
		return productName;
	}

	@Override
	public void produce() {
		System.out.println("Producing Central Locking System");
	}

}

Class: TestBridgePattern

package car.remotecontrol;

public class TestBridgePattern {

	public static void main(String[] args) {
		Product product = new CentralLocking("Central Locking System");
		Product product2 = new GearLocking("Gear Locking System");
		Car car = new BigWheel(product , "BigWheel xz model");
		car.produceProduct();
		car.assemble();
		car.printDetails();
		
		System.out.println();
		
		car = new BigWheel(product2 , "BigWheel xz model");
		car.produceProduct();
		car.assemble();
		car.printDetails();
		
		System.out.println("-----------------------------------------------------");
		
		car = new Motoren(product, "Motoren lm model");
		car.produceProduct();
		car.assemble();
		car.printDetails();
		
		System.out.println();
		
		car = new Motoren(product2, "Motoren lm model");
		car.produceProduct();
		car.assemble();
		car.printDetails();
		
	}

}

Result:
Producing Central Locking System
Modifing product Central Locking System according to BigWheel xz model
Assembling Central Locking System for BigWheel xz model
Car: BigWheel xz model, Product:Central Locking System

Producing Gear Locking System
Modifing product Gear Locking System according to BigWheel xz model
Assembling Gear Locking System for BigWheel xz model
Car: BigWheel xz model, Product:Gear Locking System
-----------------------------------------------------
Producing Central Locking System
Modifing product Central Locking System according to Motoren lm model
Assembling Central Locking System for Motoren lm model
Car: Motoren lm model, Product:Central Locking System

Producing Gear Locking System
Modifing product Gear Locking System according to Motoren lm model
Assembling Gear Locking System for Motoren lm model
Car: Motoren lm model, Product:Gear Locking System

