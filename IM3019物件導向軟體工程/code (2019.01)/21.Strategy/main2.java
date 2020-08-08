class Context {
    private Strategy strategy;
    public void factory(String strategyType) {
        if (strategyType.equals("Xmas")) {
            strategy = new StrategyA();
        } else if (strategyType.equals("Year")) {
            strategy = new StrategyB();
        }
    }
    public void execute() {
        strategy.execute();
    }
}

interface Strategy{
   public void execute();
}
class StrategyA implements Strategy{
   public void execute(){
      System.out.println("Merry X'mas!");}
}
class StrategyB implements Strategy{
   public void execute(){
      System.out.println("Happy New Year!");}
}

public class main2 {
    public static void main(String[] args) {
        Context context = new Context();
        context.factory("Xmas");
        context.execute();
    }
}


