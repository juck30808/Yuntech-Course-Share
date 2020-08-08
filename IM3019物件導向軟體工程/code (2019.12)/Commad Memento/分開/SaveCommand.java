package Memento_Command;

public class SaveCommand extends Command{
	public Receiver re;
	
	public SaveCommand(Receiver re) {
		this.re = re;
	}
	
	@Override
	public String execute() {
		re.save(text);
		return null;
	}
}
