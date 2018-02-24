package dataflow.examples.primesthread;

import java.math.BigInteger;
import java.util.concurrent.Semaphore;

import dataflow.core.IntEvent;
import dataflow.core.Printer;

public class PrinterSem extends Printer {
	private String separator;
	private BigInteger valueToPrint;
	//evite d'effectuer plusieurs onIntEvent
	public static final Semaphore mutex = new Semaphore(1);
	
	//evite d'afficher deux fois la meme sortie
	public static final Semaphore mutex2 = new Semaphore(1);
	
	public PrinterSem(String prefix) {
		separator = prefix;
		valueToPrint = null;
	}
	
	public PrinterSem() {
		this("");
	}
	
	@Override
	public void onIntEvent(IntEvent event) {
		try {
			mutex.acquire();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(valueToPrint != null) {
			throw new Error("Receiving a value while waiting for activation.");
		}
		valueToPrint = event.getValue();
	}

	@Override
	public void activate() {
		try {
			mutex2.acquire();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.print(separator);
		separator = " ";
		if(valueToPrint != null) {
			System.out.print(valueToPrint);
			valueToPrint = null;
			mutex.release();
		} else {
			System.out.print(".");
		}
		mutex2.release();
		
	}
}
