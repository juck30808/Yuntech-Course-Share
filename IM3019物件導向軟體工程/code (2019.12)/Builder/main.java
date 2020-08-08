class Director {
	private Builder Builder;
	
	public Director(Builder builder){
		this.builder = Builder;
	}
	public void build(){
		builder.cpu();
		builder.board();
	}
}
 
interface Builder {
	public void cpu();
	public void board();
	public Computer getComputer();
}

class ConBuiler implements Builder{
	Computer computer = new Computer();
	
	public void cpu() {
		computer.add("cpu-on");
	}
	public void board(){
		computer.add("board-on");
	}
	public Computer getComputer(){
		return computer;
	}
}

class Computer {
	public void add(String part){
		//...
	}
}

public class client {
	public static void main(String[] args) {
		//想要買電腦，找老板和技師
		Director director = new Director();
		Builder builder = new ConBuiler();
		//沟通需求后，老板叫装机人员去装电脑
		director.build();
		//装完后，组装人员搬来组装好的电脑
		Computer computer = builder.getComputer();
		System.out.println(Computer);
	}
}
