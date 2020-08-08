import java.util.ArrayList;

class Originator {
	private String state;
	
	public void Originator (String state) {
		this.state = state;
	}
	public void restoreFromMemento(Memento m) {
		this.state = m.getState();
	}
	public Memento save() {
		return new Memento(state);
	}
}

class CareTaker {
	private ArrayList<Memento> list 
		= new ArrayList<>();
	
	public void add(Memento m) {
		list.add(m);
	}
	public Memento get(int index) {
		return list.get(index);
	}
} 

class Memento {
	private String state;
	
	public Memento(String state) {
		this.state = state;
	}
	public String getState() {
		return this.state;
	}
}

public class MementoDemo {
	public static void main(String[] args) {
		CareTaker care = new CareTaker();
		Originator o = new Originator();

		o.setState("state1");
		care.add(o.save());
		o.setState("state2");
		care.add(o.save());
		
		o.restoreFromMemento(care.get(1));
	}
}

