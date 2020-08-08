//Strategy Pattern Example: Go Vehicle 


//Context
abstract class Vehicle {
	private Strategy s;
	public void setStrategy(Strategy s) {
		this.s = s;
	}
	public void go() {
		s.go();
	}
}
class StreetRacer extends Vehicle {
	public StreetRacer() {
		setStrategy(new GoByDriving());
	}
}
class FormulaOne extends Vehicle {
	public FormulaOne() {
		setStrategy(new GoByDriving());
	}
}
class Helicopter extends Vehicle {
	public Helicopter() {
		setStrategy(new GoByFlying());
}
class Jet extends Vehicle {
	public Jet() {
		setStrategy(new GoByFlyingFast());
	}
}


//Strategy
public interface Strategy {
	public void go(); 
}

public class GoByDriving implements Strategy {	
	public void go() {
		//...
	}
}

public class GoByFlying implements Strategy {
	public void go() {
		//...
	}
}
public class GoByFlyingFast implements Strategy {
	public void go() {
		//..
	}
}
	

public class Main {

	public static void main(String[] args) {
		StreetRacer streetRacer = new StreetRacer();
		FormulaOne formulaOne = new FormulaOne();
		Helicopter helicopter = new Helicopter();
		Jet jet = new Jet();
		
		streetRacer.go();
		formulaOne.go();
		helicopter.go();
		jet.go();
		
		Jet realJet = new Jet();
		realJet.setStrategy(new GoByDriving());
		realJet.go();
		realJet.setStrategy(new GoByFlyingFast());
		realJet.go();
		realJet.setStrategy(new GoByDriving());
		realJet.go();
		

	}

}

/*
Result:

Now I'm driving.
Now I'm driving.
Now I'm flying.
Now I'm flying fast.
Now I'm driving.
Now I'm flying fast.
Now I'm driving.

*/