package priority.fifo.implementation;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import priority.fifo.implementation.exception.InvariantError;
import priority.fifo.implementation.exception.PostconditionError;
import priority.fifo.implementation.exception.PreconditionError;
import priority.fifo.interfaces.FilesPrio;

public class FilesPrioContract<T> extends FilesPrioDecorator<T> {

	public FilesPrioContract(FilesPrio<T> delegates) {
		super(delegates);
	}
	
	
	public void checkInvariants() throws InvariantError{
		/* \inv getSize() == \sum ( i:int \with
			i \in getActivePrios() , getSizePrio(i) ) */
		int size=0;
		for(Integer i : getActivePrios())
			size+=getSizePrio(i);
		if(getSize()!=size)
			throw new InvariantError("getSize()== sum(i belongs to getActivePrios, getSizePrio(i)"
					+ " does not hold");
		
		
		// \inv isEmpty() == (getSize() == 0)
		if(isEmpty()!=(getSize()==0))
			throw new InvariantError("isEmpty() == (getSize() == 0) does not hold");

		// \inv \forall i:int isActive(i) == ( i \in getActivePrios() )
		for(int k = 0; k<10; k++){
			Random r = new Random();
			int i = r.nextInt(Integer.MAX_VALUE);
			if(getActivePrios().contains(i) && !isActive(i)){
				throw new InvariantError("forall i:int isActive(i) == ( i in getActivePrios() )"
						+ "does not hold");
			}
			else{
				if(!getActivePrios().contains(i) && isActive(i)){
					throw new InvariantError("forall i:int isActive(i) == ( i in getActivePrios() )"
							+ "does not hold");
				}
			}
		}
		
		/* \inv	getMaxPrio() == \max0 ( getActivePrios() ) */
		int max0=0;
		for(Integer i : getActivePrios()){
			for(Integer j : getActivePrios()){
				if(i!=j){
					int tmp = Integer.max(i, j);
					if(max0 < tmp)
						max0 = tmp;						
				}
			}
		}
		if(getMaxPrio()!=max0){
			throw new InvariantError("getMaxPrio() == max0 ( getActivePrios() ) does not hold");
		}
		
		/* \inv \forall i:int getPrio(i) == getElemPrio(i,1) */
		for(Integer i : getActivePrios()){
			if(getPrio(i)!=getElemPrio(i, 0)){//changement d'indice
				throw new InvariantError("\forall i:int getPrio(i) == getElemPrio(i,1) "
						+ "does not hold");
			}			
		}
		
		/* \inv getElem() == getPrio(getMaxPrio()) */
		if(getElem()!= getPrio(getMaxPrio()) ) {System.out.println(getElem()+" "+getPrio(getMaxPrio())+" "+getMaxPrio());
			throw new InvariantError("getElem() == getPrio(getMaxPrio()) does not hold");}
		
		
		/* \inv \forall i:int \with i \in getActivePrio(), getSizePrio(i) > 0 */
		for(Integer i : getActivePrios()){
			if(getSizePrio(i)<=0)
				throw new InvariantError("forall i:int with i in getActivePrio(), getSizePrio(i) > 0 "
						+ "does not hold");
		}
		
		/* \inv \forall i:int \with i \not_in getActivePrio(), getSizePrio(i) == 0 */
		for(int k = 0; k<10; k++){
			Random r = new Random();
			int i = r.nextInt(Integer.MAX_VALUE);
			if( !getActivePrios().contains(i) && getSizePrio(i)!=0){
				throw new InvariantError("forall i:int with i not_in getActivePrio(), getSizePrio(i) == 0"
						+ "does not hold");
			}
			
		}
		
		/* \inv \forall i:int \with i \in getActivePrio(), \forall k:int \in [1..getSizePrio(i)],
		 * getElemPrio(i,k) != null
		 */
		for(Integer i : getActivePrios()){
			for(int k=0; k<getSizePrio(i); k++){
				if(getElemPrio(i,k)==null)
					throw new InvariantError("forall i:int with i in getActivePrio(), "
							+ "forall k:int in [1..getSizePrio(i)] getElemPrio(i,k) != null does not hold");
			}
		}
		
		
	}
	
	
	@Override
	public void init() throws InvariantError, PostconditionError{
		
		//invariants
		checkInvariants();
		super.init();
		
		//invariants
		checkInvariants();
		
		//postconditions
		
		// \post getSize() == 0
		if(getSize()!=0)
			throw new PostconditionError("getSize() == 0 does not hold");
		
		
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
		
		//captures
		Set<Integer> getActivePrios_atPre = getActivePrios();
		int getSizePrio_atPre = getSizePrio(i);
		boolean isActive_atPre = isActive(i);
		
		Map<Integer, Integer> getSizePrioMap_atPre = new HashMap<>();
		Map<Integer, Map<Integer, T>> getElemMap_atPre = new HashMap<>();
		for(Integer j : getActivePrios()){
			int k = getSizePrio(j);
			getSizePrioMap_atPre.put(j,k );
			
			for(int l=0 ; l<k; l++){
				if(getElemMap_atPre.get(j)==null)
					getElemMap_atPre.put(j, new HashMap<>());
				getElemMap_atPre.get(j).put(l, getElemPrio(j, l));
			}
				
		}
		
		
		//appel
		super.putPrio(i, elem);
		
		//invariants
		checkInvariants();
		
		
		//postconditions
		
		// \post isActive(i)@pre \impl getActivePrios() == getActivePrios()@pre
		if(isActive_atPre){
			for(Integer k : getActivePrios()){
				if(!getActivePrios_atPre.contains(k))
					throw new PostconditionError("isActive(i)@pre impl getActivePrios() == getActivePrios()@pre"
							+ "does not hold");
			}
			for(Integer k : getActivePrios_atPre){
				if(!getActivePrios().contains(k))
					throw new PostconditionError("isActive(i)@pre impl getActivePrios() == getActivePrios()@pre"
							+ "does not hold");
			}
		}
		
		// \post !getActive(i)@pre \impl getActivePrios() == getActivePrios()@pre \\union {i}
		else{
			for(Integer k : getActivePrios()){
				if(!getActivePrios_atPre.contains(k))
					throw new PostconditionError("!getActive(i)@pre impl getActivePrios() == getActivePrios()@pre \\union {i}"
							+ "does not hold");
			}
			for(Integer k : getActivePrios_atPre){
				if(!getActivePrios().contains(k))
					throw new PostconditionError("!getActive(i)@pre impl getActivePrios() == getActivePrios()@pre \\union {i}"
							+ "does not hold");
			}
			if(!getActivePrios().contains(i))
				throw new PostconditionError("!getActive(i)@pre impl getActivePrios() == getActivePrios()@pre \\union {i}"
						+ "does not hold");
		}
		
		// \post getSizePrio(i) == getSizePrio(i)@pre + 1
		if(getSizePrio(i)!=getSizePrio_atPre+1)
			throw new PostconditionError("getSizePrio(i) == getSizePrio(i)@pre + 1 does not hold ");
		
		// \post \forall j:int \with j \in getActivePrios()@pre, j != i, getSizePrio(j) == getSizePrio(j)@pre 
		for(Integer j : getActivePrios_atPre){
			if(j!=i){
				if(getSizePrio(j)!=getSizePrioMap_atPre.get(j))
					throw new PostconditionError("forall j:int with j in getActivePrios()@pre, j != i, getSizePrio(j) == getSizePrio(j)@pre"
							+ "does not hold");
			}
		}
		
		// \post prio(i) == elem
		if(getPrio(i)!=elem){
			throw new PostconditionError("prio(i) == elem does not hold");
		}
		
		// \post \forall k:int \with k \in [2..getSizePrio(i)@pre+1], getElemPrio(i,k) == getElemPrio(i,k-1)@pre
		for(int k=1 ; k<getSizePrio_atPre+1; k++){
			if( getElemPrio(i, k)!= getElemMap_atPre.get(i).get(k)){
				throw new PostconditionError("forall k:int with k in [2..getSizePrio(i)@pre+1], getElemPrio(i,k) == getElemPrio(i,k-1)@pre"
						+ "does not hold");
			}
		}
		
		/* \post \forall j:int \with j \in getActivePrios()@pre, j != i, 
		 * 	\forall k:int \with k \in [1..getSizePrio(j)@pre+1], getElemPrio(j,k) == getElemPrio(j,k)@pre
		*/
		for(Integer j : getActivePrios_atPre){
			if(j!=i){
				for(int k=0; k<getSizePrioMap_atPre.get(j)+1; k++){
					if(getElemPrio(j, k) != getElemMap_atPre.get(j).get(k))
						throw new PostconditionError("forall j:int with j in getActivePrios()@pre, j != i," 
		  +"forall k:int with k in [1..getSizePrio(j)@pre+1], getElemPrio(j,k) == getElemPrio(j,k)@pre"
		  + "does not hold");
				}
			}
		}
		
		
		
	}

