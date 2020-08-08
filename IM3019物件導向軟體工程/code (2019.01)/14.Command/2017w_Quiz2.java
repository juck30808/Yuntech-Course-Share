class Light { 
    public void on() {  
        System.out.println("Light is on");  }
     
    public void off() {  
        System.out.println("Light is off");  }
}

class GarageDoor {   
    public void up() {  
        System.out.println("Garage Door is Open");  }
  
    public void down() {  
        System.out.println("Garage Door is Closed");  }
  
    public void stop() {  
        System.out.println("Garage Door is Stopped");  }
  
    public void lightOn() {  
        System.out.println("Garage light is on");  }
  
    public void lightOff() {  
        System.out.println("Garage light is off");  }
    public void Off() {  
        System.out.println("Garage Door is off");  }
}


interface Command { 
    public void execute();  
}  

class GarageDoorOpenCommand implements Command {  
     //Have its suitable receiver
    GarageDoor garageDoor;  
     //Specify the Constructor
    public GarageDoorOpenCommand (GarageDoor garageDoor) { 
        this.garageDoor = garageDoor;  
    }  
    //Execute the garageDoor.up() function
    public void execute() { 
        garageDoor.up();  
    }  
  
} 
//Then describe the LightOnCommand implements Command
class LightOnCommand implements Command {  
    Light light;  
    public LightOnCommand (Light light) {  
        this.light = light;  
    }  
    public void execute() {  
        light.on();  
    }  
  
}  

class SimpleRemoteControl {
    Command slot;  
    public SimpleRemoteControl() {}  

   //Describe the important function of the invoker
    public void setCommand(Command command) {  
        this.slot = command;  
    }  
      
    public void buttonWasPressed() {  
        slot.execute();  
    }  
}  

public class 2017w_Quiz2{
   public static void main(String[] args) {
      SimpleRemoteControl remote = new SimpleRemoteControl();
      
      Light light = new Light();
      GarageDoor garageDoor =  new GarageDoor();
      
      LightOnCommand lightOn = new LightOnCommand(light);
      GarageDoorOpenCommand garageOpen = new GarageDoorOpenCommand(garageDoor);
      
      remote.setCommand(lightOn);
      remote.buttonWasPressed();
      remote.setCommand(garageOpen);
      remote.buttonWasPressed();
   }
}
