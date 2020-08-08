class SingleObject {
   private static SingleObject instance = new SingleObject();
   private SingleObject(){}    //if public = then single = new single()
   public static SingleObject getInstance(){
      return instance;
   }
   public void showMessage(){
      System.out.println("Hello World!");
   }
}

public class main {
   public static void main(String[] args) {
      //SingleObject object = new SingleObject();              //because of private error
      //SingleObject object = new SingleObject.getInstanc();   //because of can't find symbol
      //SingleObject object = SingleObject();                  //because of can't find symbol
      SingleObject object = SingleObject.getInstance();        //it is static so we don't need new
      object.showMessage();
   }
}

