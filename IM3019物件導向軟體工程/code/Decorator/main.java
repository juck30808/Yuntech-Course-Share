interface Coffee {
    public double Cost(); 
    public String Product(); 
}

class SimpleCoffee implements Coffee {
    public double Cost() {
        return 1;
    }
    public String Product() {
        return "Coffee";
    }
}

abstract class Decorator implements Coffee {
    private final Coffee c;

    public Decorator(Coffee c) {
        this.c = c;
    }
    public double Cost() { 
        return c.Cost();
    }
    public String Product() {
        return c.Product();
    }
}

class WithMilk extends Decorator {
    public WithMilk(Coffee c) {
        super(c);
    }
    public double Cost() { 
        return super.Cost() + 0.5;
    }
    public String Product() {
        return super.Product() + ", Milk";
    }
}

class WithCake extends Decorator {
    public WithCake(Coffee c) {
        super(c);
    }
    public double Cost() {
        return super.Cost() + 0.2;
    }
    public String Product() {
        return super.Product() + ", Cake";
    }
}

public class Main {
    public static void main(String[] args) {
        Coffee c = new SimpleCoffee();

        c = new WithMilk(c);
        c = new WithCake(c);
    }
}
