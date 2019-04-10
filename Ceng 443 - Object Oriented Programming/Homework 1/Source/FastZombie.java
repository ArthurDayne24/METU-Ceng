
/**
 *  This is the Fast Zombie Class that extends Zombie that extends Simulation Object.
 *  A Fast Zombie is created in main and information are given which are his name and position.
 *  It has all abilities of the Zombie class.
 */
public class FastZombie extends Zombie {

    /**
     * This is the called constructor in the main.
     * It calls super by adding speed of the Fast Zombie to the constructor.
     * Fast Zombie has unique speed, collision range and detection range.
     * They are all set in this constructor.
     * @param name of the Zombie.
     * @param position is the initial Position of the Zombie.
     */

    FastZombie(String name, Position position) { // DO NOT CHANGE PARAMETERS
        super(name,position,Constants.FAST_ZOMBIE_SPEED);
        setCollisionRange(Constants.FAST_ZOMBIE_COLLISION_RANGE);
        setDetectionRange(Constants.FAST_ZOMBIE_DETECTION_RANGE);
    }

    /**
     * Each Zombie has different step behaviour and this is the function that implements Fast Zombie behaviour.
     * All zombies have 2 kind of state and they step depending on these states which are WANDERING and FOLLOWING.
     * And there are information prints.
     * Prints invoked whenever the Fast Zombie  changes Position, Direction and State or kills a Soldier.
     * All the behaviours which are explained in the Homework pdf are correctly implemented. You can look to the pdf.
     * @param controller which contains all the simulation objects of the simulation.
     */
    @Override
    public void step(SimulationController controller) {
        int indexOfMinSoldier = findMinimumSoldierIndex(controller.getSoldiers());
        if (indexOfMinSoldier == -1)
            return;
        double minDistance = getPosition().distance(controller.getSoldiers().get(indexOfMinSoldier).getPosition());

        if (minDistance <= getCollisionRange() + controller.getSoldiers().get(indexOfMinSoldier).getCollisionRange()){
            controller.getSoldiers().get(indexOfMinSoldier).setActiveFalse();
            System.out.println(getName() + " killed " + controller.getSoldiers().get(indexOfMinSoldier).getName() + ".");
            return;
        }
        if (getZombieState() == ZombieState.WANDERING){
            if (minDistance <= getDetectionRange()){
                setDirection(changeToDesiredDirection(controller.getSoldiers().get(indexOfMinSoldier).getPosition()));
                setZombieState(ZombieState.FOLLOWING);
                System.out.println(getName() + " changed direction to " + getDirection() + ".");
                System.out.println(getName() + " changed state to FOLLOWING.");
            } else {
                Position nextPosition = getNextPosition();
                if (nextPosition.checkBorders(controller.getWidth(), controller.getHeight())){
                    setPosition(nextPosition);
                    System.out.println(getName() + " moved to " + getPosition() + ".");

                } else {
                    setDirection(Position.generateRandomDirection(true));
                    System.out.println(getName() + " changed direction to " + getDirection() + ".");
                }
            }
        } else {
            Position nextPosition = getNextPosition();
            if (nextPosition.checkBorders(controller.getWidth(), controller.getHeight())){
                setPosition(nextPosition);
                System.out.println(getName() + " moved to " + getPosition() + ".");
            } else {
                setDirection(Position.generateRandomDirection(true));
                System.out.println(getName() + " changed direction to " + getDirection() + ".");
            }
            setZombieState(ZombieState.WANDERING);
            System.out.println(getName() + " changed state to WANDERING.");



        }
    }
}
