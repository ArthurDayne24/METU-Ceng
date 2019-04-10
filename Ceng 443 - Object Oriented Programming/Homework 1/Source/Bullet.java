/**
 * This is the Bullet Class that extends Simulation Object.
 * A Bullet is created whenever a Soldier in the SHOOTING state shoots to Zombie.
 * A Bullet has ability to kill Zombie.
 * A Bullet can only take one step and is removed afterwards.
 */
public class Bullet extends SimulationObject {

    /**
     * Constructor of the Bullet
     * @param name of the Bullet.
     * @param position of the Bullet which is as same as the soldier who fired it.
     * @param speed is the speed of the Bullet which changes with respect to Soldier Type.
     */
    public Bullet(String name, Position position, double speed){
        super(name,position,speed);

    }

    /**
     * Bullet adds itself to the simulation.
     * It is overrode in order to prevent any type checking in run-time.
     * @param controller is the main Simulation Controller of the simulation.
     */
    @Override
    protected void addSimulationObjectWithType(SimulationController controller) {
        controller.addBullet(this);
    }

    /**
     * Bullet removes itself from the simulation.
     * It is overrode in order to prevent any type checking in run-time.
     * @param controller is the main Simulation Controller of the simulation.
     */
    @Override
    protected void removeSimulationObjectWithType(SimulationController controller) {
        controller.removeBullet(this);
    }

    /**
     * This is the method where Bullet moves and checks whether it hits any zombie or not.
     * If it hits the zombie, the zombie turns its active state to false in order to be removed after the stepAll function.
     * There are different prints depending on the condition.
     * Bullet has three condition. It can hit Zombie, it can move out of the map or it drops to the ground.
     * @param controller is the main Simulation Controller of the simulation.
     */
    @Override
    public void step(SimulationController controller) {
        int indexOfMinZombie;
        double minDistance;
        int i;
        for (i= 0; i< getSpeed()+1; i++){
            indexOfMinZombie = findMinimumZombieIndex(controller.getZombies());
            if( indexOfMinZombie == -1 )
                return;
            minDistance = getPosition().distance(controller.getZombies().get(indexOfMinZombie).getPosition());
            if (minDistance <= controller.getZombies().get(indexOfMinZombie).getCollisionRange()){
                controller.getZombies().get(indexOfMinZombie).setActiveFalse();
                setActiveFalse();
                System.out.println(getName() + " hit " + controller.getZombies().get(indexOfMinZombie).getName() + ".");
                break;
            }
            setPosition(getNextPosition());
            if(!getPosition().checkBorders(controller.getWidth(),controller.getHeight())){
                setActiveFalse();
                System.out.println(getName() + " moved out of bounds.");
                break;
            }
        }
        if (i == getSpeed())
            System.out.println(getName() + " dropped to the ground at " + getPosition() + ".");

        setActiveFalse();

    }

    /**
     * This is the overrode method because of the specific movement of the bullet.
     * It calculates the basic step of the Bullet.
     * This method is called in for loop in order to see whether bullet hit the any zombie in its way.
     * @return new Position of the Bullet
     */
    @Override
    public Position getNextPosition() {
        Position newPosition;
        newPosition = getDirection().multWithReturn(1.0);
        return  getPosition().addWithReturn(newPosition);
    }

}
