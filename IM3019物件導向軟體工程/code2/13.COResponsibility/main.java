abstract class Helper{
	public abstract void help(int m);
	Helper next;
	Helper(Helper next){
		this.next=next;
	}
	public void doNext(int m){
		if(next !=null){
			next.help(m);
		}
	}
}

class h_10 extends Helper{
	public h_10(Helper next){
		super(next); }
	public void help(int m){
		if(m>=10){
			System.out.println("10 = "+(m/10));
		}
		doNext(m%10);
	}
}

class h_1 extends Helper{
	public h_1(Helper next){
		super(next); }
	public void help(int m){
		if(m>=1){
			System.out.println("1 = "+(m/1));
		}
		doNext(m%1);
	}
}

public class main{
	public static void main(String[] args) {
	Helper h=new h_10(new h_1(null));
	h.help(1234);	
	}
}