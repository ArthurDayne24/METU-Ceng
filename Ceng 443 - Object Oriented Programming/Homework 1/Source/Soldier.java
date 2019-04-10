
/**
 *  This is the Abstract Soldier Class that extends Simulation Object
 *  The aim of the making this class abstract is to be able to add new kind of Soldiers in the future.
 *  Whenever new Soldier Type is added to the Simulation, it extends the Soldier Class and with this way, it also extends Simulation Object Class.
 *
 *  A Soldier is created in main and its sub-classes calls its constructor with super().
 *  A Soldier has ability to create Bullet and kill a zombie with it.
 *  A Soldier stays alive if there is no Zombies at the end of the simulation.
 *  Collision range is used to determine whether a Zombie can kill him or not in that range.
 *  Shooting range is used to determine the state of the Soldier. If there is a Zombie inside that range, it focuses to the that Zombie.
 *  Collision and Shooting range differ in sub-classes.
 *
 */
public abstract class Soldier extends SimulationObject {
    private double collisionRange;
    private double shootingRange;
    private SoldierState soldierState;

    /**
     * Default Constructor
     */
    public Soldier(){
        super();

    }

    /**
     * Constructor
     * Initialize the first state of the Soldier as SEARCHING
     * Randomize the initial direction of Soldier
     * @param name of the Soldier.
     * @param position of the Soldier.
     */
    protected Soldier(String name, Position position, double speed){
        super(name,position,speed);
        setSoldierState(SoldierState.SEARCHING);
        setDirection(Position.generateRandomDirection(true));
    }

    /**
     * Getter of the collisionRange
     * @return Collision Range of the Soldier.
     */
    double getCollisionRange() {
        return collisionRange;
    }

    /**
     * Getter of the shootingRange
     * @return Shooting Range of the Soldier.
     */
    double getShootingRange() {
        return shootingRange;
    }

    /**
     * Setter of the collisionRange attribute.
     * @param collisionRange of the Soldier
     */
    void setCollisionRange(double collisionRange) {
        this.collisionRange = collisionRange;
    }

    /**
     * Setter of the shootingRange attribute.
     * @param shootingRange of the Soldier
     */
    void setShootingRange(double shootingRange) {
        this.shootingRange = shootingRange;
    }

    /**
     * Getter of the soldierState.
     * @return Soldier State of the Soldier.
     */
    SoldierState getSoldierState() {
        return soldierState;
    }

    /**
     * Setter of the soldierState
     * @param soldierState of the Soldier
     */
    void setSoldierState(SoldierState soldierState) {
        this.soldierState = soldierState;
    }

    /**
     * This is the overrode function in order to add any kind of Soldier to the Soldier List.
     * @param controller is the owner of the Soldier list
     */
    @Override
    protected void addSimulationObjectWithType(SimulationController controller) {
        controller.addSoldier(this);
    }

    /**
     * This is the overrode function in order to remove any kind of Soldier in the Soldier List.
     * @param controller is the owner of the Soldier list
     */
    @Override
    protected void removeSimulationObjectWithType(SimulationController controller) {
        controller.removeSoldier(this);
    }


    /**
     * This method creates Bullet and adds it to the Simulation.
     * Position of the Bullet is the same with the Soldier who creates it.
     * When the Bullet is created, information printed is which soldier fired the Bullet and which direction to.
     * @param controller is the main Simulation Controller of the simulation.
     * @param bulletSpeed is the speed of the bullet which changes with respect to Soldier Type.
     */
    void createBullet(SimulationController controller, double bulletSpeed){
        Bullet bullet = new Bullet("Bullet" + controller.getBulletCount(), getPosition(), bulletSpeed);
        controller.incBulletCount();
        bullet.setNewAdded(true);
        bullet.setDirection(getDirection());
        controller.addSimulationObject(bullet);
        System.out.println(getName() + " fired " + bullet.getName() + " to direction " + bullet.getDirection() + ".");

    }

    /**
     * This method is called only by Regular Soldier and Sniper sub-classes.
     * Since behaviours of the both Regular Soldier and Sniper sub-classes, which are in the AIMING state, are the same, this method is called for both.
     * Aiming behaviours of the soldiers are implemented.
     * Information printed is whether direction changing information and new state of soldier (SHOOTING) or only the state (SEARCHING).
     * @param controller is the main Simulation Controller of the simulation.
     */
    void aimingBehaviour(SimulationController controller){
        int indexOfMinZombie = findMinimumZombieIndex(controller.getZombies());
        double minDistance = getPosition().distance(controller.getZombies().get(indexOfMinZombie).getPosition());

        if (minDistance <= getShootingRange()){
            setDirection(changeToDesiredDirection(controller.getZombies().get(indexOfMinZombie).getPosition()));
            System.out.println(getName() + " changed direction to " + getDirection() + ".");

            setSoldierState(SoldierState.SHOOTING);
            System.out.println(getName() + " changed state to SHOOTING.");
        }
        else{
            setSoldierState(SoldierState.SEARCHING);
            System.out.println(getName() + " changed state to SEARCHING.");
        }


    }
}
