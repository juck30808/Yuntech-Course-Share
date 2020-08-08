import java.util.ArrayList;
import java.util.List;

class Subject {        
    private List<Observer> list = new ArrayList<Observer>();    
      
    public void addObs(Observer o) {        
        list.add(o);    
    }    
    public void notifyAll(String msg) {  //notify observer          
        for (Observer observer : list) {    
            observer.update(msg);        
        }   
    }
}

abstract class Observer {    
    public abstract void update(String msg);
}
class KanyeWest extends Observer {
    public void update(String msg) {
        //...
}
class Drake extends Observer {
    public void update(String msg) {
        //...
}

public class main {    
    public static void main(String[] args) {        
        KanyeWest kan = new KanyeWest();  
        Drake dar = new Drake();                           
        Subject subject = new Subject();   

        subject.addObs(kan);        
        subject.addObs(dar); 
        subject.notifyAll("new video update");    
    }
} 

