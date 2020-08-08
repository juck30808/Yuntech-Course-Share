package Memento_Command;

import java.util.ArrayList;

public class caretaker {
	//並不會直接存取memento 是透過origenator間接性的去存取的
	//只存memento
	//傳遞memento 給其他物件
	
	ArrayList<memento> array = new ArrayList<memento>();
	
	public void addMemento(memento m) {
		array.add(m);
	}
	
	public memento getMemento(int index) {
		return array.get(index);
	}
}
