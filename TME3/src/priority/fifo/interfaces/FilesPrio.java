package priority.fifo.interfaces;

import java.util.Set;

import priority.fifo.implementation.exception.InvariantError;
import priority.fifo.implementation.exception.PostconditionError;
import priority.fifo.implementation.exception.PreconditionError;

/**
 * Les mots-clés ajoutés :
 * 
 *  \max0 : renvoie l'élément de valeur maximale d'un ensemble. Si l'ensemble est vide,
 *  revoie 0.
 *
 *	\empty_set : renvoie l'ensemble vide
 *
 *	\def m1 : la méthode en question consiste à appeler la méthode m1
 *
 *	cond1 \impl cond2 : correspond à l'implication cond1 ==> cond2
 *
 *	ens1 \minus ens2 : correspond aux éléments de l'ensemble 1 n'appartenant pas à l'ensemble 2
 */

public interface FilesPrio<T> {
	
	
	/*observators*/
	
	public int getSize();
	
	public boolean isEmpty();
	
	public Set<Integer> getActivePrios();
	
	public boolean isActive(int i);
	
	public int getMaxPrio();
	
	public int getSizePrio(int i);
	
	
	
	// \pre getSizePrio(i)>0
	
	public T getPrio(int i);
	
	// \pre getSize()>0
	
	public T getElem();
	
	// \pre i \in getActivePrios() \and prio>=0 \and prio<getSizePrio(i)
	
	public T getElemPrio(int prio, int i);
	
	
	/*invariants*/
	
	/* \inv getSize() == \sum ( i:int \with
		i \in getActivePrios() , getSizePrio(i) ) */
	
	// \inv isEmpty() == (getSize() == 0)
	 
	// \inv \forall i:int isActive(i) == ( i \in getActivePrios() )
	
	/* \inv	getMaxPrio() == \max0 ( getActivePrios() ) */
	
	/* \inv \forall i:int getPrio(i) == getElemPrio(i,1) */
	
	/* \inv getElem() == getPrio(getMaxPrio()) */
	
	/* \inv \forall i:int \with i \in getActivePrio(), getSizePrio(i) > 0 */
	
	/* \inv \forall i:int \with i \not_in getActivePrio(), getSizePrio(i) == 0 */
	
	/* \inv \forall i:int \with i \in getActivePrio(), \forall k:int \in [1..getSizePrio(i)],
	 * getElemPrio(i,k) != null
	 */


	/*constructors*/
	
	//[init]
	
	public void init() throws InvariantError, PostconditionError;
	
	/* post-conditions */
	// \post getSize() == 0
	
	
	/*operators*/
	
	
	//[putPrio]
	
	// \pre i>=0 \and elem != null
	
	public void putPrio(int i, T elem) throws PreconditionError, PostconditionError, InvariantError;
	
	// \post isActive(i)@pre \impl getActivePrios() == getActivePrios()@pre
	// \post !getActive(i)@pre \impl getActivePrios() == getActivePrios()@pre \\union {i}
	// \post getSizePrio(i) == getSizePrio(i)@pre + 1
	// \post \forall j:int \with j \in getActivePrios()@pre, j != i, getSizePrio(j) == getSizePrio(j)@pre 
	// \post prio(i) == elem
	// \post \forall k:int \with k \in [2..getSizePrio(i)@pre+1], getElemPrio(i,k) == getElemPrio(i,k-1)@pre
	/* \post \forall j:int \with j \in getActivePrios()@pre, j != i, 
	 * 	\forall k:int \with k \in [1..getSizePrio(j)@pre+1], getElemPrio(j,k) == getElemPrio(j,k)@pre
	*/
	
	
	//[put]
	
	// \pre elem != null
	
	public void put(T elem) throws PreconditionError, PostconditionError, InvariantError;
	
	// \def putPrio(getMaxPrio()@pre, elem)
	
	
	//[removePrio]
	
	// \pre getSizePrio(i) > 0
	
	public void removePrio(int i) throws PreconditionError, PostconditionError, InvariantError;
	
	// \post getSizePrio(i)@pre > 1 \impl getActivePrios() == getActivePrios()@pre
	// \post getSizePrio(i)@pre == 1 \impl getActivePrios() == getActivePrios()@pre \minus {i}
	// \post getSizePrio(i)@pre == getSizePrio(i)@pre - 1
	// \post \forall j:int \with j \in getActivePrios()@pre, j != i, getSizePrio(j) = getSizePrio(j)@pre 
	// \post \forall k:int \with k \in [1..getSizePrio(i)@pre-1], getElemPrio(i,k) = getElemPrio(i,k)@pre
	/* \post \forall j:int \with j \in getActivePrios()@pre, j != i, 
	 * 	\forall k:int \with k \in [1..getSizePrio(j)@pre+1], getElemPrio(j,k) = getElemPrio(j,k)@pre
	*/
	
	
	//[remove]
	
	// \pre getSize()>0
	
	public void remove() throws PreconditionError, PostconditionError, InvariantError;
	
	// \def removePrio( getMaxPrio()@pre )
	
	
	
}


