import java.util.Random;
import java.util.stream.DoubleStream;

public class Transporter extends Thread{
    private int id;
    private int smelterID;
    private int delayAmount;
    private int constructorID;

    public Transporter(){

    }

    public Transporter(int id, int delayAmount, int smelterID, int constructorID){
        setId(id);
        setDelayAmount(delayAmount);
        setSmelterID(smelterID);
        setConstructorID(constructorID);

    }

    public void run() {

        HW2Logger.WriteOutput(0, getTransId(), 0, Action.TRANSPORTER_CREATED);

        try {
            while(true){
                /**
                 * TODO: CHECK PDF FOR WHILE STATE CONDITION
                 */
                Simulator.smelterSemaphores.get(smelterID-1).acquire();

                if (Simulator.controller.getSmelters().get(smelterID-1).getMaxProductNo() == 0 && !(Simulator.controller.getSmelters().get(smelterID-1).getCurrentOre() >= 0)){
                    Simulator.smelterSemaphores.get(smelterID-1).release();

                    break;
                }
                Simulator.smelterSemaphores.get(smelterID-1).release();



                Simulator.constructorSemaphores.get(constructorID-1).acquire();
                if(!Simulator.controller.getConstructors().get(constructorID-1).isConsAlive()){
                    Simulator.constructorSemaphores.get(constructorID-1).release();
                    break;
                }
                Simulator.constructorSemaphores.get(constructorID-1).release();


                Simulator.controller.getSmelters().get(smelterID-1).getProduceSem().acquire();



                Simulator.smelterSemaphores.get(smelterID-1).acquire();
                if (Simulator.controller.getSmelters().get(smelterID-1).getMaxProductNo() == 0 && !(Simulator.controller.getSmelters().get(smelterID-1).getCurrentOre() > 0)){
                    Simulator.controller.getSmelters().get(smelterID-1).getEmptySem().release();
                    Simulator.smelterSemaphores.get(smelterID-1).release();

                    break;
                }



                HW2Logger.WriteOutput(getSmelterID(),getTransId(),0,Action.TRANSPORTER_TRAVEL);
                Simulator.controller.getSmelters().get(smelterID-1).setCurrentOre(Simulator.controller.getSmelters().get(smelterID-1).getCurrentOre() -1);
                sleepFunc();
                HW2Logger.WriteOutput(getSmelterID(),getTransId(),0,Action.TRANSPORTER_TAKE_INGOT);

                sleepFunc();

                Simulator.smelterSemaphores.get(smelterID-1).release();
                Simulator.controller.getSmelters().get(smelterID-1).getEmptySem().release();

                // CONSTRUCTOR ROUTINE




                Simulator.controller.getConstructors().get(constructorID-1).getTransportSem().acquire();


                HW2Logger.WriteOutput(0,getTransId(),getConstructorID(),Action.TRANSPORTER_TRAVEL);
                sleepFunc();

                Simulator.constructorSemaphores.get(constructorID-1).acquire();

                HW2Logger.WriteOutput(0,getTransId(),getConstructorID(),Action.TRANSPORTER_DROP_INGOT);

                Simulator.controller.getConstructors().get(constructorID-1).setCurrentOre(Simulator.controller.getConstructors().get(constructorID-1).getCurrentOre()+1);
                Simulator.constructorSemaphores.get(constructorID-1).release();

                sleepFunc();

                Simulator.controller.getConstructors().get(constructorID-1).getReceiveSem().release();


            }
            HW2Logger.WriteOutput(0,getTransId(),0,Action.TRANSPORTER_STOPPED);

        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }

    public int getTransId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSmelterID() {
        return smelterID;
    }

    public void setSmelterID(int smelterID) {
        this.smelterID = smelterID;
    }

    public int getDelayAmount() {
        return delayAmount;
    }

    public void setDelayAmount(int delayAmount) {
        this.delayAmount = delayAmount;
    }

    public int getConstructorID() {
        return constructorID;
    }

    public void setConstructorID(int constructorID) {
        this.constructorID = constructorID;
    }

    private void sleepFunc(){
        Random random = new Random(System.currentTimeMillis());
        DoubleStream stream;
        stream = random.doubles(1, getDelayAmount()-getDelayAmount()*0.01, getDelayAmount()+getDelayAmount()*0.02);
        try {
            Thread.sleep((long) stream.findFirst().getAsDouble());
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
