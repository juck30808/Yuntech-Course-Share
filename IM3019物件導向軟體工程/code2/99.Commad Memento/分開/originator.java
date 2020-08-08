package Memento_Command;

public class originator {
	//會有create memento 的方法
	//存取memento 內部的所有資料
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
