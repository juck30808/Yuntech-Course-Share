abstract class Handler {
	private Handler h;

	public Handler(Handler h) {
		this.h = h;
	}
	public abstract void change(int money);
	public void doNext(int money) {
		h.change(money);
	}
}

class Thousand extends Handler {
	public Thousand(Handler h) {
		super(h);
	}
	public void change(int money) {
		int quantity = money / 1000;
		doNext(money%1000);
	}
}

class Hundred extends Handler {
	public Hundred(Handler h) {
		super(h);
	}
	public void change(int money) {
		int quantity = money / 100;
	}
}

public class CORMain {
	public static void main(String[] args) {
		Handler h = new Thousand(new Hundred(null));
		h.change(2800);
		h.change(5600);
	}
}

