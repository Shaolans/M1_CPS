package lift.test;

import lift.contracts.CommandsContract;
import lift.contracts.LiftContract;
import liftimpl1.Lift1;

public class LiftTest1 extends LiftTest {

	@Override
	public void beforeTests() {
		Lift1 l1 = new Lift1();
		super.setLift(new LiftContract(l1));
		l1.getCommands().init();
		super.setCommands(new CommandsContract(l1.getCommands()));
	}
	
	

}
