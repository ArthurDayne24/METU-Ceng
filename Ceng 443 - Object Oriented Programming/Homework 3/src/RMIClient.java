import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.Scanner;
import java.util.stream.Stream;


public class RMIClient {

    private static IMazeHub serverHub;
    private static IMaze selectedMaze;

    private static void createMaze(int x,int y) throws RemoteException {
        serverHub.createMaze(x, y);

    }

    private static void deleteMaze(int index) throws RemoteException {
        if (serverHub.removeMaze(index)){
            System.out.println("Operation Success.");
            selectedMaze = null;
            return;
        }
        System.out.println("Operation Failed.");

    }

    private static void selectMaze(int index) throws RemoteException {
        selectedMaze = serverHub.getMaze(index);
        if(selectedMaze == null)
            System.out.println("Operation Failed.");
        else
            System.out.println("Operation Success.");

    }

    private static void printMaze() throws RemoteException {
        if (selectedMaze != null){
            System.out.println( selectedMaze.print());
        }

    }

    private static void createObject(int x, int y, MazeObjectType type) throws RemoteException {
        if (selectedMaze != null){
            if(selectedMaze.createObject(new Position(x, y), type))
                System.out.println("Operation Success.");
            else
                System.out.println("Operation Failed.");
        }
        else
            System.out.println("Operation Failed.");
    }

    private static void deleteObject(int x, int y) throws RemoteException {
        if (selectedMaze != null) {
            if (selectedMaze.deleteObject(new Position(x, y)))
                System.out.println("Operation Success.");
            else
                System.out.println("Operation Failed.");
        }
        else
            System.out.println("Operation Failed.");
    }

    private static void listAgents() throws RemoteException {
        if (selectedMaze != null){
            Agent[] agents = selectedMaze.getAgents();
            if (agents.length != 0)
                Stream.of(agents).forEach(e-> System.out.println(e.getPrintFormat()));
        }

    }

    private static void moveAgent(int id, int x, int y) throws RemoteException {
        if(selectedMaze != null){
            if(selectedMaze.moveAgent(id, new Position(x,y)))
                System.out.println("Operation Success.");
            else
                System.out.println("Operation Failed.");
        } else
            System.out.println("Operation Failed.");

    }

    private static void quit() throws RemoteException {
        System.exit(0);
    }





    public static void main(String[] args) throws RemoteException, NotBoundException, MalformedURLException {

        serverHub = (IMazeHub) Naming.lookup("rmi://127.0.0.1:8123/opServiceHub");

        Scanner scanner = new Scanner(System.in);
        ParsedInput parsedInput = null;

        String input;
        while( true ) {
            input = scanner.nextLine();
            try {
                parsedInput = ParsedInput.parse(input);
            }
            catch (Exception ex) {
                parsedInput = null;
            }
            if ( parsedInput == null ) {
                System.out.println("Wrong input format. Try again.");
                continue;
            }
            switch(parsedInput.getType()) {
                case CREATE_MAZE:
                    createMaze((int) parsedInput.getArgs()[0],(int) parsedInput.getArgs()[1]);
                    break;
                case DELETE_MAZE:
                    deleteMaze((int) parsedInput.getArgs()[0]);
                    break;
                case SELECT_MAZE:
                    selectMaze((int) parsedInput.getArgs()[0]);
                    break;
                case PRINT_MAZE:
                    printMaze();
                    break;
                case CREATE_OBJECT:
                    createObject((int) parsedInput.getArgs()[0], (int) parsedInput.getArgs()[1], (MazeObjectType) parsedInput.getArgs()[2]);
                    break;
                case DELETE_OBJECT:
                    deleteObject((int) parsedInput.getArgs()[0], (int) parsedInput.getArgs()[1]);
                    break;
                case LIST_AGENTS:
                    listAgents();
                    break;
                case MOVE_AGENT:
                    moveAgent((int) parsedInput.getArgs()[0],(int) parsedInput.getArgs()[1],(int) parsedInput.getArgs()[2]);
                    break;
                case QUIT:
                    quit();
                    break;
            }
        }
    }
}
