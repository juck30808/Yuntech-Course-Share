class Memento {
	private String state;
	public Memento(String state){
		this.state = state;
	}
	public String getState() {
		return state;
	}
}

class Originator {
	private String state;
	public void setState(String state) {
		this.state = state;
	}
	public String getState() {
		System.out.println("state:"+state);
		return state;
	}
	public Memento save(){
		System.out.println("save:"+state);
		return new Memento(this.state);
	}
	public void undo(Memento memento){
		this.setState(memento.getState());
		System.out.println("undo:"+state);
	}
}

class Caretaker {
	private Memento memento;
	public void setMemento(Memento memento){
		this.memento = memento;
	}
	public Memento getMemento(){
		return memento;
	}
}
public class main2 {
	public static void main(String[] args){
		Originator originator = new Originator();
		Caretaker caretaker = new Caretaker();

		originator.setState("State #1");;
		caretaker.setMemento(originator.save());
		originator.setState("State #2");
		originator.getState();
		
		originator.undo(caretaker.getMemento());
	}
}
