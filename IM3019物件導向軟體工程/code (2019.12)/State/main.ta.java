class Context {
	private TCPState ts;
	
	public Context() { 
		this.ts = new TCPClosed();
	}
	public void set(TCPState ts) {
		this.ts = ts;
	}
	public void open() {
		ts.open(this);
	}
	public void close() {
		ts.close(this);
	}
	public void knowledge() {
		ts.knowledge(this);
	}
}

interface TCPState {
	public void open(Context tc);
	public void close(Context tc);
	public void knowledge(Context tc);
}

class TCPClosed implements TCPState {
	public void open(Context tc) {
		tc.set(new TCPListen()); //開始連線
	}
	public void close(Context tc) {} //"已關閉!"
	public void knowledge(Context tc) {}//"已關閉!請先開啟連線"
}

class TCPListen implements TCPState {
	public void open(Context tc) {}//"連線中..."
	public void close(Context tc) {
		tc.set(new TCPClosed()); //"中斷連線"
	}
	public void knowledge(Context tc) {
		tc.set(new TCPing()); //"連線成功!"
	}
}

class TCPing implements TCPState {
	public void open(Context tc) {}//"已連線!"
	public void close(Context tc) {
		tc.set(new TCPClosed()); //"斷開連線"
	}
	public void knowledge(Context tc) {}//"已在連線狀態!!"
}

public class StateDemo {
	public static void main(String[] args) {
		Context tc = new Context();
	
		tc.open();
		tc.knowledge();
		tc.close();
	}
}
 