package dataflow.examples.primes;

import java.math.BigInteger;

import dataflow.core.IntEvent;
import dataflow.core.IntEventReceiverService;
import dataflow.generators.SimpleGenerator;

/*
 * 
 * Exercice 3 -- Question 5
 * 
 * A compléter
 * 
 */

public class PrimeFilter extends SimpleGenerator 
		implements /* provide */
			       IntEventReceiverService {

	
	private PrimeFilter next;
	private BigInteger value;
	private BigInteger result;
	
	public PrimeFilter() {
		next = null;
		value = null;
		result = null;
	}
	
	
	@Override
	public void onIntEvent(IntEvent event) {
		result = event.getValue();
	}

	@Override
	public void activate() {
		
		if(result == null) {
			throw new Error("Missing operand at activation.");
		}
		
		IntEvent res = new IntEvent(result);
		
		if(value == null) {
			value = result;
			next = new PrimeFilter();
			for(IntEventReceiverService receive: receivers) {
				next.bindIntEventReceiverService(receive);
			}
			send(res);
			return;
		}
		
		BigInteger[] div = result.divideAndRemainder(value);
		if(div[1].compareTo(BigInteger.ZERO) > 0) {
			next.onIntEvent(res);
			next.activate();
			
		}
	}
	
}
