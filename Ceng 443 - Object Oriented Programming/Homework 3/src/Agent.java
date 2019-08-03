public class Agent extends MazeObject{
    
    private final int id;
    private int collectedGold;
    public Agent(Position position, int id) {
        super(position, MazeObjectType.AGENT);
        this.id = id;
        this.collectedGold = 0;
    }

    public String getPrintFormat(){
        return "Agent" + id + " at " + getPosition() + ". Gold collected: " + collectedGold;
    };

    public int getCollectedGold() {
        return collectedGold;
    }

    public void incrementCollectedGold(){
        collectedGold++;
    }

    public int getId() {
        return id;
    }
}
