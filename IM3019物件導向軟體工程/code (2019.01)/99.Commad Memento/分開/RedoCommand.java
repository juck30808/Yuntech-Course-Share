package Memento_Command;

public class RedoCommand extends Command{
	public Receiver re;
	
	public RedoCommand(Receiver re) {
		this.re = re;
	}
	
	@Override
	public String execute() {
		return re.redo(current);
	}
}