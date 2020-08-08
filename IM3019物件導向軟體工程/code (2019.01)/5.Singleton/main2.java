class SingleObject {
   private static SingleObject instance = null;
   private SingleObject(){}   
   public static SingleObject getInstance(){
      if(instance == null){
         instance = new SingleObject();
      }
      return instance;
   }
   public void showMessage(){
      System.out.println("Hello World!");
   }
}

public class main2 {
   public static void main(String[] args) {
      //SingleObject object = new SingleObject();              //because of private error
      //SingleObject object = new SingleObject.getInstanc();   //because of can't find symbol
      //SingleObject object = SingleObject();                  //because of can't find symbol
      SingleObject object = SingleObject.getInstance();        //it is static so we don't need new
      object.showMessage();
   }
}

