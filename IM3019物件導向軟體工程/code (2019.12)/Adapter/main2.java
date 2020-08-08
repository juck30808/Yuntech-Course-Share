interface DC5 { //Target 
    public void method1();
    public void method2();
}
class Adapter implements DC5 {
    AC200 ac200;
    public Adapter(AC200 ac200){
        super();
        this.ac200 = ac200;
    }      
    public void method1() {
        ac200.method1();
    }
    public void method2() {
        System.out.println("this is the targetable!");}
}

class AC200 {
    public void method1() {
        System.out.println("this is original!");}
}

public class main2 {
    public static void main(String[] args) {
    AC200 ac200 = new AC200();
    DC5 target = new Adapter(ac200);
    target.method1();
    target.method2();
    }
}

