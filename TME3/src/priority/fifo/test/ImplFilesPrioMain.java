package priority.fifo.test;



import priority.fifo.implementation.FilesPrioContract;
import priority.fifo.implementation.FilesPrioImpl;
import priority.fifo.implementation.exception.InvariantError;
import priority.fifo.implementation.exception.PostconditionError;
import priority.fifo.implementation.exception.PreconditionError;

public class ImplFilesPrioMain {

	public static void main(String[] args) {
		FilesPrioContract<String> fpc = new FilesPrioContract<String>(new FilesPrioImpl<String>());
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
