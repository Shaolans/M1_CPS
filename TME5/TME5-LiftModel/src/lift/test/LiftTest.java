package lift.test;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import lift.contracts.PreconditionError;
import lift.services.DoorStatus;
import lift.services.LiftStatus;

import org.junit.Test;


public abstract class LiftTest extends AbstractLiftTest {
	
	@Test
	public void initPreTest_1_1_1(){
		//cas positif
		beforeTests();
		try {
			getLift().init(2, 5);
		}catch(PreconditionError e) {
			fail();
		}
	}
	
	
	@Test
	public void initPreTest_1_2_1(){
		//cas negatifs 
		beforeTests();
		try{
			getLift().init(-1, 5);
			fail();
			
		}
		catch (PreconditionError e){}
	}
	
	
	@Test
	public void initPreTest_1_2_2(){
		//cas negatif
		beforeTests();
		try{
			getLift().init(2, 2);
			fail();
			
		}
		catch (PreconditionError e){}
	}
	
	
	@Test
	public void initTransitionTest_1_3_1(){
		//cas positif
		beforeTests();
		try {
			getLift().init(2, 5);
		}catch(PreconditionError e) {
			fail();
		}
		
		assertTrue(getLift().getMinLevel() == 2 &&
				getLift().getMaxLevel() == 5 &&
				getLift().getLevel() == 2 &&
				getLift().getLiftStatus() == LiftStatus.IDLE &&
				getLift().getDoorStatus() == DoorStatus.OPENED);
	}
	
	@Test
	public void beginMoveUpPreTest_2_1_1(){
		
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getCommands().addUpCommand(3);
		getLift().closeDoor();
		getLift().doorAck();
		
		//oracle
		try{
			getLift().beginMoveUp();
		}catch(PreconditionError e){
			e.printStackTrace();
			fail();
		}
		
	}
	
