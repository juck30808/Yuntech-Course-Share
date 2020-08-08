class Invoker{
   private Command c;
   public void set(Command c){ 
      this.c = c;
   }  
   public void run(){
      c.execute();
   }
}

interface Command{
   public void execute();
}

class ConCommand implements Command{
   private Receiver r ;
   public ConCommand(Receiver r){
      this.r = r;
   }
   public void execute(){
      r.on();
   }
}

class Receiver{
   public void on(){
      System.out.println("light on");
   }
}

public class main{
   public static void main(String[] args) {
      Receiver r = new Receiver();
      Command c = new ConCommand(r);
      Invoker i = new Invoker();
      
      i.set(c);
      i.run();
   }
}

