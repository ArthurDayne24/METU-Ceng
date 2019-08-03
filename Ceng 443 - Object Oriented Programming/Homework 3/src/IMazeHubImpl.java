import java.io.Serializable;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;

public class IMazeHubImpl extends UnicastRemoteObject implements IMazeHub, Serializable {
    private ArrayList<IMaze> mazes = new ArrayList<>();

    public IMazeHubImpl() throws RemoteException {
    }

    @Override
    public void createMaze(int width, int height) throws RemoteException {
        if (height > 0 && width > 0){
            IMazeImpl newMaze = new IMazeImpl();
            newMaze.create(height,width);
            this.mazes.add(newMaze);
        }
    }

    @Override
    public IMaze getMaze(int index) throws RemoteException {
        if (index < mazes.size() && index>=0)
            return mazes.get(index);
        else
            return null;
    }

    @Override
    public boolean removeMaze(int index) throws RemoteException {
        if (index < mazes.size() && index>=0){
            return mazes.remove(mazes.get(index));
        }
        return false;

    }

}
