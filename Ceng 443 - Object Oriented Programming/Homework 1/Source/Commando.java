
/**
 *  This is the Commando Class that extends Soldier that extends Simulation Object.
 *  A Commando is created in main and information are given which are his name and position.
 *  It has all abilities of the Soldier class.
 */
public class Commando extends Soldier {

    /**
     * This is the called constructor in the main.
     * It calls super by adding speed of the Commando to the constructor.
     * Commando has unique speed, collision range and shooting range.
     * They are all set in this constructor.
     * @param name of the Soldier.
     * @param position is the initial Position of the Soldier.
     */
    Commando(String name, Position position) { // DO NOT CHANGE PARAMETERS
        super(name, position, Constants.COMMANDO_SPEED);
        setCollisionRange(Constants.COMMANDO_COLLISION_RANGE);
        setShootingRange(Constants.COMMANDO_SHOOTING_RANGE);
    }


    /**
     * Each Soldier has different step behaviour and this is the function that implements Commando behaviour.
     * All soldiers have 3 kind of state and they step depending on these states which are SEARCHING, AIMING, SHOOTING.
     * And there are information prints.
     * Prints invoked whenever Commando change Position, Direction and State.
     * All the behaviours which are explained in the Homework pdf are correctly implemented. You can look to the pdf.
     * @param controller which contains all the simulation objects of the simulation.
     */
    @Override
    public void step(SimulationController controller) {
        if (getSoldierState() == SoldierState.SEARCHING){
            int indexOfMinZombie = findMinimumZombieIndex(controller.getZombies());
            double minDistance = getPosition().distance(controller.getZombies().get(indexOfMinZombie).getPosition());
            if (minDistance <= getShootingRange()){
                setDirection(changeToDesiredDirection(controller.getZombies().get(indexOfMinZombie).getPosition()));
                System.out.println(getName() + " changed direction to " + getDirection() + ".");

                setSoldierState(SoldierState.SHOOTING);
                System.out.println(getName() + " changed state to SHOOTING.");
                return;
            }

            Position nextPosition = getNextPosition();
            if (nextPosition.checkBorders(controller.getWidth(), controller.getHeight())){
                setPosition(nextPosition);
                System.out.println(getName() + " moved to " + getPosition() + ".");

            } else{
                setDirection(Position.generateRandomDirection(true));
                System.out.println(getName() + " changed direction to " + getDirection() + ".");
            }

            indexOfMinZombie = findMinimumZombieIndex(controller.getZombies());
            minDistance = getPosition().distance(controller.getZombies().get(indexOfMinZombie).getPosition());
            if (minDistance <= getShootingRange()){
                setDirection(changeToDesiredDirection(controller.getZombies().get(indexOfMinZombie).getPosition()));
                System.out.println(getName() + " changed direction to " + getDirection());

                setSoldierState(SoldierState.SHOOTING);
                System.out.println(getName() + " changed state to SHOOTING.");
            }

        }
        else{
            createBullet(controller, Constants.COMMANDO_BULLET_SPEED);
            int indexOfMinZombie = findMinimumZombieIndex(controller.getZombies());
            double minDistance = getPosition().distance(controller.getZombies().get(indexOfMinZombie).getPosition());
            if (minDistance <= getShootingRange()){
                setDirection(changeToDesiredDirection(controller.getZombies().get(indexOfMinZombie).getPosition()));
                System.out.println(getName() + " changed direction to " + getDirection() + ".");

            } else{
                setDirection(Position.generateRandomDirection(true));
                System.out.println(getName() + " changed direction to " + getDirection() + ".");

                setSoldierState(SoldierState.SEARCHING);
                System.out.println(getName() + " changed state to SEARCHING.");
            }

        }
    }
}
