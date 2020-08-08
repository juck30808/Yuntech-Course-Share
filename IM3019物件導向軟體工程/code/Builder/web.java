public  abstract class Builder {  

//第一步：装CPU
    public abstract void  BuildCPU()；
//第二步：装主板
    public abstract void BuildMainboard（）；
//返回产品的方法：获得组装好的电脑
    public abstract Computer GetComputer（）；
}
public class Director{
    //指挥装机人员组装电脑
    public void Construct(Builder builder){                         
    builder. BuildCPU();
    builder.BuildMainboard（）;
    builder. BuildHD（）;
    }
 }

//装机人员1
  public class ConcreteBuilder extend  Builder{
    //创建产品实例
    Computer computer = new Computer();

    //组装产品
    @Override
    public void  BuildCPU(){  
       computer.Add("组装CPU")
    }  

    @Override
    public void  BuildMainboard（）{  
       computer.Add("组装主板")
    }  
    //返回组装成功的电脑
     @Override
      public  Computer GetComputer（）{  
      return computer
    }  
}
public class Computer{
    
    //电脑组件的集合
    private List<String> parts = new ArrayList<String>()；
     
    //用于将组件组装到电脑里
    public void Add(String part){
    parts.add(part);
}
    
    public void Show(){
          for (int i = 0;i<parts.size();i++){    
          System.out.println(“组件”+parts.get(i)+“装好了”);
          }
          System.out.println(“电脑组装完成，请验收”);
	}
}

public class Builder Pattern{
  public static void main(String[] args){

//逛了很久终于发现一家合适的电脑店
//找到该店的老板和装机人员
  Director director = new Director();
  Builder builder = new ConcreteBuilder();

//沟通需求后，老板叫装机人员去装电脑
director.Construct(builder);

//装完后，组装人员搬来组装好的电脑
Computer computer = builder.GetComputer();
//组装人员展示电脑给小成看
computer.Show()；

    }
        
}
