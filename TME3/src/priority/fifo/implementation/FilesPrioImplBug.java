package priority.fifo.implementation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import priority.fifo.implementation.exception.InvariantError;
import priority.fifo.implementation.exception.PostconditionError;
import priority.fifo.implementation.exception.PreconditionError;
import priority.fifo.interfaces.FilesPrio;

public class FilesPrioImplBug<T> implements FilesPrio<T> {
	private Map<Integer, List<T>> filesprio;
	
	public FilesPrioImplBug() {
		filesprio = new HashMap<Integer, List<T>>();
	}
	
	@Override
	public int getSize() {
		int size = 0;
		for(Map.Entry<Integer, List<T>> entry: filesprio.entrySet()) {
			size += entry.getValue().size();
		}
		return size;
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
		List<T> lprio = filesprio.get(this.getMaxPrio());
		if(lprio == null || lprio.size() == 0) return null;
		return lprio.get(0);
	}

	@Override
	public T getElemPrio(int prio, int i) {
		List<T> lprio = filesprio.get(prio);
		if(lprio == null) return null;
		if(lprio.size() == 0 || i > lprio.size()-1) return null;
		return lprio.get(i);
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
		lprio.add(0,elem);
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
		lprio.remove(lprio.size()-1);
		
	}

	@Override
	public void remove() throws PreconditionError, PostconditionError, InvariantError {
		this.removePrio(this.getMaxPrio());
	}
}
