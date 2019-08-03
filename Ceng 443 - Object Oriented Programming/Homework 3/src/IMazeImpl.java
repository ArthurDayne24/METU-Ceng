import java.io.Serializable;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.Collections;

public class IMazeImpl extends UnicastRemoteObject implements IMaze, Serializable {
    private int mazeHeight, mazeWidth;
    private ArrayList<ArrayList<MazeObject>> objectList;
    private ArrayList<Agent> agentList;
    private int idCount;

    public IMazeImpl() throws RemoteException {
    }


    @Override
    public void create(int height, int width) throws RemoteException {
        mazeHeight = height;
        mazeWidth = width;
        objectList = new ArrayList<>();
        agentList = new ArrayList<>();
        for (int i=0; i< height; i++){
            objectList.add(new ArrayList<>());
        }

        idCount = 0;
    }

    @Override
    public MazeObject getObject(Position position) throws RemoteException {
        if (position.getX()>=0 && position.getY()>=0 && position.getX() < mazeWidth && position.getX() < mazeHeight){
            ArrayList<MazeObject> desiredList = objectList.get(position.getY());
            for (int j=0; j< desiredList.size(); j++){
                if (desiredList.get(j).getPosition().getX() == position.getX()){
                    return desiredList.get(j);
                }
            }
            return null;
        }
        return null;
    }

    @Override
    public boolean createObject(Position position, MazeObjectType type) throws RemoteException {
        if (getObject(position) == null && position.getX()>=0 && position.getY()>=0 && position.getX() < mazeWidth && position.getX() < mazeHeight){
            if (type == MazeObjectType.AGENT){
                Agent agent = new Agent(position,idCount);
                agentList.add(agent);
                idCount++;
            }
            MazeObject object = new MazeObject(position, type);
            return objectList.get(position.getY()).add(object);
        }
        return false;
    }

    @Override
    public boolean deleteObject(Position position) throws RemoteException {
        if (!(getObject(position) == null)){
            if (getObject(position).getType() == MazeObjectType.AGENT){
                agentList.remove(findAgentByPosition(position));
            }
            return objectList.get(position.getY()).remove(getObject(position));
        }
        return false;
    }

    @Override
    public Agent[] getAgents() throws RemoteException {
        Agent[] agents = new Agent[agentList.size()];
        for (int i=0; i< agentList.size(); i++){
            agents[i] = agentList.get(i);
        }
        return agents;
    }

    @Override
    public boolean moveAgent(int id, Position position) throws RemoteException {
        if (!(position.getX()>=0 && position.getY()>=0 && position.getX() < mazeWidth && position.getY() < mazeHeight)) {
            return false;
        }
        Agent agent = findAgentByID(id);
        if (agent == null)
            return false;
        int manhattanDistance = calculateManhattan(agent.getPosition(), position);
        boolean changeApsis = decideApsis(agent.getPosition(), position);
        if (manhattanDistance  == 1){
            MazeObject tempObject = getObject(position);

            if (tempObject == null){
                if (changeApsis){
                    objectList.get(agent.getPosition().getY()).remove(getObject(agent.getPosition()));
                    objectList.get(position.getY()).add(agent);
                }else{
                    getObject(agent.getPosition()).setPosition(position);
                }
                agent.setPosition(position);
                return true;

            } else if (tempObject.getType() == MazeObjectType.WALL || tempObject.getType() == MazeObjectType.AGENT){

                return false;

            } else if (tempObject.getType() == MazeObjectType.GOLD){

                objectList.get(position.getY()).remove(tempObject);
                if (changeApsis){
                    objectList.get(agent.getPosition().getY()).remove(getObject(agent.getPosition()));
                    objectList.get(position.getY()).add(agent);
                }else{
                    getObject(agent.getPosition()).setPosition(position);
                }
                agent.setPosition(position);
                agent.incrementCollectedGold();
                return true;

            } else if (tempObject.getType() == MazeObjectType.HOLE){

                objectList.get(agent.getPosition().getY()).remove(getObject(agent.getPosition()));
                agentList.remove(agent);
                return false;

            } else return true;
        }
        return false;
    }

    private boolean decideApsis(Position agentPosition, Position desiredPosition) {
        return agentPosition.getY() - desiredPosition.getY() != 0;
    }

    @Override
    public String print() throws RemoteException {
        StringBuilder resultBuffer =new StringBuilder();

        resultBuffer.append("+").append(String.join("", Collections.nCopies(mazeWidth, "-"))).append("+").append("\n");

        for (int i = 0; i < mazeHeight; i++){
            resultBuffer.append("|");
            for (int j =0 ; j < mazeWidth; j++){
                MazeObject tempObj = getObject(new Position(j,i));
                if (tempObj == null){
                    resultBuffer.append(" ");
                } else{
                    resultBuffer.append(tempObj.toString());
                }
            }
            resultBuffer.append("|" + "\n");

        }
        resultBuffer.append("+").append(String.join("", Collections.nCopies(mazeWidth, "-"))).append("+");

        return resultBuffer.toString();
    }

    public int calculateManhattan(Position agentPosition, Position desiredPosition){
        return Math.abs(agentPosition.getX() - desiredPosition.getX()) + Math.abs(agentPosition.getY() - desiredPosition.getY());
    }

    public Agent findAgentByID(int id){
        for (Agent agent : agentList){
            if (agent.getId() == id){
                return agent;
            }
        }
        return null;
    }

    public Agent findAgentByPosition(Position position){
        for (Agent agent : agentList){
            if (agent.getPosition().getX() == position.getX() && agent.getPosition().getY() == position.getY()){
                return agent;
            }
        }
        return null;
    }

}