	@Override
	public void put(T elem) throws PreconditionError, PostconditionError, InvariantError {
		
		//preconditions
		
		// \pre elem != null
		if(elem==null){
			throw new PreconditionError("elem!=null condition does not hold");
		}
		
		//appel
		super.putPrio(getMaxPrio(), elem);

		
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
		
		Map<Integer, Integer> getSizePrioMap_atPre = new HashMap<>();
		Map<Integer, Map<Integer, T>> getElemMap_atPre = new HashMap<>();
		for(Integer j : getActivePrios()){
			int k = getSizePrio(j);
			getSizePrioMap_atPre.put(j,k);
			
			for(int l=0 ; l<k; l++){
				if(getElemMap_atPre.get(j)==null)
					getElemMap_atPre.put(j, new HashMap<>());
				getElemMap_atPre.get(j).put(l, getElemPrio(j, l));
			}
				
		}
		
		//appel
		super.removePrio(i);
		
		//invariants
		checkInvariants();
		
		//postconditions

		// \post getSizePrio(i)@pre > 1 \impl getActivePrios() == getActivePrios()@pre
		if(getSizePrio_atPre>1){
			for(Integer k : getActivePrios()){
				if(!getActivePrios_atPre.contains(k))
					throw new PostconditionError("getSizePrio(i)@pre > 1 impl getActivePrios() == getActivePrios()@pre"
							+ "does not hold");
			}
			for(Integer k : getActivePrios_atPre){
				if(!getActivePrios().contains(k))
					throw new PostconditionError("getSizePrio(i)@pre > 1 impl getActivePrios() == getActivePrios()@pre"
							+ "does not hold");
			}
		}

		// \post getSizePrio(i)@pre == 1 \impl getActivePrios() == getActivePrios()@pre \minus {i}
		else{
			for(Integer k : getActivePrios()){
				if(!getActivePrios_atPre.contains(k))
					throw new PostconditionError("getSizePrio(i)@pre == 1 impl getActivePrios() == getActivePrios()@pre minus {i}"
							+ "does not hold");
			}
			for(Integer k : getActivePrios_atPre){
				if(!getActivePrios().contains(k))
					throw new PostconditionError("getSizePrio(i)@pre == 1 impl getActivePrios() == getActivePrios()@pre minus {i}"
							+ "does not hold");
			}
			if(getActivePrios().contains(i))
				throw new PostconditionError("getSizePrio(i)@pre == 1 impl getActivePrios() == getActivePrios()@pre minus {i}"
						+ "does not hold");
		}

		// \post getSizePrio(i) == getSizePrio(i)@pre - 1
		if(getSizePrio(i)!=getSizePrio_atPre-1)
			throw new PostconditionError("getSizePrio(i) == getSizePrio(i)@pre - 1 does not hold ");

		// \post \forall j:int \with j \in getActivePrios()@pre, j != i, getSizePrio(j) == getSizePrio(j)@pre 
		for(Integer j : getActivePrios_atPre){
			if(j!=i){
				if(getSizePrio(j)!=getSizePrioMap_atPre.get(j))
					throw new PostconditionError("forall j:int with j in getActivePrios()@pre, j != i, getSizePrio(j) == getSizePrio(j)@pre"
							+ "does not hold");
			}
		}

		// \post \forall k:int \with k \in [1..getSizePrio(i)@pre-1], getElemPrio(i,k) == getElemPrio(i,k)@pre
		for(int k=0 ; k<getSizePrio_atPre-1; k++){
			if( getElemPrio(i, k)!= getElemMap_atPre.get(i).get(k)){
				throw new PostconditionError("forall k:int with k in [0..getSizePrio(i)@pre-1], getElemPrio(i,k) == getElemPrio(i,k-1)@pre"
						+ " does not hold");
			}
		}

		/* \post \forall j:int \with j \in getActivePrios()@pre, j != i, 
		 * 	\forall k:int \with k \in [1..getSizePrio(j)@pre], getElemPrio(j,k) == getElemPrio(j,k)@pre
		 */
		for(Integer j : getActivePrios_atPre){
			if(j!=i){
				for(int k=0; k<getSizePrioMap_atPre.get(j)+1; k++){
					if(getElemPrio(j, k) != getElemMap_atPre.get(j).get(k))
						throw new PostconditionError("forall j:int with j in getActivePrios()@pre, j != i," 
								+"forall k:int with k in [1..getSizePrio(j)@pre], getElemPrio(j,k) == getElemPrio(j,k)@pre"
								+ " does not hold");
				}
			}
		}




		
		
		
	}

	@Override
	public void remove() throws PreconditionError, PostconditionError, InvariantError {
		
		//preconditions
		
		// \pre getSize()>0
		if(getSize()<=0){
			throw new PreconditionError("getSize()>0 condition does not hold");
		}

		//appel
		super.removePrio(getMaxPrio());
		
		
	}

}
