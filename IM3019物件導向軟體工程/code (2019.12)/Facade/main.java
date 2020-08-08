/* Complex parts wiki */ 
class CPU {
    public void freeze() { 
        //... 
    }
    public void execute() { 
        //... 
    }
}
class Memory {
    public void load(int position, int data) {
            //...
    }
}
class HardDrive {
    public void read(int lba, int size) {
            //...
    }
}

/* Façade */
class Computer {
    public void startComputer() {
        CPU cpu = new CPU();  
        Memory memory = new Memory();  
        HardDrive hard = new HardDrive();  

        cpu.freeze();
        memory.load(ADDRESS, hard.read(SECTOR, SIZE));
        cpu.execute();
    }
}

/* Client */

class Client {
    public static void main(String[] args) {
        Computer facade = new Computer();
        facade.startComputer();
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


