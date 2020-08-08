//Product
interface Product {
    public void product();
}
class IceCream implements Product {
    public void product() {
        //...
        System.out.println("this is ice cream")
    }
}
class Pizza implements Product {
    public void product() {
        //...
        System.out.println("this is pizza")
    }
}

//Creator
interface Factory {   
    public Product p();
}
class IceCreamFactory implements Factory {
    public Product p() {
        return new IceCream();
    }
}
class PizzaFactory implements Factory {
    public Product p() {
        return new Pizza();
    }
}



public class main {
    public static void main(String[] args){
        Factory iceCreamFactory = new IceCreamFactory();
        iceCreamFactory.p().Product();

        Factory pizzaFactory = new PizzaFactory();
        pizzaFactory.p ().Product();
    }
}




