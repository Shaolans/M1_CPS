package dataflow.examples.primesthread;


import dataflow.core.Printer;

public class PrimeThread extends Thread{
	private GenPrimes gen;
	private Printer print;
	public static final int NBTURN = 10;
	
	
	public PrimeThread(GenPrimes gen, Printer print) {
		this.gen = gen;
		this.print = print;
	}
	
	public void run() {
		for(int i = 0; i < NBTURN; i++) {
			gen.activate();
			print.activate();
		}
	}

}
