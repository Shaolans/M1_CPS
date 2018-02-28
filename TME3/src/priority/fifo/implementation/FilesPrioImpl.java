package priority.fifo.implementation;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import priority.fifo.implementation.exception.InvariantError;
import priority.fifo.implementation.exception.PostconditionError;
import priority.fifo.implementation.exception.PreconditionError;
import priority.fifo.interfaces.FilesPrio;

public class FilesPrioImpl<T> implements FilesPrio<T> {
	private Map<Integer, List<T>> filesprio;
	
	public FilesPrioImpl() {
		filesprio = new HashMap<Integer, List<T>>();
	}
	
	@Override
	public int getSize() {
		return filesprio.size();
	}

	@Override
	public boolean isEmpty() {
		return filesprio.isEmpty();
	}

	@Override
	public Set<Integer> getActivePrios() {
		return filesprio.keySet();
	}

	@Override
	public boolean isActive(int i) {
		List<T> active = filesprio.get(i);
		if(active == null) return false;
		return true;
	}

	@Override
	public int getMaxPrio() {
		int max = 0;
		for(Integer i: filesprio.keySet()) {
			max = Math.max(max, i);
		}
		return max;
	}

	@Override
	public int getSizePrio(int i) {
		List<T> lprio = filesprio.get(i);
		if(lprio == null) return 0;
		return lprio.size();
	}

	@Override
	public T getPrio(int i) {
		List<T> lprio = filesprio.get(i);
		if(lprio == null || lprio.size() == 0) return null;
		return lprio.get(0);
	}

	@Override
	public T getElem() {
		List<Integer> prio = new ArrayList<>(filesprio.keySet());
		if(prio.size() == 0) return null;
		Collections.sort(prio, (a,b)->(a<b?-1:1));
		List<T> lprio = filesprio.get(prio.get(0));
		if(lprio == null || lprio.size() == 0) return null;
		return lprio.get(0);
	}

	@Override
	public T getElemPrio(int prio, int i) {
		return filesprio.get(prio).get(i);
	}

	@Override
	public void init() throws InvariantError, PostconditionError {
		filesprio = new HashMap<Integer, List<T>>();
	}

	@Override
	public void putPrio(int i, T elem) throws PreconditionError, PostconditionError, InvariantError {
		List<T> lprio = filesprio.get(i);
		if(lprio == null) {
			lprio = new ArrayList<>();
		}else {
			lprio = new ArrayList<>(lprio);
		}
		lprio.add(elem);
		filesprio.put(i, lprio);
	}

	@Override
	public void put(T elem) throws PreconditionError, PostconditionError, InvariantError {
		this.putPrio(this.getMaxPrio(), elem);
		
	}

	@Override
	public void removePrio(int i) throws PreconditionError, PostconditionError, InvariantError {
		List<T> lprio = filesprio.get(i);
		if(lprio.size() <= 1) filesprio.remove(i);
		lprio.remove(0);
		
	}

	@Override
	public void remove() throws PreconditionError, PostconditionError, InvariantError {
		this.removePrio(this.getMaxPrio());
	}

}
