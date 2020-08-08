package Memento_Command;

public class UndoCommand extends Command{
	public Receiver re;
	
	public UndoCommand(Receiver re) {
		this.re = re;
	}
	
	@Override
	public String execute() {
		return re.undo(current);
	}
}