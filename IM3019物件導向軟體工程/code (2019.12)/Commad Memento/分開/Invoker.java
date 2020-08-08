package Memento_Command;

public class Invoker {
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
