abstract class Handler {
    private Handler nextHandler;
    private int level;
    public Handler(int level) {
        this.level = level;
    }
    public final void handleMessage(Demand demand) {
        if (level == demand.demandLevel()) {
            this.report(demand);
        } else {
            if (this.nextHandler != null) {
                System.out.println("事情太严重，需报告上一级");
                this.nextHandler.handleMessage(demand);
            } else {
                System.out.println("我就是boss，没有上头");
            }
        }
    }

    public void setNextHandler(Handler handler) {
        this.nextHandler = handler;
    }
    public abstract void report(Demand demand);
}

public class TechnicalManager extends Handler {
    public TechnicalManager() {
        super(1);
    }
    public void report(Demand demand) {
        System.out.println("需求：" + demand.detail());
        System.out.println(getClass().getSimpleName() + "：小猿我挺你，这个需求不干");
    }
}
public class Boss extends Handler {
    public Boss() {
        super(2);
    }
    public void report(Demand demand) {
        System.out.println("需求：" + demand.detail());
        System.out.println(getClass().getSimpleName() + "：你们打一架吧，打赢的做决定");
    }
}
public class Client {
    public static void main(String[] args) {
        Demand demandA = new DemandA(); // 请求等级低
        Demand demandB = new DemandB(); // 请求等级高

        Boss boss = new Boss();
        TechnicalManager technicalManager = new TechnicalManager();
        technicalManager.setNextHandler(boss); // 设置下一级

        technicalManager.handleMessage(demandA);
        System.out.println("============================");
        technicalManager.handleMessage(demandB);
    }
}