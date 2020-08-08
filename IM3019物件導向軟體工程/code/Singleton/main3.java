//different with GOF
//Double-checked-locking

class SingleObject {
   private static SingleObject instance = null;

   private SingleObject(){
        //do some..
   }   
   public static SingleObject getInstance(){
      if(instance == null){
         synchronized(SingleObject.class){

            if(instance == null){
               instance = new SingleObject();
            }
         }
      }
      return instance;
   }
}

public class main3 {
   public static void main(String[] args) {
      SingleObject object = SingleObject.getInstance();  
   }
}

