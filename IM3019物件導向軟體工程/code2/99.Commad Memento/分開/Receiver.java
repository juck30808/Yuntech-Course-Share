package Memento_Command;

public class Receiver {
	public caretaker care;
	public originator orig;
	public String text;
	
	public Receiver(originator orig) {
		care = new caretaker();
		care.addMemento(orig.storeInMemento());
		this.orig = orig;
	}
	
	public void save(String text) {
		orig.setText(text);
		care.addMemento(orig.storeInMemento());
	}
	
	public String undo(int current) {
		System.out.println("Receiver do undo~~~ " + current);
		text = orig.restoreMemento(care.getMemento(current));
		return text;
	}
	
	public String redo(int current) {
		System.out.println("Receiver do redo~~~ " + current);
		text = orig.restoreMemento(care.getMemento(current));
		return text;
	}
}
