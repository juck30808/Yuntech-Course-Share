interface Subject {
    public void movie();
}
// Me
class Star implements Subject {
    public void movie() {
        System.out.println(getClass().getSimpleName() + 
            ":My Manager order a movie");
    }
}
//Proxy: Manager
class Manager implements Subject { 
    private Subject star;
    public Manager(Subject star) {
        this.star = star;
    }
    public void movie() {
        System.out.println(getClass().getSimpleName() + 
            ":Good! I will order it!");
        star.movie();
    }
}
class main2 {
    public static void main(String[] args) {
        Subject star = new Star();
        Subject proxy = new Manager(star);
        proxy.movie();
    }
}

