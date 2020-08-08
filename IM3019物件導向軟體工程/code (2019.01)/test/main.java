import java.util.ArrayList;

class Originator {
  private String state;
  public void set(String state) {
    System.out.println("Originator: Setting state to " + state);
    this.state = state;
  }
  public Memento saveToMemento() {
    System.out.println("Originator: Saving to Memento.");
    return new Memento(state);
  }
  public void restoreFromMemento(Memento m) {
    state = m.getSavedState();
    System.out.println("Originator: State after restoring from Memento: " + state);
  }
}

class Memento {
  private String state;
  public Memento(String stateToSave) {
    state = stateToSave;
  }
  public String getSavedState() {
    return state;
  }
}

class Caretaker {
  private ArrayList<Memento> savedStates = new ArrayList<Memento>();
  public void addMemento(Memento m) {
    savedStates.add(m);
  }
  public Memento getMemento(int index) {
    return savedStates.get(index);
  }
}

class main {
  public static void main(String[] args) {
    Originator originator = new Originator();
    Caretaker caretaker = new Caretaker();

    originator.set("State1");
    originator.set("State2");
    caretaker.addMemento(originator.saveToMemento());
    originator.set("State3");
    caretaker.addMemento(originator.saveToMemento());
    originator.set("State4");

    originator.restoreFromMemento(caretaker.getMemento(1));
  }
}