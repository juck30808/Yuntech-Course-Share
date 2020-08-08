import java.util.HashMap;

class FlyweightFactory {
	public static Flyweight flyweight;
	public static HashMap<String, Flyweight> list 
		=new HashMap<>();

	public static Flyweight get(String name) {
		 if(list.containsKey(name)) { // if(list = name)
		    flyweight = list.get(name);
		 } else {
		    flyweight = new ConFlyweight(name);
		 }
		 list.put(name, flyweight);
		 return flyweight;
	}
}

abstract class Flyweight {
	private String in;
	private String name;

	public abstract void do(int num);
	public Flyweight(String name) {
		this.name = name;
	}
	public void setin(String in) {
		this.in = in;
	}
	public String getin() {
		return in;
	}
}

class ConFlyweight extends Flyweight{
	public ConFlyweight(String name) {		
		super(name);
	}
	public void do(int num) {
		//...
	}
}

public class test {
 public static void main(String[] args) {
	 int num = 22;
     Flyweight x = FlyweightFactory.get("X");
     Flyweight y = FlyweightFactory.get("Y");
     Flyweight z = FlyweightFactory.get("Z");
     }
}

