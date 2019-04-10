
/**
 *  This is the Sniper Class that extends Soldier that extends Simulation Object.
 *  A Sniper is created in main and information are given which are his name and position.
 *  It has all abilities of the Soldier class.
 */
public class Sniper extends Soldier {

    /**
     * This is the called constructor in the main.
     * It calls super by adding speed of the Sniper to the constructor.
     * Sniper has unique speed, collision range and shooting range.
     * They are all set in this constructor.
     * @param name of the Soldier.
     * @param position is the initial Position of the Soldier.
     */
    Sniper(String name, Position position) { // DO NOT CHANGE PARAMETERS
        super(name, position, Constants.SNIPER_SPEED);
        setCollisionRange(Constants.SNIPER_COLLISION_RANGE);
        setShootingRange(Constants.SNIPER_SHOOTING_RANGE);
    }

    /**
     * Each Soldier has different step behaviour and this is the function that implements Sniper behaviour.
     * All soldiers have 3 kind of state and they step depending on these states which are SEARCHING, AIMING, SHOOTING.
     * And there are information prints.
     * Prints invoked whenever Sniper change Position, Direction and State.
     * All the behaviours which are explained in the Homework pdf are correctly implemented. You can look to the pdf.
     * @param controller which contains all the simulation objects of the simulation.
     */
    @Override
    public void step(SimulationController controller) {
        if (getSoldierState() == SoldierState.SEARCHING){
            Position nextPosition = getNextPosition();
            if (nextPosition.checkBorders(controller.getWidth(), controller.getHeight())){
                setPosition(nextPosition);
                System.out.println(getName() + " moved to " + getPosition() + ".");

            }
            else{
                setDirection(Position.generateRandomDirection(true));
                System.out.println(getName() + " changed direction to " + getDirection() + ".");

            }
            setSoldierState(SoldierState.AIMING);
            System.out.println(getName() + " changed state to AIMING.");

        }
        else if (getSoldierState() == SoldierState.AIMING){
            aimingBehaviour(controller);
        }
        else{
            createBullet(controller, Constants.SNIPER_BULLET_SPEED);

            int indexOfMinZombie = findMinimumZombieIndex(controller.getZombies());
            double minDistance = getPosition().distance(controller.getZombies().get(indexOfMinZombie).getPosition());

            if (minDistance <= getShootingRange()){
                setSoldierState(SoldierState.AIMING);
                System.out.println(getName() + " changed state to AIMING.");

            }
            else{
                setDirection(Position.generateRandomDirection(true));
                System.out.println(getName() + " changed direction to " + getDirection() + ".");

                setSoldierState(SoldierState.SEARCHING);
                System.out.println(getName() + " changed state to SEARCHING.");
            }

        }
    }
}
