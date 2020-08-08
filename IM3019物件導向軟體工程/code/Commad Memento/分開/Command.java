package Memento_Command;

public abstract class Command {
	protected String text;
	protected int current;
	
	public void setText(String text) {
		this.text = text;
	}
	
	public void setCurrentNumber(int number) {
		this.current = number;
	}
	
	public abstract String execute();
}
