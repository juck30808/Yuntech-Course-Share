//1226 library
class Invoker{
	private Command C;
	public void set(Command c){ //no return 
		this.c = c;
	}  
	public void run(){
		c.execute();
	}
}


interface Command{  //implement form conCommand
	public void execute(); 
}

class ConcreteCommand implements Command{
	private Receiver r;
	public ConcreteCommand(Receiver r){
		this.r = r;
	}
	public void execute(){
		r.doing(); //do someting
	}
}


class Receiver{
	public void doing(){
		//do someting
		System.out.println("mother fucker");
	}
}

public class client{
	public static void main(String[] args) {
		Invoker i = new Invoker();
		Command c = new ConcreteCommand();
		Receiver r = new Receiver();
		i.set(c);
		i.run();
	}
}