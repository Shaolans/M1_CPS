package priority.fifo.test;


import priority.fifo.implementation.FilesPrioImplBug;
import priority.fifo.implementation.exception.InvariantError;
import priority.fifo.implementation.exception.PostconditionError;
import priority.fifo.implementation.exception.PreconditionError;

public class BugFilesPrioMainSansContrat {
	
	public static void main(String[] args) {
		FilesPrioImplBug<String> fpc = new FilesPrioImplBug<String>();
		try {
			fpc.init();
			System.out.println(fpc.isEmpty());//true
			fpc.putPrio(0, "bonjour");
			fpc.put("bonsoir");
			System.out.println(fpc.isEmpty());//false
			System.out.println(fpc.getSizePrio(0)); //2
			System.out.println(fpc.getSize()); //2
			fpc.removePrio(0);
			System.out.println(fpc.getSize());//0
			fpc.putPrio(10, "soirée");
			fpc.put("journée");
			System.out.println(fpc.getElem());
		} catch (InvariantError | PostconditionError e) {
			e.printStackTrace();
		} catch (PreconditionError e) {
			e.printStackTrace();
		}

	}
	

}
