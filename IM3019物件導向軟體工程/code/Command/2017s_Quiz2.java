interface Command{
  //all
  public void execute();
  public void undo(); 
}

class ShutDownCommand implements Command{
  Receiver receiver; //
  public ShutDownCommand(Receiver receiver){  //(___)
    //all
    this.receiver = receiver;

  }
  public void execute(){
    receiver.connect();
    receiver.shutdown();
    receiver.disconnect();
    //System.out.println();
  }
  public void undo(){
    //all
    receiver.diagnostics();
    receiver.reboot();
    //System.out.println();
  }
}

interface Receiver{
  //The receiver is going to implement the command
  public void connect();
  public void diagnostics();
  public void shutdown();
  public void reboot();
  public void disconnect();
}

class AsiaServer implements Receiver{
  public AsiaServer(){
  }
  public void connect(){
    System.out.println("connect");
  }
  public void diagnostics(){
    System.out.println("diagnostics");
  }
  public void shutdown(){
    System.out.println("shutdown");
  }
  public void reboot(){
    System.out.println("reboot");
  }
  public void disconnect(){
    System.out.println("disconnect");
  }
}

class Invoker{
  Command commands[] = new Command[5];
  int position;
  public Invoker(){
    position = -1;
  }
  public void setCommand(Command c){
    if(position < commands.length -1){
      position++;
      commands[position]=c;
    }else{
      for(int loopIndex = 0; loopIndex<commands.length -2; loopIndex++){
        commands[loopIndex]=commands[loopIndex+1];
      }
      commands[commands.length-1]=c;
    }
  }
  public void run(){
    commands[position].execute();
  }
  public void undo(){
    if(position==0){
      commands[position].undo();
    }
    position--;
  }
}

public class Quiz2{
  public static void main(String[] args) {
    Quiz2 t = new Quiz2();
  }
  public Quiz2(){
    //Create an Invoker
    Invoker i = new Invoker();
    //Create an Asia receiver object
    Receiver r = new AsiaServer();
    //1.Create shutdown,run,diagnostics and reboot commands with Asia server;
    Command c = new ShutDownCommand(r);   
    //2.run the invoker for shutdown and reboot commands 
    i.setCommand(c);
    i.run();
    
    //3.undo the previous two commands.
    i.undo();
    //4.print out the result   
  }
}



