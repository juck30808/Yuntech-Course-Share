/* Complex parts wiki */ 
class Model1 {
  private Mediator m = new Mediator();

  public void do1() { 
    //... 
    m.doNext();
  }
}
class Model2 {
  public void do2() { 
    //... 
  }
}
class Model3 {
  public void do3() { 
    //... 
  }
}

/* Mediator */
class Mediator {
  private Model1 m1 = new Model1();
  private Model2 m2 = new Model2();
  private Model3 m3 = new Model3();

  public void doSome() {
    m1.do1();
  }
  public void doNext(){
    m2.do2();
    m3.do3();
  }
}

