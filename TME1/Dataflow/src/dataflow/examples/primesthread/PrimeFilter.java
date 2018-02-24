package dataflow.examples.primesthread;

import java.math.BigInteger;
import java.util.concurrent.Semaphore;

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

	//semaphore qui evite d'avoir plusieurs fois l'affichage du meme entier
	public static final Semaphore printSem = new Semaphore(1);
	
	//permet d'eviter que value se fasse ecraser par result
	private final Semaphore mutex;
	
	//semaphore sur le filtre courant
	private final Semaphore primeSem;
	private PrimeFilter next;
	private BigInteger value;
	private BigInteger result;
	
	//permet de garder l'ordre croissant des entiers
	private boolean first;
	
	public PrimeFilter() {
		next = null;
		value = null;
		result = null;
		first = false;
		primeSem = new Semaphore(1);
		mutex = new Semaphore(1);
	}
	
	
	@Override
	public void onIntEvent(IntEvent event) {
		try {
			mutex.acquire();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result = event.getValue();
	}

	public void setFirst(boolean b) {
		first = b;
	}
	
	@Override
	public void activate() {
		
		try {
			primeSem.acquire();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(first) {
			GenPrimes.genSem.release();
		}
		
		if(result == null) {
			throw new Error("Missing operand at activation.");
		}
		
		IntEvent res = new IntEvent(result);
		
		if(value == null) {
			value = result;
			mutex.release();
			next = new PrimeFilter();
			for(IntEventReceiverService receive: receivers) {
				next.bindIntEventReceiverService(receive);
			}
			try {
				printSem.acquire();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			send(res);
			printSem.release();
			primeSem.release();
			return;
		}
		
		BigInteger[] div = result.divideAndRemainder(value);
		if(div[1].compareTo(BigInteger.ZERO) > 0) {
			next.onIntEvent(res);
			mutex.release();
			primeSem.release();
			next.activate();
			
		}else {
			mutex.release();
			primeSem.release();
		}
	}
	
}
