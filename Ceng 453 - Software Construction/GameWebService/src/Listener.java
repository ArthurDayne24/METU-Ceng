import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

public class Listener {

    /**
     * Main function which is in infinite loop, takes 2 connection consecutively and starts game for 2 client
     * And start a thread for information exchange.
     */
    public static void main(String[] args){
        try {
            ServerSocket serverSocket = new ServerSocket(Constants.LISTEN_PORT_NUMBER);
            ArrayList<Socket> sockets = new ArrayList<>();
            while (true){
                Socket socket = serverSocket.accept();
                sockets.add(socket);
                if(sockets.size() > 1){
                    System.out.println("second arrived");
                    if (checkReady(sockets.get(0))){
                        sockets.remove(0);
                        continue;
                    }
                    System.out.println("first ready");
                    if (checkReady(sockets.get(1))){
                        sockets.remove(1);
                        continue;
                    }
                    System.out.println("second ready");
                    CommunicationHandler communicationHandler = new CommunicationHandler(sockets.get(0), sockets.get(1));
                    sockets.remove(0); sockets.remove(0);
                    communicationHandler.run();
                }

            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * returns true if connection is lost
     * @param socket the socket that we want to check connection
     * @return true if socket disconnected
     */
    private static boolean checkReady(Socket socket){
        try {
            DataInputStream dataInputStream = new DataInputStream(socket.getInputStream());
            DataOutputStream dataOutputStream = new DataOutputStream(socket.getOutputStream());

            byte[] send = Constants.CHECK_READY.getBytes() ;
            dataOutputStream.write(send);

            byte[] read = new byte[1];
            int readAmount = dataInputStream.read(read);
            if(readAmount == -1)
                return true;

            if (read[0] == Constants.READY.getBytes()[0])
                return false;

        } catch (IOException e) {
            e.printStackTrace();
        }
        return true;

    }


}
