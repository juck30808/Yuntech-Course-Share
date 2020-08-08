class SimpleRemoteControl { //invoker
    private Command c;  
    
    public void setCommand(Command c) {  
        this.c = c;  
    }  
    public void buttonWasPressed() {  
        c.execute();  
    }  
}  

interface Command { 
    public void execute();  
}  
class DoorOpenCommand implements Command {  
    private Door door;  

    public DoorOpenCommand (Door door) { 
        this.door = door;  
    }  
    public void execute() { 
        door.up();  
    }  
} 
class LightOnCommand implements Command {  
    private Light light; 

    public LightOnCommand (Light light) {  
        this.light = light;  
    }  
    public void execute() {  
        light.on();  
    }  
  
}  

class Light {  //Receiver
    public void on() {  
        //...
    }     
    public void off() {  
        //...
    }
}

class Door {   //Receiver
    public void up() {  
        //...
    }
    public void down() {  
        //...
    }
}

public class 2017w_Quiz2{
   public static void main(String[] args) {
      SimpleRemoteControl remote = new SimpleRemoteControl();
      
      Light light = new Light();
      Door door =  new Door();
      
      LightOnCommand lightOn = new LightOnCommand(light);
      DoorOpenCommand doorOpen = new DoorOpenCommand(door);
      
      remote.setCommand(lightOn);
      remote.buttonWasPressed();
      remote.setCommand(doorOpen);
      remote.buttonWasPressed();
   }
}

