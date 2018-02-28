package priority.fifo.test;

import priority.fifo.implementation.FilesPrioContract;
import priority.fifo.implementation.FilesPrioImpl;
import priority.fifo.implementation.exception.InvariantError;
import priority.fifo.implementation.exception.PostconditionError;
import priority.fifo.implementation.exception.PreconditionError;

public class FilesPrioMain {

	public static void main(String[] args) {
		FilesPrioContract<String> fpc = new FilesPrioContract<String>(new FilesPrioImpl<String>());
		try {
			fpc.init();
			fpc.putPrio(0, "TEST");
			fpc.put("TESTON");
			System.out.println(fpc.getSizePrio(0));
			System.out.println(fpc.getSize());
			
		} catch (InvariantError | PostconditionError e) {
			e.printStackTrace();
		} catch (PreconditionError e) {
			e.printStackTrace();
		}

	}

}
