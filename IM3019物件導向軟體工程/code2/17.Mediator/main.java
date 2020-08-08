//colleague
class User {
   public static void show(String name, String message){
      System.out.println(" [" + name +"] : " + message);
   }
}
//mediator
class Room { 
   private String name;
   public  Room(String name){
      this.name  = name;
   }
   public void send(String message){
      User.show(name,message);    //this will catch who
   }
}
//client
public class main {
   public static void main(String[] args) {
      Room robert = new Room("Robert");
      Room john = new Room("John");
      robert.send("Hi! John!");
      john.send("Hello! Robert!");
   }
}

