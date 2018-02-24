package dataflow.examples.primesthread;

import java.util.concurrent.Semaphore;

import dataflow.core.Composite;
import dataflow.core.IntEventReceiverService;
import dataflow.core.RequireIntEventReceiverService;
import dataflow.examples.basics.GenInt;

public class GenPrimes implements Composite,
			/* require */
			RequireIntEventReceiverService {

	private GenInt gen;
	private PrimeFilter head;
	
	//genere qu'un entier a la fois (protection des doublons d'entiers)
	public static final Semaphore genSem = new Semaphore(1);
	
	public GenPrimes() {
		gen = new GenInt(2);
		head = new PrimeFilter();
		head.setFirst(true);
		gen.bindIntEventReceiverService(head);
	}	
	
	@Override
	public void bindIntEventReceiverService(IntEventReceiverService serv) {
		head.bindIntEventReceiverService(serv);
	}
		
	@Override
	public void activate() {
		try {
			genSem.acquire();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		gen.activate();
		head.activate();
	}

}
