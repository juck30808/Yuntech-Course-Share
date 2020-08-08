abstract class Breakfast {
    public String description;
    public String getDescription() {
        return description;
    }
    public abstract double cost();
}
class Toast extends Breakfast {
    public Toast() {
        description = "Toast :";
    }
    public double cost() {
        return 10;
    }
}
abstract class CondimentDecorator extends Breakfast {
    Breakfast breakfast;
}
class Cheese extends CondimentDecorator {
    public Cheese(Breakfast breakfast) {
        this.breakfast = breakfast;
    }
    public String getDescription() {
        return breakfast.getDescription() + "+Cheese ";
    }
    public double cost() {
        return 5 + breakfast.cost();
    }
}
class Ham extends CondimentDecorator {
    public Ham(Breakfast breakfast) {
        this.breakfast = breakfast;
    }
    public String getDescription() {
        return breakfast.getDescription() + "+Ham ";
    }
    public double cost() {
        return 10 + breakfast.cost();
    }
}

public class main2 {
    public static void main(String[] args) {
        Breakfast breakfast2 = new Toast();
        breakfast2 = new Ham(breakfast2);
        System.out.println("Order:" + breakfast2.getDescription() + 
            "," + "price:" + breakfast2.cost());
        
        Breakfast breakfast3 = new Toast();
        breakfast3 = new Ham(breakfast3);
        breakfast3 = new Cheese(breakfast3);
        System.out.println("Order:" + breakfast3.getDescription() + 
            "," + "price:" + breakfast3.cost());
    }
}

