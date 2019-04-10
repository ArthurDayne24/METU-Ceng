import java.util.ArrayList;

/**
 * This is the class that controls the simulation and the all objects inside the simulation.
 * It contains map size, Soldier Array, Zombie Array and Bullet Array.
 * All the relations and connections between objects are handled by Simulation Controller class.
 * And in order to control global bullet number, there is bullet count and when a bullet is created, name of it is depends on bullet count.
 *
 */
public class SimulationController {
    private final double height;
    private final double width;
    private ArrayList<Soldier> soldiers;
    private ArrayList<Zombie> zombies;
    private ArrayList<Bullet> bullets;
    private int bulletCount;


    /**
     * This is the constructor and everything is initialized here.
     * @param width horizontal length of the map.
     * @param height vertical length of the map.
     */
    public SimulationController(double width, double height) {
        this.width = width;
        this.height = height;
        soldiers = new ArrayList<>();
        zombies = new ArrayList<>();
        bullets = new ArrayList<>();
        bulletCount = 0;
    }

    /**
     * Getter of the height of the map
     * @return height
     */
    double getHeight() {
        return height;
    }

    /**
     * Getter of the width of the map
     * @return width
     */
    double getWidth() {
        return width;
    }

    /**
     * This is the function that triggers all the step functions of the Simulation Objects.
     * All the bullets, zombies and soldiers step in order.
     * After all the steps are completed, inactive objects are removed from their lists.
     */
    void stepAll() {
        int soldierSize = getSoldiers().size();
        int zombieSize= getZombies().size();
        int bulletSize= getBullets().size();

        for(int i = 0; i < soldierSize; i++){
            if (soldiers.get(i).isActive())
                soldiers.get(i).step(this);
        }
        for(int i = 0; i < zombieSize; i++){
            if (zombies.get(i).isActive())
                zombies.get(i).step(this);
        }
        for(int i = 0; i < bulletSize; i++){
            if (bullets.get(i).isActive() && !bullets.get(i).isNewAdded())
                bullets.get(i).step(this);
        }

        for (int i = 0; i< getBullets().size();i++){
            if (getBullets().get(i).isNewAdded()){
                getBullets().get(i).setNewAdded(false);
            }
        }



        for (int i = 0; i< getBullets().size();i++){
            if (!getBullets().get(i).isActive()){
                getBullets().get(i).removeSimulationObjectWithType(this);
                i--;
            }
        }

        for (int i = 0; i < getSoldiers().size(); i++){
            if (!getSoldiers().get(i).isActive()){
                getSoldiers().get(i).removeSimulationObjectWithType(this);
                i--;
            }

        }

        for (int i = 0; i < getZombies().size(); i++){
            if (!getZombies().get(i).isActive()){
                getZombies().get(i).removeSimulationObjectWithType(this);
                i--;
            }
        }
    }

    /**
     * This is the function that adds the Simulation object to the related Array list.
     * Each object calls ist own method to add itself to the desired list.
     * @param obj is new added object to the Simulation.
     */
    void addSimulationObject(SimulationObject obj) {
        obj.addSimulationObjectWithType(this);
    }

    /**
     * Increments bullet count by one.
     */
    void incBulletCount(){
        bulletCount++;
    }

    /**
     * Getter of the bulletCount
     * @return value of bullet count
     */
    int getBulletCount() {
        return bulletCount;
    }

    /**
     * Checks if the simulation has finished.
     * Looks to the list of zombies and soldiers.
     * @return finish state of the simulation.
     */
    boolean isFinished() {
        return zombies.size() == 0 || soldiers.size() == 0;
    }

    /**
     * Getter of the Soldier List
     * @return list of Soldier
     */
    ArrayList<Soldier> getSoldiers() {
        return soldiers;
    }

    /**
     * Getter of the Zombie List
     * @return list of Zombie
     */
    ArrayList<Zombie> getZombies() {
        return zombies;
    }

    /**
     * Adds soldier to the soldier list.
     * @param soldier new soldier in the simulation.
     */
    void addSoldier(Soldier soldier){
        this.soldiers.add(soldier);
    }

    /**
     * Adds zombie to the zombie list.
     * @param zombie is new zombie in the simulation.
     */
    void addZombie(Zombie zombie){
        this.zombies.add(zombie);
    }

    /**
     * Adds bullet to the bullet list.
     * @param bullet is new bullet created by soldier in the simulation.
     */
    void addBullet(Bullet bullet){
        this.bullets.add(bullet);
    }

    /**
     * Removes soldier from the soldier list.
     * @param soldier is desired soldier to be deleted from the simulation.
     */
    void removeSoldier(Soldier soldier){
        this.soldiers.remove(soldier);
    }

    /**
     * Removes zombie from the zombie list.
     * @param zombie is desired zombie to be deleted from the simulation.
     */
    void removeZombie(Zombie zombie){
        this.zombies.remove(zombie);
    }

    /**
     * Removes bullet from the bullet list.
     * @param bullet is desired bullet to be deleted from the simulation.
     */
    void removeBullet(Bullet bullet){
        this.bullets.remove(bullet);
    }

    /**
     * Getter of the bullet list.
     * @return list of Bullets.
     */
    private ArrayList<Bullet> getBullets() {
        return bullets;
    }

}
