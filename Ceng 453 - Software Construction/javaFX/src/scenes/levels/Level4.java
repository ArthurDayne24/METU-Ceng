package scenes.levels;


import javafx.scene.paint.Color;
import main.Main;
import models.Score;
import models.SpaceShip;
import models.aliens.TheBoss;
import requests.Requests;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.ArrayList;

import static utils.Constants.*;
import static utils.Utils.getHpLabel;

public class Level4 extends Level{
    private DataInputStream dataInputStream;
    private DataOutputStream dataOutputStream;
    private SpaceShip spaceShip2;

    public Level4(){
        super();
    }

    /**
     * This function is overwritten from the base class
     * Places 2 of the spaceship to the proper places and place the boss.
     */
    @Override
    protected void addUIControls() {

        // add the spaceship
        spaceShip = new SpaceShip(SPACESHIP_X_LEFT, SPACESHIP_Y, SPACESHIP_WIDTH, SPACESHIP_HEIGHT);

        this.spaceshipHp = getHpLabel(spaceShip.getHp());

        // add the spaceship
        spaceShip2 = new SpaceShip(SPACESHIP_X_LEFT, SPACESHIP_Y, SPACESHIP_WIDTH, SPACESHIP_HEIGHT);
        spaceShip2.setFill(Color.BLACK);

        aliens = new ArrayList<>();

        aliens.add(new TheBoss(BOSS_POSITION_X, BOSS_POSITION_Y, BOSS_RADIUS));

        pane.getChildren().addAll(aliens);
        pane.getChildren().add(spaceShip);
        pane.getChildren().add(spaceShip2);

        spaceShip.setMovementWithMouse();


    }

    /**
     * This function is overwritten from the base class
     * It connects to the game server and wait for the ready check
     * Then learns the location of the spaceships from the server.
     * Starts the level by starting the animations
     *
     * starts two thread, one for sending information and one for receiving information
     */
    @Override
    public void startLevel(){
        Socket socket = new Socket();
        try {
            socket.connect(new InetSocketAddress(WEB_SERVICE_IP, WEB_SERVICE_PORT));
            dataInputStream = new DataInputStream(socket.getInputStream());
            dataOutputStream = new DataOutputStream(socket.getOutputStream());
            answerReadyCheck();
            byte[] readBuffer = new byte[1];
            int readAmount = dataInputStream.read(readBuffer);
            if(readAmount != -1 ){
                if (readBuffer[0] == START_LEVEL_4_LEFT.getBytes()[0] ){
                    spaceShip2.setX(SPACESHIP_X_RIGHT);

                } else if (readBuffer[0] == START_LEVEL_4_RIGHT.getBytes()[0] ){
                    spaceShip.setX(SPACESHIP_X_RIGHT);
                }
                Main.window.setScene(scene);
                spaceShip.startShooting(pane);
                spaceShip2.startShooting(pane);
                listen();
                sendInfo();
                startAliensShooting();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Waits for ready check from the server
     * Answers the check with ready response
     */
    private void answerReadyCheck(){
        byte[] readBuffer = new byte[1];
        try {
            int readAmount = dataInputStream.read(readBuffer);
            if (readAmount != -1 && readBuffer[0] == CHECK_READY.getBytes()[0] ) {
                dataOutputStream.write(READY.getBytes());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * listens the server and receives the other player's spaceship position
     * Updates the spaceship position
     */
    private void listen(){
        Thread listenThread = new Thread(() -> {
            try {
                while (true){
                    double x = dataInputStream.readDouble();
                    double y = dataInputStream.readDouble();
                    spaceShip2.setX(x);
                    spaceShip2.setY(y);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

        });
        listenThread.start();
    }

    /**
     * In every specific interval, sends the spaceship's position
     */
    private void sendInfo(){
        Thread send = new Thread(() -> {
            while (true){
                double x = spaceShip.getX();
                double y = spaceShip.getY();
                try {
                    dataOutputStream.writeDouble(x);
                    dataOutputStream.writeDouble(y);
                    Thread.sleep(SEND_INFO_INTERVAL_MILLIS);
                } catch (IOException | InterruptedException e) {
                    e.printStackTrace();
                    return;
                }
            }
        });

        send.start();
    }

    /**
     * This function is overwritten from the base class
     * Message that is shown after level 4 is completed.
     */
    @Override
    public void setLevelCompleteMessage() {
        levelCompleteMessage = "You have complete Level 4 !";
    }

    /**
     * Returns an ArrayList of spaceship
     * first index its own spaceship
     * second index other player's spaceship
     * @return ArrayList of spaceship
     */
    @Override
    public ArrayList<SpaceShip> getSpaceShip() {
        ArrayList<SpaceShip> result = new ArrayList<>();
        result.add(spaceShip);
        result.add(spaceShip2);
        return result;
    }


    /**
     * This function is overwritten from the base class
     * Handles when the next button is pushed.
     */
    @Override
    public void setNextButtonHandler(){
        next.setOnAction(e -> Main.startHomePage());
    }

    /**
     * This function is overwritten from the base class
     * This function adds 20 score to the player
     */
    @Override
    public void addScore() {
        Score score = new Score(Main.player.getPlayerName(),LEVEL_4_POINT);
        Main.player.setScore(Main.player.getScore() + LEVEL_4_POINT);
        if(!Requests.addScore(score)){
            System.out.println("Score could not added");
        }
    }

}
