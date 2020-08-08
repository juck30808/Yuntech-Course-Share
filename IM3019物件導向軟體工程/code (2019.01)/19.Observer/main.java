class FullTimeTeacher{
    public String name;
    public int rate;
    public int totalHours;
    public void FullTimeTeacher(String n,int r,int t){
        this.name = n;
        this.rate = r;
        this.totalHours = t;
    }
    public double getSalary(){
        return 9 * rate + ((totalHours - 9) * rate * 0.8);
    }
}

class PartTimeTeacher{
    public String name;
    public int rate;
    public int totalHours;
    public void PartTimeTeacher(String n,int r,int t){
        this.name = n;
        this.rate = r;
        this.totalHours = t;
    }
    public double getSalary(){
        return totalHours * rate;
    }
}


public class main {
    public static void main(String argv[]) {
        PartTimeTeacher p1 = new PartTimeTeacher("John",400,2);
        PartTimeTeacher p2 = new PartTimeTeacher("Mary",300,4);
        FullTimeTeacher f1 = new FullTimeTeacher("Peter",400,9);
        FullTimeTeacher f2 = new FullTimeTeacher("Paul",300,12);
        FullTimeTeacher f3 = new FullTimeTeacher("Eric",350,15);
        System.out.println("John-PartTime: " + p1.getSalary());
        System.out.println("Mary-PartTime: " + p2.getSalary());
        System.out.println("Peter-FullTime: " + f1.getSalary());
        System.out.println("Paul-FullTime: " + f2.getSalary());
        System.out.println("Erit-FullTime: " + f3.getSalary());
    }
}
