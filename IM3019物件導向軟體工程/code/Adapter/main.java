interface Target{
    public void request();
}
class Adapter implements Target{
    Adaptee tee;

    public Adapter(Adaptee tee){
        this.tee = tee;
    }      
    public void request(){
        tee.SpecificRequest();
    }
}

class Adaptee{
    public void SpecificRequest(){
        System.out.println("i am adaptee");
    }
}

public class main{
    public static void main(String[] args) {
        Adaptee adaptee = new Adaptee();
        Target target = new Adapter(adaptee);
        target.request();
    }
}


