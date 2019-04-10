
/**
 *  This is the Regular Zombie Class that extends Zombie that extends Simulation Object.
 *  A Regular Zombie is created in main and information are given which are his name and position.
 *  It has all abilities of the Zombie class.
 *  Difference of this Class is that step number in the Following State is counted in the stepNumber variable.
 */
public class RegularZombie extends Zombie {

    private int stepNumber;

    /**
     * This is the called constructor in the main.
     * It calls super by adding speed of the Regular Zombie to the constructor.
     * Regular Zombie has unique speed, collision range and detection range.
     * They are all set in this constructor.
     * @param name of the Zombie.
     * @param position is the initial Position of the Zombie.
     */
    RegularZombie(String name, Position position) { // DO NOT CHANGE PARAMETERS
        super(name,position,Constants.REG_ZOMBIE_SPEED);
        setCollisionRange(Constants.REG_ZOMBIE_COLLISION_RANGE);
        setDetectionRange(Constants.REG_ZOMBIE_DETECTION_RANGE);
        setStepNumberZero();
    }


    /**
     * Each Zombie has different step behaviour and this is the function that implements Regular Zombie behaviour.
     * All zombies have 2 kind of state and they step depending on these states which are WANDERING and FOLLOWING.
     * And there are information prints.
     * Prints invoked whenever the Regular Zombie  changes Position, Direction and State or kills a Soldier.
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

        Position nextPosition = getNextPosition();
        if (nextPosition.checkBorders(controller.getWidth(), controller.getHeight())){
            setPosition(nextPosition);
            System.out.println(getName() + " moved to " + getPosition() + ".");
        } else {
            setDirection(Position.generateRandomDirection(true));
            System.out.println(getName() + " changed direction to " + getDirection() + ".");

        }
        if (getZombieState() == ZombieState.WANDERING){
            setStepNumberZero();
            if (minDistance <= getDetectionRange()){
                setZombieState(ZombieState.FOLLOWING);
                System.out.println(getName() + " changed state to FOLLOWING.");
            }

        } else{
            incStepNumber();
            if (getStepNumber() >3){
                setZombieState(ZombieState.WANDERING);
                setStepNumberZero();
                System.out.println(getName() + " changed state to WANDERING.");

            }
        }

    }

    /**
     * Getter of the stepNumber.
     * @return value of the stepNumber.
     */
    private int getStepNumber() {
        return stepNumber;
    }
    /**
     * Setter of the stepNumber.
     */
    private void setStepNumberZero() {
        this.stepNumber = 0;
    }

    /**
     * Increments stepNumber by one.
     *
     */
    private void incStepNumber(){
        this.stepNumber++;
    }

}
