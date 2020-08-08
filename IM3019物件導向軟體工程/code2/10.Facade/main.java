//After Use
class Computer {  
    public void startup(){  
        CPU cpu = new CPU();  
        Memory memory = new Memory();  
        Disk disk = new Disk();  

        cpu.startup();  
        memory.startup();  
        disk.startup();  
    }  
}

class CPU {   
    public void startup(){  
        System.out.println("-cpu startup!");  }   
} 
class Memory {    
    public void startup(){  
        System.out.println("-memory startup!");  }  
} 
class Disk {  
    public void startup(){  
        System.out.println("-disk startup!");  }  
}

public class main{
   public static void main(String[] args) {
      Computer com = new Computer();
      com.startup();
   }
}


/*If we don't use Facade
class CPU {   
    public void startup(){  
        System.out.println("-cpu startup!");  }   
} 
class Memory {    
    public void startup(){  
        System.out.println("-memory startup!");  }  
} 
class Disk {  
    public void startup(){  
        System.out.println("-disk startup!");  }  
}

public class main{
   public static void main(String[] args) {
        CPU cpu = new CPU();  
        Memory memory = new Memory();  
        Disk disk = new Disk();  
        cpu.startup();  
        memory.startup();  
        disk.startup();  
   }
}
*/


