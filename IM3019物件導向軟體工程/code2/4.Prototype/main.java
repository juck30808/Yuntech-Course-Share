interface Prototype{
	Prototype ShallowClone();
	Prototype DeepClone();
}
class Concrete implements Prototype{
	private int number;
	public void set(int n){
		number = n;
	}
	public int get(){
		return number;
	}
	public Prototype ShallowClone(){
		return this;
	}
	public Prototype DeepClone(){
		Prototype clone = new Concrete();
		((Concrete)clone).set(number);
		return clone;
	}
}

public class main{
	public static void main(String[] args) {
		Concrete o = new Concrete();
		o.set(5);
		Concrete shallow = (Concrete)o.ShallowClone();
		Concrete deep = (Concrete)o.DeepClone();
		System.out.println("before..");
		System.out.println("Prototype:"+o.get()
			+"   ShallowClone:"+shallow.get()
			+"   DeepClone:"+deep.get());

		o.set(10);
		System.out.println("After..");
		System.out.println("Prototype:"+o.get()
			+"   ShallowClone:"+shallow.get()
			+"   DeepClone:"+deep.get());
	}
}
