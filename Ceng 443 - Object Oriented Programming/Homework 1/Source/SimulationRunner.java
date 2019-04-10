import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * This is the class that contains main function.
 * Simulation is started from this class.
 * All the initial Simulation Objects with given name and position are created here.
 * It controls if the game is finished or not.
 * All step function is called each round in this class.
 *
 */
public class SimulationRunner {

    public static void main(String[] args) {
        SimulationController simulation = new SimulationController(50, 50);


        simulation.addSimulationObject(new RegularSoldier("Soldier1", new Position(10, 10)));
        simulation.addSimulationObject(new Commando("Soldier2", new Position(20, 10)));
        simulation.addSimulationObject(new Sniper("Soldier3", new Position(30, 10)));
        simulation.addSimulationObject(new SlowZombie("Zombie3", new Position(10, 40)));
        simulation.addSimulationObject(new FastZombie("Zombie2", new Position(20, 40)));
        simulation.addSimulationObject(new RegularZombie("Zombie1", new Position(40, 40)));


        while (!simulation.isFinished()) {
            simulation.stepAll();
            try {
                Thread.sleep(100);
            } catch (InterruptedException ex) {
                Logger.getLogger(SimulationRunner.class.getName()).log(Level.SEVERE, null, ex);
            }
        }


    }
}
