//different with GOF
//EagerSingleton

class SingleObject {
   private static SingleObject instance = new SingleObject();

   private SingleObject(){
      //do some...
   }
   public static SingleObject getInstance(){
      return instance;
   }
}

public class main {
   public static void main(String[] args) {
      SingleObject object = SingleObject.getInstance();
   }
}

