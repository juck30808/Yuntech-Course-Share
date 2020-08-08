class Director{
    Builder b;
    public Director(Builder b){
        this.b = b;
    }
    public Product construct(){  //How to do
        b.step1();
        b.step2();
        return b.finished();
    }
}

interface Builder {
    public void step1();   //step1
    public void step2();   //step2
    public Product finished();  //finished
}
class BuilderA implements Builder {
    Product p = new Product();
    public void step1() {
        p.setPart1("#1");
    }
    public void step2() {
        p.setPart2("#2");
    }
    public Product finished() {
        System.out.println("#build it");
        return p;
    }
}

class Product {
    private String part1;
    private String part2;
    public void setPart1(String part1) {
        this.part1 = part1;
    }
    public void setPart2(String part2) {
        this.part2 = part2;
    }
}

public class main2{
    public static void main(String[] args) {
        Builder builderA = new BuilderA();
        Director director = new Director(builderA);
        director.construct(); 
    }
}


