//dong k
class Box {
	private Command openCommand;
	private Command resetCommand;
	public void setopenCommand(Command command){
		this.openCommand=command;
	}
	public void setrestCommand(Command command){
		this.resetCommand=command;
	}
	public void openButtonPressed(){
		openCommand.execute();
	}
	public void restButtonPressed(){
	    resetCommand.execute();
	}
}

interface Command {
	public void execute();
}
class OpenCommand implements Command{
	private Board b;
	public OpenCommand(Board b){
		this.b=b;
	}
	public void execute(){
		b.open();
	}
}
class ResetCommand implements Command {
	private Board b;
	public ResetCommand(Board b){
	    this.b=b;
	}
	public void execute(){
	    b.reset();
	}
    
}

class Board {
	public void open(){
		System.out.println("board is opening...");
	}
	public void reset(){
		System.out.println("board is reseting...");
	}
}

public class main2 {
	public static void main(String[] args) {
		Board b=new Board();
		OpenCommand openCommand=new OpenCommand(b);
		ResetCommand restcommand = new ResetCommand(b);
		Box box=new Box();
		box.setopenCommand(openCommand);
		box.openButtonPressed();
		
		box.setrestCommand(restcommand);
		box.restButtonPressed();
	}
}

