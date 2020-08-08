//Mediator Pattern Example: Purchase


///* Complex parts*/ 
public class Purchase{
  Mediator mediator;

  public Purchase(Mediator m){
    mediator = m;
  }
  public void go(){
    //...
  }

public class Shop{
  Mediator mediator;

  public Shop(Mediator m){
    mediator = m;
  }
  public void go(){
    //...
}

public class Exit{
  Mediator mediator;

  public Exit(Mediator m){
    mediator = m;
  }
  public void go(){
    //...
  }
}

//Mediator
public class Mediator{
  Shop shop;
  Purchase purchase;
  Exit exit;

  public Mediator(){
    shop = new Shop(this);
    purchase = new Purchase(this);
    exit = new Exit(this);
  }

  public void handle(String state)
  {
    if(state.equals("welcome.shop")){
      shop.go();
    } else if(state.equals("shop.purchase")){
      purchase.go();
    } else if(state.equals("purchase.exit")){
      exit.go();
    } else if(state.equals("welcome.exit")){
      exit.go();
    } else if(state.equals("shop.exit")){
      exit.go();
    } else if(state.equals("purchase.exit")){
      exit.go();
    }
  }
}

public class TestMediator{
  public static void main(String args[]){
    TestMediator t = new TestMediator();
  }

  public TestMediator(){
    Mediator mediator = new Mediator();
    mediator.getWelcome().go();
  }
}

/*
Result:
Do you want to shop? [y/n]? y
Are you ready to purchase? [y/n]? y
Buy the item now? [y/n]? y
Thanks for your purchase.
Please come again sometime.

Do you want to shop? [y/n]? y
Are you ready to purchase? [y/n]? y
Buy the item now? [y/n]? n
Please come again sometime.

Do you want to shop? [y/n]? y
Are you ready to purchase? [y/n]? n
Please come again sometime.

Do you want to shop? [y/n]? n
Please come again sometime.

*/