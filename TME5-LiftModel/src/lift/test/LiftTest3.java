package lift.test;

import lift.contracts.CommandsContract;
import lift.contracts.LiftContract;
import liftimpl3.Lift3;

public class LiftTest3 extends LiftTest {

	@Override
	public void beforeTests() {
		Lift3 l3 = new Lift3();
		super.setLift(new LiftContract(l3));
		l3.getCommands().init();
		super.setCommands(new CommandsContract(l3.getCommands()));
	}

}
