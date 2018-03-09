package lift.test;

import static org.junit.Assert.fail;
import lift.contracts.PreconditionError;
import lift.services.DoorStatus;

import org.junit.Test;

import com.sun.org.apache.xpath.internal.axes.PredicatedNodeTest;

public abstract class LiftTest extends AbstractLiftTest {
	
	@Test
	public void initTest(){
		
		
		//cas positif
		beforeTests();
		getLift().init(2, 5);
		
		
		//cas negatifs 
		beforeTests();
		try{
			getLift().init(-1, 5);
			fail();
			
		}
		catch (PreconditionError e){}
		
		beforeTests();
		try{
			getLift().init(2, 2);
			fail();
			
		}
		catch (PreconditionError e){}
		

		
		
	}
	
	@Test
	public void beginMoveUpTest(){
		
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		System.out.println(getLift().getLiftStatus());
		getLift().closeDoor();
		getCommands().addUpCommand(3);
		
		//oracle
		try{
			getLift().beginMoveUp();
		}catch(PreconditionError e){
			e.printStackTrace();
			fail();
		}
		
		//cas negatif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		
		//oracle
		try{
			getLift().beginMoveUp();
			fail();
		}catch(PreconditionError e){}
		
	}
	
	@Test
	public void stepMoveUpTest(){
		//cas negatif
		//conditions initiales
		beforeTests();
		getLift().init(2,5);
		
		//oracle
		try{
			getLift().stepMoveUp();
			fail();
		}catch(PreconditionError e){}
	}
	
	
	@Test
	public void endMoveUpTest(){
		//cas negatif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		
		//oracle
		try{
			getLift().endMoveUp();
			fail();
		}catch(PreconditionError e){}
	}
	
	
	@Test
	public void beginMoveDownTest(){
		//cas negatif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		
		try{
			getLift().beginMoveDown();
			fail();
		}catch(PreconditionError e){}
		
	}
	
	@Test
	public void stepMoveDownTest(){
		//cas negatif
		//conditions initiales
		beforeTests();
		getLift().init(2,5);
		
		//oracle
		try{
			getLift().stepMoveDown();
			fail();
		}catch(PreconditionError e){}
	}
	
	
	@Test
	public void endMoveDownTest(){
		//cas negatif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		
		//oracle
		try{
			getLift().endMoveDown();
			fail();
		}catch(PreconditionError e){}
	}
	
	
	@Test
	public void openDoorTest(){
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getLift().closeDoor();
		getLift().doorAck();
		
		try{
			getLift().openDoor();
		}catch(PreconditionError e){
			fail();
		}
		
		//cas negatif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		
		try{
			getLift().openDoor();
			fail();
		}catch(PreconditionError e){}
	}
}
