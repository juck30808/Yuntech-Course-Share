abstract class Clothes {
    protected int def;  
    public void do();
}
public class Armor extends Clothes {
	public void do(){
       //...
    }
}
public class Leather extends Clothes {
	public void do(){
       //...
    }
}

abstract class Weapon {
    protected int atk;   
    public void do();
}
public class LongSword extends Weapon {
	public void do(){
       //...
    }
}
public class Bow extends Weapon {
	public void do(){
       //...
    }
}

//interface
interface Factory {
    public Weapon productWeapon();
    public Clothes productArmor();
}

class WarriorFactory implements Factory{
    public Weapon productWeapon() {
        LongSword product = new LongSword();
        return product;
    }
    public Clothes productArmor() {
        Armor product = new Armor();
        return product;        
    }

}
public class ArcherFactory implements Factory{
    public Weapon productWeapon() {
        Bow product = new Bow();
        return product;
    }
    public Clothes productArmor() {
        Leather product = new Leather();        
        return product;
    }

}
