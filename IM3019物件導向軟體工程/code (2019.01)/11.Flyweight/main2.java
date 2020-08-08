import java.util.*;
import java.util.Iterator;
import java.util.Hashtable;

class WebSiteFactory{
	private Hashtable flyweights = new Hashtable();
	public WebSite get(String key){
		WebSite flyweight = (flyweights.get(s));

		if(flyweight == null){
			flyweight = new ConFlyweight(s);
		}
		return flyweights;
	}
}

interface WebSite{
	public void User(Stirng s);
}

class ConcreteWebSite implements WebSite{
	private String name;
	public ConcreteWebSite(String name){
		this.name = name;
	}
	public void User(String s){
		System.out.println(s);
	}
}



public class main2{
	static void Main(string[] args){
		WebSiteFactory f = new WebSiteFactory();
		WebSite fx = f.get("demo");
		fx.operation("Jerry");
	}
}