	@Test
	public void beginMoveUpPreTest_2_2_1(){
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
	public void beginMoveUpTransitionTest_2_3_1(){
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getCommands().addUpCommand(3);
		getLift().closeDoor();
		getLift().doorAck();
		
		//oracle
		try{
			getLift().beginMoveUp();
		}catch(PreconditionError e){
			e.printStackTrace();
			fail();
		}
		
		assertTrue(getLift().getLiftStatus() == LiftStatus.MOVING_UP);
		
	}
	
	
	@Test
	public void stepMoveUpPreTest_3_1_1(){
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getCommands().addUpCommand(3);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveUp();
		
		//oracle
		try{
			getLift().stepMoveUp();
		}catch(PreconditionError e){
			fail();
		}
	}
	
	
	@Test
	public void stepMoveUpPreTest_3_2_1(){
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
	public void stepMoveUpTransitionTest_3_3_1(){
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getCommands().addUpCommand(3);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveUp();
		
		//capture
		int level_atpre = getLift().getLevel();
		
		//oracle
		try{
			getLift().stepMoveUp();
		}catch(PreconditionError e){
			fail();
		}
		
		assertTrue(getLift().getLevel() == level_atpre + 1);
	}
	
	
	@Test
	public void endMoveUpPreTest_4_1_1(){
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getCommands().addUpCommand(3);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveUp();
		getLift().stepMoveUp();
		//oracle
		try{
			getLift().endMoveUp();
		}catch(PreconditionError e){
			fail();
		}
	}
	
	@Test
	public void endMoveUpPreTest_4_2_1(){
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
	public void endMoveUpTransitionTest_4_3_1(){
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getCommands().addUpCommand(3);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveUp();
		getLift().stepMoveUp();
		
		//capture
		int nbCommand_atpre = getCommands().getNbUpCommands();
		
		//oracle
		try{
			getLift().endMoveUp();
		}catch(PreconditionError e){
			fail();
		}
		
		assertTrue(getLift().getLiftStatus() == LiftStatus.STOP_UP &&
				getCommands().getNbUpCommands() == nbCommand_atpre - 1);
	}
	
	
	@Test
	//probleme les preconditions sont vérifiées mais les implantations ne verifie pas les post conditions
	public void beginMoveDownPreTest_5_1_1(){
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getCommands().addUpCommand(3);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveUp();
		getLift().stepMoveUp();
		getLift().endMoveUp();
		getLift().openDoor();
		getLift().doorAck();
		getCommands().addDownCommand(2);
		getLift().closeDoor();
		getLift().doorAck();
		
		
		//oracle
		try{
			getLift().beginMoveDown();
		}catch(PreconditionError e){
			e.printStackTrace();
			fail();
		}
	}
	
	
	
	@Test
	public void beginMoveDownPreTest_5_2_1(){
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
	//probleme les preconditions sont vérifiées mais les implantations ne verifie pas les post conditions
	public void beginMoveDownTransitionTest_5_3_1(){
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getCommands().addUpCommand(3);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveUp();
		getLift().stepMoveUp();
		getLift().endMoveUp();
		getLift().openDoor();
		getLift().doorAck();
		getCommands().addDownCommand(2);
		getLift().closeDoor();
		getLift().doorAck();
		
		
		//oracle
		try{
			getLift().beginMoveDown();
		}catch(PreconditionError e){
			e.printStackTrace();
			fail();
		}
		
		assertTrue(getLift().getLiftStatus() == LiftStatus.MOVING_DOWN);
	}
	
	@Test
	//probleme les preconditions sont vérifiées mais les implantations ne verifie pas les post conditions
	public void stepMoveDownPreTest_6_1_1(){
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getCommands().addUpCommand(3);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveUp();
		getLift().stepMoveUp();
		getLift().endMoveUp();
		getLift().openDoor();
		getLift().doorAck();
		getCommands().addDownCommand(2);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveDown();
		
		//oracle
		try{
			getLift().stepMoveDown();
		}catch(PreconditionError e){
			e.printStackTrace();
			fail();
		}
	}
	
	
	@Test
	public void stepMoveDownPreTest_6_2_1(){
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
	//probleme les preconditions sont vérifiées mais les implantations ne verifie pas les post conditions
	public void stepMoveDownTransitionTest_6_3_1(){
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getCommands().addUpCommand(3);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveUp();
		getLift().stepMoveUp();
		getLift().endMoveUp();
		getLift().openDoor();
		getLift().doorAck();
		getCommands().addDownCommand(2);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveDown();
		
		int level_atpre = getLift().getLevel();
		
		//oracle
		try{
			getLift().stepMoveDown();
		}catch(PreconditionError e){
			e.printStackTrace();
			fail();
		}
		
		assertTrue(getLift().getLevel() == level_atpre - 1);
	}
	
	
	@Test
	//probleme les preconditions sont vérifiées mais les implantations ne verifie pas les post conditions
	public void endMoveDownPreTest_7_1_1(){
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		beforeTests();
		getLift().init(2, 5);
		getCommands().addUpCommand(3);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveUp();
		getLift().stepMoveUp();
		getLift().endMoveUp();
		getLift().openDoor();
		getLift().doorAck();
		getCommands().addDownCommand(2);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveDown();
		getLift().stepMoveDown();
		
		//oracle
		try{
			getLift().endMoveDown();
			fail();
		}catch(PreconditionError e){}
	}
	
	
	@Test
	public void endMoveDownPreTest_7_2_1(){
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
	//probleme les preconditions sont vérifiées mais les implantations ne verifie pas les post conditions
	public void endMoveDownTransitionTest_7_3_1(){
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		beforeTests();
		getLift().init(2, 5);
		getCommands().addUpCommand(3);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveUp();
		getLift().stepMoveUp();
		getLift().endMoveUp();
		getLift().openDoor();
		getLift().doorAck();
		getCommands().addDownCommand(2);
		getLift().closeDoor();
		getLift().doorAck();
		getLift().beginMoveDown();
		getLift().stepMoveDown();
		
		int nbCommands_atpre = getCommands().getNbDownCommands();
		
		//oracle
		try{
			getLift().endMoveDown();
			fail();
		}catch(PreconditionError e){}
		
		assertTrue(getLift().getLiftStatus() == LiftStatus.STOP_DOWN &&
				getCommands().getNbDownCommands() == nbCommands_atpre - 1);
	}
	
	
	@Test
	public void openDoorPreTest_8_1_1(){
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
		
		
	}
	
	@Test
	public void openDoorPreTest_8_2_1(){
		//cas negatif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		
		try{
			getLift().openDoor();
			fail();
		}catch(PreconditionError e){}
	}
	
	
	@Test
	public void openDoorTransitionTest_8_3_1(){
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
		
		assertTrue(getLift().getDoorStatus() == DoorStatus.OPENING);
		
		
	}
	
	
	@Test
	public void closeDoorPreTest_9_1_1() {
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		
		try {
			getLift().closeDoor();
		}catch(PreconditionError e) {
			fail();
		}
	}
	
	@Test
	public void closeDoorPreTest_9_2_1() {
		//cas negatif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getLift().closeDoor();
		
		try {
			getLift().closeDoor();
			fail();
		}catch(PreconditionError e) {
			
		}
	}
	
	@Test
	public void closeDoorTransitionTest_9_3_1() {
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		
		try {
			getLift().closeDoor();
		}catch(PreconditionError e) {
			fail();
		}
		
		assertTrue(getLift().getDoorStatus() == DoorStatus.CLOSING);
	}
	
	
	@Test
	public void doorAckPreTest_10_1_1() {
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getLift().closeDoor();
		
		try {
			getLift().doorAck();
		}catch(PreconditionError e) {
			fail();
		}
	}
	
	@Test
	public void doorAckPreTest_10_2_1() {
		//cas negatif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		
		try {
			getLift().doorAck();
			fail();
		}catch(PreconditionError e) {
			
		}
	}
	
	@Test
	public void doorAckPreTest_10_2_2() {
		//cas negatif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getLift().closeDoor();
		getLift().doorAck();
		
		try {
			getLift().doorAck();
			fail();
		}catch(PreconditionError e) {
			
		}
	}
	
	@Test
	public void doorAckTransitionTest_10_3_1() {
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		getLift().closeDoor();
		
		try {
			getLift().doorAck();
		}catch(PreconditionError e) {
			fail();
		}
		
		assertTrue(getLift().getDoorStatus() == DoorStatus.CLOSED &&
				getLift().getLiftStatus() == LiftStatus.IDLE);
	}
	
	
	@Test
	public void selectLevelPreTest_11_1_1() {
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		
		try {
			getLift().selectLevel(3);
		}catch(PreconditionError e) {
			fail();
		}
	}
	
	
	@Test
	public void selectLevelPreTest_11_2_1() {
		//cas negatif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		
		try {
			getLift().selectLevel(6);
			fail();
		}catch(PreconditionError e) {
			
		}
	}
	
	@Test
	public void selectLevelTransitionTest_11_3_1() {
		//cas positif
		//conditions initiales
		beforeTests();
		getLift().init(2, 5);
		
		int nbCommands_atpre = getCommands().getNbUpCommands();
		
		try {
			getLift().selectLevel(3);
		}catch(PreconditionError e) {
			fail();
		}
		
		assertTrue(getCommands().getNbUpCommands() == nbCommands_atpre + 1);
	}
	
}
