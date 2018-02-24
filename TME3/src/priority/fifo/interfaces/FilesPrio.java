package priority.fifo.interfaces;

import java.util.Set;

/**
 * Les mots-clés ajoutés :
 * 
 *  max0 : renvoie l'élément de valeur maximale d'un ensemble. Si l'ensemble est vide,
 *  revoie 0.
 *
 *	empty_set : renvoie l'ensemble vide
 */

public interface FilesPrio<T> {
	
	
	/*observators*/
	
	public int getSize();
	public boolean isEmpty();
	public Set<Integer> getActivePrios();
	public boolean isActive(int num);
	public int getMaxPrio();
	public int getSizePrio(int num);
	
	// \pre getSizePrio(num)>0
	public T getPrio(int num);
	
	// \pre getSize()>0
	public T getElem();
	
	// \pre num \in getActivePrios() \and prio>=0 \and prio<getSizePrio(num)
	public T getElemPrio(int num, int prio);
	
	
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
	public void init();
	/* post-conditions */
	// \post getSize() == 0
	
	
	/*operators*/
	
	//[putPrio]
	// \pre num>=0 \and elem != null
	public void putPrio(int num, T elem);
	// \post getActive(i)@pre \impl ( getActivePrios( getPrio(i,e) ) ) == getActivePrios()@pre
	// \post !getActive(i)@pre \impl ( getActivePrios( getPrio(i,e) ) ) == getActivePrios()@pre \\union {i}
	// \post getSizePrio(i) == getSizePrio(i)@pre + 1
	// \post \forall j:int \with j \in getActivePrios()@pre, j != num, getSizePrio(j) = getSizePrio(j)@pre 
	// \post prio(num) = elem
	// \post \forall k:int \with k \in [2..getSizePrio(i)@pre+1], getElemPrio(i,k) = getElemPrio(i,k-1)@pre
	/* \post \forall j:int \with j \in getActivePrios()@pre, j != num, 
	 * 	\forall k:int \with k \in [1..getSizePrio(i)@pre+1],
	 * 	elemPrio(j,k) = elemPrio(j,k)@pre
	*/
	
	
}
