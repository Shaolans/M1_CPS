package priority.fifo.implementation.exception;

public class InvariantError extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public InvariantError(){
		super("InvariantError");
	}
	
	public InvariantError(String msg){
		super("InvariantError : "+msg);
	}

}
