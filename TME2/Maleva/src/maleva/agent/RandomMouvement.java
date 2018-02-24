
package maleva.agent;

import java.util.Random;

import maleva.framework.LifeCycleException;

public class RandomMouvement extends ComportementAgent {
	
	/* fields */
	private Random rand;
	
	/* properties */
	private int angle_step = 20;
	
	public RandomMouvement(Agent outer) {
		super(outer);
		rand = new Random();
	}
	
	/* LCStepperController */
	
	public boolean step() throws LifeCycleException {
		
		int newAngleStep =  outer.getAngle()+rand.nextInt(angle_step)*(rand.nextDouble()>0.5?1:-1);
		
		action = new Action(Action.MOVE, newAngleStep);

		return true;
	}
}
