abstract class Abstraction {
    Implementor imp;
    public Abstraction(Implementor imp) {
        this.imp = imp;
    }
    public abstract void operation();
}
class RefinedAbs extends Abstraction {
    public RefinedAbs(Implementor impl) {
        super(impl);
    }
    public void operation() {
        imp.operationImpl();
    }
}

interface Implementor {
    public void operationImpl();
}
class ImpA implements Implementor {
    public void operationImpl() {
        System.out.println("operation A");
    }
}
class ImpB implements Implementor {
    public void operationImpl() {
        System.out.println("operation B");
    }
}

public class main2 {
    public static void main(String[] args) {
        Implementor impl = new ImpA();
        Abstraction abs = new RefinedAbs(impl);
        abs.operation();
    }
}
