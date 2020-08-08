import java.util.*;
import java.util.Iterator;
import java.util.ArrayList;

/*
a(MenuComponent)  - b(Menu)   - rice
                  - rice      - noodle
                  - noodle

*/
abstract class MenuComponent {
   public void add(MenuComponent m) {}
   public void remove(MenuComponent m) {}
   public String getName() {
      return "error";} //no void need return
   public double getPrice() {
      return 0;}      //no void need return
   public void print() {}
}

class Menu extends MenuComponent {  //composite 
   ArrayList arr = new ArrayList();
   String name;
   public void add(MenuComponent m) {
      arr.add(m);
   }
   public void remove(MenuComponent m) {
      arr.remove(m);
   }
   public void print() {
      Iterator iterator = arr.iterator();
      while (iterator.hasNext()) {
         MenuComponent menuComponent = (MenuComponent)iterator.next();
         menuComponent.print();
      }
   }
}

class rice extends MenuComponent {
   String name;
   double price;
   public rice(String name, double price) { 
      this.name = name;
      this.price = price;
   }
   public String getName() {return name;}
   public double getPrice() {return price;}
   public void print() {
      System.out.println("rice   " + getName() +" , "+getPrice());
   }
}

class noodle extends MenuComponent {
   String name;
   double price;
   public noodle(String name, double price) { 
      this.name = name;
      this.price = price;
   }
   public String getName() {return name;}
   public double getPrice() {return price;}
   public void print() {
      System.out.println("noodle " + getName() +" , "+getPrice());
   }
}


public class main {
   public static void main(String args[]) {
      MenuComponent a = new Menu();
      a.add(new rice("A_pancakeHouse", 1.99));
      a.add(new noodle("B_pancakeHouse", 2.99));
      MenuComponent b = new Menu();
      b.add(new rice("X_dinerMenu", 3.99));
      b.add(new noodle("Y_dinerMenu", 4.99));

      a.add(b);   //must have this!!!
      a.print();  //print top a


   }
}