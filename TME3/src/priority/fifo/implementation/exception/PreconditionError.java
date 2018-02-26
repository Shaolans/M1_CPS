package priority.fifo.implementation.exception;

public class PreconditionError extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public PreconditionError(){
		super("PreconditionError");
	}
	
	public PreconditionError(String msg){
		super("PreconditionError : "+msg);
	}

}
