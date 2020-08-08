abstract class Component {
    public abstract String operation();
}
class ConComponent extends Component {
    public String operation() {
        return "operation:";
    }
}
abstract class Decorator extends Component {
    Component c;
    public Decorator(Component c) {
        this.c = c;
    }
    public String operation() {
        return c.operation();
    }
}
class DecoratorA extends Decorator {
    public DecoratorA(Component c) {
        super(c);
    }
    public String operation() {
        return super.operation() + "+addA";
    }
}
class DecoratorB extends Decorator {
    public DecoratorB(Component c) {
        super(c);
    }
    public String operation() {
        return super.operation() + "+addB";
    }
}

public class main {
    public static void main(String[] args) {
        Component c = new ConComponent();
        c = new DecoratorB(c);
        System.out.println(c.operation());
        c = new DecoratorA(c);
        c = new DecoratorA(c);
        System.out.println(c.operation());
    }
}
