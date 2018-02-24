package dataflow.examples.fibo;

import java.math.BigInteger;

import dataflow.core.Composite;
import dataflow.core.IntEvent;
import dataflow.core.IntEventReceiverService;
import dataflow.core.Relay;
import dataflow.core.RequireIntEventReceiverService;
import dataflow.operators.Add;

/*
 * 
 * Exercice 2 -- Question 4
 * 
 * A compléter  
 * 
 */


public class GenFibo implements Composite,
			/* require */
			RequireIntEventReceiverService {

	private Add add;
	private Relay relay1;
	private Relay relay2;
	
	public GenFibo() {
		add = new Add();
		relay1 = new Relay();
		relay2 = new Relay();
		
		add.onIntEvent(new IntEvent(BigInteger.valueOf(1)));
		add.onIntEvent(new IntEvent(BigInteger.valueOf(0)));

		relay1.onIntEvent(new IntEvent(BigInteger.valueOf(0)));
		
		add.bindIntEventReceiverService(relay2);
		relay2.bindIntEventReceiverService(relay1);
		relay2.bindIntEventReceiverService(add);
		relay1.bindIntEventReceiverService(add);
	}	
	
	@Override
	public void bindIntEventReceiverService(IntEventReceiverService serv) {
		add.bindIntEventReceiverService(serv);
	}
		
	@Override
	public void activate() {
		add.activate();
		relay1.activate();
		relay2.activate();
		
		
	}

}
