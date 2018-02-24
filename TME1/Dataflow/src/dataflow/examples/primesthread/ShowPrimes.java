package dataflow.examples.primesthread;

import dataflow.core.Printer;

public class ShowPrimes {

	public static void main(String[] args) {
		int nb_threads = 4;

		GenPrimes gen = new GenPrimes();
		Printer printer = new PrinterSem("primes() -> ");
		
		gen.bindIntEventReceiverService(printer);
		
		for(int i = 0; i < nb_threads; i++) {
			new PrimeThread(gen, printer).start();
		}
		
	}

}
