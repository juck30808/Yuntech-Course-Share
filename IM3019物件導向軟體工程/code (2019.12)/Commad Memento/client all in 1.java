import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import javax.swing.*;

class Invoker {
	public Command command;
	public void setCommand(Command command) {
		this.command = command;
	}
	public String run() {
		return command.execute();
	}
	public void setText(String text) {
		command.setText(text);
	}
	public void setCurrentNumber(int number) {
		command.setCurrentNumber(number);
	}
}

abstract class Command {
	protected String text;
	protected int current;
	public abstract String execute();
	public void setText(String text) {
		this.text = text;
	}
	public void setCurrentNumber(int number) {
		this.current = number;
	}
}
class RedoCommand extends Command{
	public Receiver re;
	public RedoCommand(Receiver re) {
		this.re = re;
	}
	public String execute() {
		return re.redo(current);
	}
}
class SaveCommand extends Command{
	public Receiver re;
	public SaveCommand(Receiver re) {
		this.re = re;
	}
	public String execute() {
		re.save(text);
		return null;
	}
}
class UndoCommand extends Command{
	public Receiver re;
	public UndoCommand(Receiver re) {
		this.re = re;
	}
	public String execute() {
		return re.undo(current);
	}
}

class Receiver {
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

class memento {
	public String text;
	public memento(String text) {
		this.text = text;
	}
	public String getText() {
		return this.text;
	}
}

class originator {
	public String text;
	public void setText(String text) {
		this.text = text;
	}
	public memento storeInMemento() {
		System.out.println("store in memento ~");
		return new memento(text);
	}
	public String restoreMemento(memento m) {
		text = m.getText();
		return text;
	}
}

class caretaker {
	ArrayList<memento> array = new ArrayList<memento>();
	public void addMemento(memento m) {
		array.add(m);
	}
	public memento getMemento(int index) {
		return array.get(index);
	}
}
