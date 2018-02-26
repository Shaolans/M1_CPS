package priority.fifo.implementation.exception;

public class PostconditionError extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public PostconditionError(){
		super("PostconditionError");
	}
	
	public PostconditionError(String msg){
		super("PostconditionError : "+msg);
	}

}
