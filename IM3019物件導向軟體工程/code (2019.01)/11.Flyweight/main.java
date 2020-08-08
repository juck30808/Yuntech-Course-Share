import java.util.*;
import java.util.Iterator;
import java.util.Hashtable;

class FlyweightFactory{
	private Hashtable flyweights = new Hashtable();
	public Flyweight get(String s){
		Flyweight flyweight = (Flyweight) flyweights.get(s);

		if(flyweight == null){
			flyweight = new ConFlyweight(s);
			//flyweight.add(s,flyweight);
		}
		return flyweight;
	}
}

interface Flyweight{
	public void operation(String s);
}

class ConFlyweight implements Flyweight{
	private String state;
	public ConFlyweight(String state){
		this.state=state;
	}
	public void operation(String s){
		System.out.println(s);
	}
}

public class main{
	public static void main(String[] args) {
		FlyweightFactory factory = new FlyweightFactory();
		Flyweight flyweight = factory.get("A");
		flyweight.operation("red");
	}
}

