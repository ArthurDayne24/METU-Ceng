import java.util.Random;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import java.util.stream.DoubleStream;

public class Constructor extends Thread{
    private int id;
    private int delayAmount;
    private int ignotType;
    private int currentOre;
    private Semaphore receiveSem;
    private Semaphore transportSem;
    private int numberOfWaitIgnot;
    private boolean isAlive;

    public Constructor(){

    }

    public Constructor(int id, int delayAmount, int storageCapacity, int ignotType){
        setId(id);
        setCurrentOre(0);
        setDelayAmount(delayAmount);
        setAlive(true);
        setIgnotType(ignotType);
        if (getIgnotType() == 0)
            numberOfWaitIgnot = 2;
        else
            numberOfWaitIgnot= 3;
        setReceiveSem(new Semaphore(0));
        setTransportSem(new Semaphore(storageCapacity));
    }

    public void run() {

        HW2Logger.WriteOutput(0, 0, getConsId(), Action.CONSTRUCTOR_CREATED);


        while (true){

            try {
                if(!getReceiveSem().tryAcquire(3,3 , TimeUnit.SECONDS)){
                    try {
                        Simulator.constructorSemaphores.get(getConsId()-1).acquire();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    setAlive(false);
                    Simulator.constructorSemaphores.get(getConsId()-1).release();
                    break;
                }



            } catch (InterruptedException e) {
                e.printStackTrace();
            }



            HW2Logger.WriteOutput(0,0,getConsId(), Action.CONSTRUCTOR_STARTED);

            try {
                Simulator.constructorSemaphores.get(getConsId()-1).acquire();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            for (int i = 0; i< numberOfWaitIgnot; i++){
                currentOre--;
            }
            Simulator.constructorSemaphores.get(getConsId()-1).release();

            sleepFunc();
            HW2Logger.WriteOutput(0,0,getConsId(), Action.CONSTRUCTOR_FINISHED);


            for (int i= 0; i < numberOfWaitIgnot; i++)
                getTransportSem().release();



        }

        HW2Logger.WriteOutput(0,0,getConsId(), Action.CONSTRUCTOR_STOPPED);



    }

    public int getConsId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIgnotType() {
        return ignotType;
    }

    public void setIgnotType(int ignotType) {
        this.ignotType = ignotType;
    }

    public int getDelayAmount() {
        return delayAmount;
    }

    public void setDelayAmount(int delayAmount) {
        this.delayAmount = delayAmount;
    }

    public Semaphore getReceiveSem() {
        return receiveSem;
    }

    public void setReceiveSem(Semaphore receiveSem) {
        this.receiveSem = receiveSem;
    }

    public Semaphore getTransportSem() {
        return transportSem;
    }

    public void setTransportSem(Semaphore transportSem) {
        this.transportSem = transportSem;
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

    public int getCurrentOre() {
        return currentOre;
    }

    public void setCurrentOre(int currentOre) {
        this.currentOre = currentOre;
    }

    public boolean isConsAlive() {
        return isAlive;
    }

    public void setAlive(boolean alive) {
        isAlive = alive;
    }

}
