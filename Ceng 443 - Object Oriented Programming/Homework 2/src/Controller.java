import java.util.ArrayList;

public class Controller {
    private static ArrayList<Smelter> smelters;
    private static ArrayList<Constructor> constructors;
    private static ArrayList<Transporter> transporters;
    public Controller(){
        setSmelters(new ArrayList<>());
        setConstructors(new ArrayList<>());
        setTransporters(new ArrayList<>());
    }

    public ArrayList<Smelter> getSmelters() {
        return smelters;
    }

    public void setSmelters(ArrayList<Smelter> smelterList) {
        smelters = smelterList;
    }

    public ArrayList<Constructor> getConstructors() {
        return constructors;
    }

    public void setConstructors(ArrayList<Constructor> constructorList) {
        constructors = constructorList;
    }

    public synchronized ArrayList<Transporter> getTransporter() {
        return transporters;
    }

    public void setTransporters(ArrayList<Transporter> transporterList) {
        transporters = transporterList;
    }

}
