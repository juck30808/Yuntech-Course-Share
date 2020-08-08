//different with GOF
//LazySingleton

class SingleObject {
   private static SingleObject instance = null;

   private SingleObject(){
        //do some..
   }   
   public static SingleObject getInstance(){
      if(instance == null){
         instance = new SingleObject();
      }
      return instance;
   }
}

public class main2 {
   public static void main(String[] args) {
      SingleObject object = SingleObject.getInstance(); 
   }
}

