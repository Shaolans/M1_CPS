package priority.fifo.implementation;

import java.util.Set;

import priority.fifo.implementation.exception.InvariantError;
import priority.fifo.implementation.exception.PostconditionError;
import priority.fifo.implementation.exception.PreconditionError;
import priority.fifo.interfaces.FilesPrio;

public class FilesPrioContract<T> extends FilesPrioDecorator<T> {

	public FilesPrioContract(FilesPrio<T> delegates) {
		super(delegates);
	}
	
	
	public void checkInvariants(){
		
	}
	

	@Override
	public void putPrio(int i, T elem) throws PreconditionError, PostconditionError, InvariantError {
		
		//preconditions
		
		// \pre i>=0
		if(i<0){
			throw new PreconditionError("i>=0 condition does not hold");
		}
		
		// \pre elem != null
		if(elem==null){
			throw new PreconditionError("elem!=null condition does not hold");
		}
		
		//invariants
		checkInvariants();
		
		//appel
		super.putPrio(i, elem);
		
		//captures
		Set<Integer> getActivePrios_atPre = getActivePrios();
		int getSizePrio_atPre = getSizePrio(i);
		T getElem_atPre = getElem();
		
		//invariants
		checkInvariants();
		
	}

	@Override
	public void put(T elem) throws PreconditionError, PostconditionError, InvariantError {
		
		//preconditions
		
		// \pre elem != null
		if(elem==null){
			throw new PreconditionError("elem!=null condition does not hold");
		}
		
		//invariants
		checkInvariants();
		
		//appel
		super.put(elem);
		
		//invariants
		checkInvariants();
		
	}

	@Override
	public void removePrio(int i) throws PreconditionError, PostconditionError, InvariantError {
		
		//preconditions
		
		// \pre getSizePrio(i) > 0
		if(getSizePrio(i)<=0){
			throw new PreconditionError("getSizePrio(i)>0 does not hold");
		}
		
		//invariants
		checkInvariants();
		
		//captures
		Set<Integer> getActivePrios_atPre = getActivePrios();
		int getSizePrio_atPre = getSizePrio(i);
		T getElem_atPre = getElem();
		
		//appel
		super.removePrio(i);
		
		//invariants
		checkInvariants();
		
	}

	@Override
	public void remove() throws PreconditionError, PostconditionError, InvariantError {
		
		//preconditions
		
		// \pre getSize()>0
		if(getSize()<=0){
			throw new PreconditionError("getSize()>0 condition does not hold");
		}
		
		//invariants
		checkInvariants();
		
		//appel
		super.remove();
		
		//invariants
		checkInvariants();
		
	}

}
