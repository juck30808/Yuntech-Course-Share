interface State {
    void writeName(StateContext context, String name);
}

class LowerCaseState implements State {
    public void writeName(StateContext context, String name) {
        //...
        context.setState(new MultipleUpperCaseState());
    }
}

class MultipleUpperCaseState implements State {
    private int count = 0;

    public void writeName(StateContext context, String name) {
        //...
        
        if(++count > 1) {
            context.setState(new LowerCaseState());
        }
    }
}

class StateContext {
    private State state;
    
    public StateContext() {
        state = new LowerCaseState();
    }
    public void setState(State newState) {
        state = newState;
    }

    public void writeName(String name) {
        state.writeName(this, name);
    }
}

public class StateDemo {
    public static void main(String[] args) {
        StateContext context = new StateContext();

        context.writeName("Monday");
        context.writeName("Tuesday");
        context.writeName("Wednesday");
        context.writeName("Thursday");
        context.writeName("Friday");
        context.writeName("Saturday");
        context.writeName("Sunday");
    }
}