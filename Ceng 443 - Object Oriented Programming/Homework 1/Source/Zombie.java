/**
 *  This is the Abstract Zombie Class that extends Simulation Object
 *  The aim of the making this class abstract is to be able to add new kind of Zombies in the future.
 *  Whenever new Zombie Type is added to the Simulation, it extends the Zombie Class and with this way, it also extends Simulation Object Class.
 *
 *  A Zombie is created in main and its sub-classes calls its constructor with super().
 *  A Zombie stays alive if there is no Soldiers at the end of the simulation.
 *  Collision range is used to determine whether the Zombie can kill Soldier or not in that range.
 *  Detection range is used to determine the state of the Zombie. If there is a Soldier inside that range, it focused to the that Soldier.
 *  Collision and Detection range differ in sub-classes.
 *
 */

public abstract class Zombie extends SimulationObject {
    private double collisionRange;
    private double detectionRange;
    private ZombieState zombieState;

    /**
     * Default Constructor
     */
    public Zombie() {
        super();
    }

    /**
     * Constructor of the Zombie
     * Initialize the first state of The Zombie as WANDERING
     * Randomize the initial direction of Zombie
     * @param name of the Zombie
     * @param position of the Zombie
     */
    public Zombie(String name, Position position, double speed) {
        super(name, position,speed);
        setZombieState(ZombieState.WANDERING);
        setDirection(Position.generateRandomDirection(true));

    }

    /**
     * Getter of the collisionRange.
     * @return Collision Range of the Zombie.
     */
    double getCollisionRange() {
        return collisionRange;
    }

    /**
     * Setter of the collisionRange attribute.
     * @param collisionRange of the zombie
     */
    void setCollisionRange(double collisionRange) {
        this.collisionRange = collisionRange;
    }

    /**
     * Getter of the detectionRange.
     * @return Detection Range of the Zombie.
     */
    double getDetectionRange() {
        return detectionRange;
    }

    /**
     * Setter of the detectionRange attribute.
     * @param detectionRange of the zombie
     */
    void setDetectionRange(double detectionRange) {
        this.detectionRange = detectionRange;
    }

    /**
     * Getter of the zombieState.
     * @return Zombie State of the Zombie.
     */
    ZombieState getZombieState() {
        return zombieState;
    }

    /**
     * Setter of the zombieState attribute.
     * @param zombieState of the zombie
     */
    void setZombieState(ZombieState zombieState) {
        this.zombieState = zombieState;
    }


    /**
     * This is the overrode function in order to add any kind of Zombie to the Zombie List.
     * @param controller is the owner of the Zombie list
     */
    @Override
    protected void addSimulationObjectWithType(SimulationController controller) {
        controller.addZombie(this);
    }

    /**
     * This is the overrode function in order to remove any kind of Zombie in the Zombie List.
     * @param controller is the owner of the Zombie list
     */
    @Override
    protected void removeSimulationObjectWithType(SimulationController controller) {
        controller.removeZombie(this);
    }

}
