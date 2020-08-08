class Level {
	private int level = 0;
	public Level(int level){
		this.level = level;
	};
	
	public boolean above(Level level){
		if(this.level >= level.level){
			return true;
		}
		return false;
	}
}
 
class Request {
	Level level;
	public Request(Level level){
		this.level = level;
	}
	
	public Level getLevel(){
		return level;
	}
}
 
class Response {
 
}
 
abstract class Handler {
	private Handler nextHandler;	
	public final Response handleRequest(Request request){
		Response response = null;
		
		if(this.getHandlerLevel().above(request.getLevel())){
			response = this.response(request);
		}else{
			if(this.nextHandler != null){
				this.nextHandler.handleRequest(request);
			}else{
				System.out.println("-----没有合适的处理器-----");
			}
		}
		return response;
	}
	public void setNextHandler(Handler handler){
		this.nextHandler = handler;
	}
	protected abstract Level getHandlerLevel();
	public abstract Response response(Request request);
}
 
class ConcreteHandler1 extends Handler {
	protected Level getHandlerLevel() {
		return new Level(1);
	}
	public Response response(Request request) {
		System.out.println("-----请求由处理器1进行处理-----");
		return null;
	}
}
 
class ConcreteHandler2 extends Handler {
	protected Level getHandlerLevel() {
		return new Level(3);
	}
	public Response response(Request request) {
		System.out.println("-----请求由处理器2进行处理-----");
		return null;
	}
}
 
class ConcreteHandler3 extends Handler {
	protected Level getHandlerLevel() {
		return new Level(5);
	}
	public Response response(Request request) {
		System.out.println("-----请求由处理器3进行处理-----");
		return null;
	}
}
 
public class Client {
	public static void main(String[] args){
		Handler handler1 = new ConcreteHandler1();
		Handler handler2 = new ConcreteHandler2();
		Handler handler3 = new ConcreteHandler3();
 
		handler1.setNextHandler(handler2);
		handler2.setNextHandler(handler3);
		
		Response response = handler1.handleRequest(new Request(new Level(4)));
	}
}
