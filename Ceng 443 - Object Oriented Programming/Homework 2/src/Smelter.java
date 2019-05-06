import java.util.Random;
import java.util.concurrent.Semaphore;
import java.util.stream.DoubleStream;

public class Smelter extends Thread{
    private int id;
    private int delayAmount;
    private int maxProductNo;
    private int currentOre;
    private Semaphore emptySem;
    private Semaphore produceSem;

    public Smelter() {

    }

    public Smelter(int id, int delayAmount, int storageCapacity, int maxProductNo){
        setId(id);
        setDelayAmount(delayAmount);
        setMaxProductNo(maxProductNo);
        setProduceSem(new Semaphore(0));
        setEmptySem(new Semaphore(storageCapacity));

        setCurrentOre(0);
//        run();
    }

    public void run() {
        HW2Logger.WriteOutput(getSmelId(), 0, 0, Action.SMELTER_CREATED);


        while(getMaxProductNo()>0){

            try {
//                System.out.println("Counter  id: " + getId() + "->> " + getMaxProductNo());
                emptySem.acquire();
                HW2Logger.WriteOutput(getSmelId(), 0, 0, Action.SMELTER_STARTED);
                sleepFunc();

                Simulator.smelterSemaphores.get(getSmelId()-1).acquire();

                setMaxProductNo(getMaxProductNo()-1);
                currentOre++;

                Simulator.smelterSemaphores.get(getSmelId()-1).release();
                produceSem.release();

                HW2Logger.WriteOutput(getSmelId(), 0, 0, Action.SMELTER_FINISHED);
                sleepFunc();

            } catch (InterruptedException e) {
                e.printStackTrace();
            }

        }

        for (int i = 0; i < Simulator.controller.getTransporter().size(); i++){
            if (Simulator.controller.getTransporter().get(i).getSmelterID() == getSmelId())
                produceSem.release();
        }

        HW2Logger.WriteOutput(getSmelId(),0,0,Action.SMELTER_STOPPED);

    }

    public int getSmelId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }



    public int getDelayAmount() {
        return delayAmount;
    }

    public void setDelayAmount(int delayAmount) {
        this.delayAmount = delayAmount;
    }

    public int getMaxProductNo() {
        return maxProductNo;
    }

    public void setMaxProductNo(int maxProductNo) {
        this.maxProductNo = maxProductNo;
    }

    public Semaphore getEmptySem() {
        return emptySem;
    }

    public void setEmptySem(Semaphore emptySem) {
        this.emptySem = emptySem;
    }

    public Semaphore getProduceSem() {
        return produceSem;
    }

    public void setProduceSem(Semaphore produceSem) {
        this.produceSem = produceSem;
    }

    public int getCurrentOre() {
        return currentOre;
    }

    public void setCurrentOre(int currentOre) {
        this.currentOre = currentOre;
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
