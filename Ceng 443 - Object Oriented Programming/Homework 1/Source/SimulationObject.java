import java.util.ArrayList;

/**
 * This is the class that all Simulation Objects (Soldier, Zombie and Bullet) are inherited from.
 * All the similar attributes and functions are defined here.
 * Name, position, direction, speed and activeness are common attributes of the objects
 * newAdded attribute is used to determine whether bullet is newly added or not.
 *
 */
public abstract class SimulationObject {
    private String name;
    private Position position;
    private Position direction;
    private double speed;
    private boolean active;
    private boolean newAdded;

    /**
     * Default Constructor
     */
    public SimulationObject(){
        name = "";
        speed = 0;
    }

    /**
     * This is the called constructor in the subclasses and initialize all the parameters here.
     * @param name of the Simulation Object
     * @param position of the Simulation Object
     * @param speed of the Simulation Object
     */
    public SimulationObject(String name, Position position, double speed) {
        this.name = name;
        this.position = position;
        this.speed = speed;
        this.direction = null;
        this.active = true;
        this.newAdded = false;
    }

    /**
     * This is the abstract function that is implemented in sub-classes.
     * Each subclass have to add itself to the their related list in the controller.
     * With this function, I prevent to check type of the classes in the code.
     * Each subclasses do their job on their own.
     * @param controller in order to reach and add the Object to the right Array list.
     */
    protected abstract void addSimulationObjectWithType(SimulationController controller);

    /**
     * This is the abstract function that is implemented in sub-classes.
     * Each subclass have to remove itself from the their related list in the controller.
     * With this function, I prevent to check type of the classes in the code.
     * Each subclasses do their job on their own.
     * @param controller in order to reach and remove the Object from the right Array list.
     */
    protected abstract void removeSimulationObjectWithType(SimulationController controller);

    /**
     * Getter of the newAdded
     * @return boolean newAdded
     */
    public boolean isNewAdded() {
        return newAdded;
    }

    /**
     * Setter of the newAdded
     * @param newAdded desired value
     */
    public void setNewAdded(boolean newAdded) {
        this.newAdded = newAdded;
    }

    /**
     * Getter of the name
     * @return String name of the Object
     */
    public String getName() {
        return name;
    }

    /**
     * Setter of the newAdded
     * @param name desired value
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Getter of the position.
     * @return Position of the Object
     */
    public Position getPosition() {
        return position;
    }

    /**
     * Setter of the position
     * @param position desired value
     */
    public void setPosition(Position position) {
        this.position = position;
    }

    /**
     * Getter of the direction.
     * @return Direction of the Object
     */
    public Position getDirection() {
        return direction;
    }

    /**
     * Setter of the direction
     * @param direction desired value
     */
    public void setDirection(Position direction) {
        this.direction = direction;
    }


    /**
     * Getter of the speed.
     * @return speed of the Object
     */
    public double getSpeed() {
        return speed;
    }

    /**
     * Setter of the speed
     * @param speed desired value
     */
    public void setSpeed(double speed){
        this.speed = speed;
    }


    /**
     * Getter of the active.
     * @return activeness of the Object
     */
    public boolean isActive(){
        return active;
    }

    /**
     * Setter of the active
     * Always sets false, because all the objects are initially active.
     */
    void setActiveFalse() {
        this.active = false;
    }


    /**
     * This method finds the index of the closest Zombie to the Bullet or Soldier in the Simulation.
     * @param zombies is the ArrayList of the zombies who are alive in the simulation.
     * @return index of the closest Zombie to the Bullet or Soldier.
     */
    public int findMinimumZombieIndex(ArrayList<Zombie> zombies){
        int zombieSize = zombies.size();
        double minDistance = Double.MAX_VALUE;
        double tempDistance;
        int minDistanceIndex = -1;
        for(int i = 0; i < zombieSize; i++){
            if (zombies.get(i).isActive()){
                tempDistance = zombies.get(i).getPosition().distance(getPosition());
                if ( minDistance > tempDistance){
                    minDistance = tempDistance;
                    minDistanceIndex = i;
                }
            }
        }
        return minDistanceIndex;
    }

    /**
     * This method finds the index of the closest Soldier to the Zombie in the Simulation.
     * @param soldiers is the ArrayList of the soldiers who are alive in the simulation.
     * @return index of the closest Soldier to the Zombie.
     */
    public int findMinimumSoldierIndex(ArrayList<Soldier> soldiers){
        int soldierSize = soldiers.size();
        double minDistance = Double.MAX_VALUE;
        double tempDistance;
        int minDistanceIndex = -1;
        for(int i = 0; i < soldierSize; i++){
            if (soldiers.get(i).isActive()){
                tempDistance = soldiers.get(i).getPosition().distance(getPosition());
                if ( minDistance > tempDistance){
                    minDistance = tempDistance;
                    minDistanceIndex = i;
                }
            }
        }

        return minDistanceIndex;
    }

    /**
     * This method allow Simulation Object to change its direction to the desired direction.
     * @param desired is the desired direction which is focused by Simulation Object.
     * @return new Direction of the Simulation Object.
     */
    public Position changeToDesiredDirection(Position desired) {
        Position newDirection = new Position(desired.getX() - getPosition().getX(), desired.getY() - getPosition().getY());
        newDirection.normalize();
        return newDirection;
    }


    /**
     * This is the method that calculates the next Position of the Simulation Object.
     * First it multiply the Direction with the Position and adds the result to the current Position.
     * @return new Position of the Simulation Object.
     */
    public Position getNextPosition(){
        Position nextPosition;
        nextPosition = getDirection().multWithReturn(getSpeed());
        nextPosition.add(getPosition());
        return nextPosition;
    }

    /**
     * This is the abstract method that overrode in each soldier, zombie and bullet.
     * Since every Simulation Objects have unique step movement capabilities, it has to be abstract and implemented in each sub-classes
     * @param controller is the owner of the all the lists and map.
     */
    public abstract void step(SimulationController controller);
}
