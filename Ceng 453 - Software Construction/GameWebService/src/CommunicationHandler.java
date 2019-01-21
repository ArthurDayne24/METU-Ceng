import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

public class CommunicationHandler implements Runnable{
    private DataInputStream dataInputStream1;
    private DataOutputStream dataOutputStream1;

    private DataInputStream dataInputStream2;
    private DataOutputStream dataOutputStream2;

    /**
     * This is the place where initialization of the input and output streams.
     * Binding is handled here.
     * @param socket1 first socket
     * @param socket2 second socket
     */
    CommunicationHandler(Socket socket1, Socket socket2){
        try {
            this.dataInputStream1 = new DataInputStream(socket1.getInputStream());
            this.dataInputStream2 = new DataInputStream(socket2.getInputStream());

            this.dataOutputStream1 = new DataOutputStream(socket1.getOutputStream());
            this.dataOutputStream2 = new DataOutputStream(socket2.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * This is the place where the decision of the left and right spaceship is taken.
     * And send place info to the clients.
     * And then server starts to listen both client.
     */
    @Override
    public void run() {
        try {
            dataOutputStream1.write(Constants.START_LEVEL_4_LEFT.getBytes());
            dataOutputStream2.write(Constants.START_LEVEL_4_RIGHT.getBytes());

            listenClient(true);
            listenClient(false);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * Listening both client is done here and whenever a position information is got, it sends to other client.
     * @param flag is for deciding which client is to be written to.
     */
    private void listenClient(boolean flag){
        Thread listen = new Thread(() -> {

            try {
                if (flag){
                    while (true){
                        double message = dataInputStream1.readDouble();
                        dataOutputStream2.writeDouble(message);

                    }
                } else {
                    while (true){
                        double message = dataInputStream2.readDouble();
                        dataOutputStream1.writeDouble(message);
                    }
                }

            } catch (IOException e) {
                e.printStackTrace();
            }
        });

        listen.start();
    }

}
