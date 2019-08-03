import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;

public class RMIServer {
    public static void main(String[] args) throws RemoteException, MalformedURLException {

        IMazeHub serverHub = new IMazeHubImpl();
        LocateRegistry.createRegistry(8123);
        Naming.rebind("rmi://127.0.0.1:8123/opServiceHub", serverHub);

    }
}
