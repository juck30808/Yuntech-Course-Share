import java.util.*;
import java.util.ArrayList;

abstract class Component{
    protected String name; //child
    public Component(String name){
        this.name = name;
    }
    public abstract void dosomething();
}

class Composite extends Component{
    List<Component> components = new ArrayList<>();
    public Composite(String name){
        super(name); 
    }
    public void doSomething(){
        System.out.println(name);
        if(null != components){
            for(Component c:components){
                c.doSomething();
            }
        }
    }
    public void addChild(Component child){
        components.add(child);
    }
    public void removeChild(Component child){
        components.remove(child); 
    }
    public Component getChild(int index){
        return components.get(index); 
    }
}

class Leaf extends Component{
    public Leaf (String name){
        super(name);
    }
    public void doSomething(){
        System.out.println(name);
    }
}

public class main2 {
    public static void main(String[] args){
        Composite root = new Composite("Root");

        Composite branch1 = new Composite("Branch1");
        Composite branch2 = new Composite("Branch2");

        Leaf leaf1 = new Leaf("Leaf1");
        Leaf leaf2 = new Leaf("Leaf2");

        branch1.addChild(leaf1);
        branch2.addChild(leaf2);

        root.addChild(branch1);
        root.addChild(branch2);

        root.doSomething();
    }
}
