package priority.fifo.implementation;

import java.util.Set;

import priority.fifo.implementation.exception.InvariantError;
import priority.fifo.implementation.exception.PostconditionError;
import priority.fifo.implementation.exception.PreconditionError;
import priority.fifo.interfaces.FilesPrio;

public class FilesPrioDecorator<T> implements FilesPrio<T> {
	
	private FilesPrio<T> delegates;
	
	public FilesPrioDecorator(FilesPrio<T> delegates) {
		this.delegates = delegates;
	}
	
	@Override
	public int getSize() {
		return delegates.getSize();
	}

	@Override
	public boolean isEmpty() {
		return delegates.isEmpty();
	}

	@Override
	public Set<Integer> getActivePrios() {
		return delegates.getActivePrios();
	}

	@Override
	public boolean isActive(int i) {
		return delegates.isActive(i);
	}

	@Override
	public int getMaxPrio() {
		return delegates.getMaxPrio();
	}

	@Override
	public int getSizePrio(int i) {
		return delegates.getSizePrio(i);
	}

	@Override
	public T getPrio(int i) {
		return delegates.getPrio(i);
	}

	@Override
	public T getElem() {
		return delegates.getElem();
	}

	@Override
	public T getElemPrio(int prio, int i) {
		return delegates.getElemPrio(prio, i);
	}

	@Override
	public void init() throws InvariantError, PostconditionError {
		delegates.init();
	}
	
	@Override
	public void putPrio(int i, T elem) throws PreconditionError, PostconditionError, InvariantError {
		delegates.putPrio(i, elem);
	}

	@Override
	public void put(T elem) throws PreconditionError, PostconditionError, InvariantError {
		delegates.put(elem);
	}

	@Override
	public void removePrio(int i) throws PreconditionError, PostconditionError, InvariantError {
		delegates.removePrio(i);
	}

	@Override
	public void remove() throws PreconditionError, PostconditionError, InvariantError {
		delegates.remove();
	}

}
