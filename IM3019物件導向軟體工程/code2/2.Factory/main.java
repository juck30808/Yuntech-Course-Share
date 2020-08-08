interface Factory {   
    public Product factory();
}
class IceCreamFactory implements Factory {
    public Product factory() {
        return new IceCream();
    }
}
class PizzaFactory implements Factory {
    public Product factory() {
        return new Pizza();
    }
}

interface Product {
    public void product();
}
class IceCream implements Product {
    public void product() {
        System.out.println("Ice Cream is made!");
    }
}
class Pizza implements Product {
    public void product() {
        System.out.println("Pizza is made!");
    }
}

public class main {
    public static void main(String[] args){
        Factory factory;
        factory = new IceCreamFactory();
        factory.factory().product();

        factory = new PizzaFactory();
        factory.factory().product();
    }
}




