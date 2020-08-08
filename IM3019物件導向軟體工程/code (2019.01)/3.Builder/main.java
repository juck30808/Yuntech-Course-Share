class Director{
    Builder b;
    public Director(Builder b){
        this.b = b;
    }
    public Production construct(){  //How to do
        b.buildPart1();
        b.buildPart2();
        return b.build();
    }
}

interface Builder {
    public void buildPart1();   //step1
    public void buildPart2();   //step2
    public Production build();  //finished
}
class BuilderA implements Builder {
    Production p = new Production();
    public void buildPart1() {
        p.setPart1("Wheels");
        p.getPart1();
    }
    public void buildPart2() {
        p.setPart2("Engine");
        p.getPart2();
    }
    public Production build() {
        System.out.println("BMW made 3/3 - finished");
        return p;
    }
}

class Production {
    private String part1;
    private String part2;

    public String getPart1() {
        System.out.println("BMW made 1/3");
        return part1;
    }
    public void setPart1(String part1) {
        this.part1 = part1;
    }
    public String getPart2() {
        System.out.println("BMW made 2/3");
        return part2;
    }
    public void setPart2(String part2) {
        this.part2 = part2;
    }
}

public class main{
    public static void main(String[] args) {
        Builder builderA = new BuilderA();
        Director director = new Director(builderA);
        director.construct(); 
    }
}

