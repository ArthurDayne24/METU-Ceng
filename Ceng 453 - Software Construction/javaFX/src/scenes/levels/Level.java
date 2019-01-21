package scenes.levels;

import javafx.geometry.HPos;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import main.Main;
import models.aliens.Alien;
import models.SpaceShip;
import utils.Utils;

import java.util.ArrayList;

import static utils.Constants.*;
import static utils.Utils.getHpLabel;

public abstract class Level {
    public boolean isActive;
    private Scene levelCompletedScene;
    private GridPane levelCompletedPane;
    String levelCompleteMessage;
    Button next;
    private Button mainMenuButton;
    protected Scene scene;
    protected Pane pane;
    Label spaceshipHp;
    protected ArrayList<Alien> aliens;
    SpaceShip spaceShip;

    /**
     * Basic constructor of the Level class
     */
    Level(){
        isActive = true;
        levelCompletedPane = Utils.createGridPane();
        pane = new Pane();
        addUIControls();
        addUIControlsLevelCompleted();
        this.scene = new Scene(pane,LEVEL_SCENE_WIDTH,LEVEL_SCENE_HEIGHT);
        this.levelCompletedScene = new Scene(levelCompletedPane,GENERAL_SCENE_WIDTH, GENERAL_SCENE_HEIGHT);

        scene.addEventHandler(KeyEvent.KEY_PRESSED, (key) -> {
            if(key.getCode()== KeyCode.S) {
                stopLevelSuccess(false);
            }
        });
    }


    protected abstract void addUIControls();



    /**
     * it sets the sign in button click handler
     * it opens the sign in scene when button is clicked
     */
    public abstract void setNextButtonHandler();


    /**
     * it sets the sign up button click handler
     * it opens the sign up scene when button is clicked
     */
    private void setMainButtonHandler(){
        mainMenuButton.setOnAction(e -> Main.window.setScene(Main.homePage.getScene()));
    }

    /**
     * Places the spaceship and puts the health point Label to the top of the screen
     */
    void addCommonUIControls(){
        // add the spaceship
        spaceShip = new SpaceShip(SPACESHIP_X_MIDDLE, SPACESHIP_Y, SPACESHIP_WIDTH, SPACESHIP_HEIGHT);

        this.spaceshipHp = getHpLabel(this.spaceShip.getHp());
    }

    /**
     * Updates the health point label whenever it is shot
     */
    public void updateSpaceshipHp(){
        spaceshipHp.setText("Hp = " + spaceShip.getHp());
    }


    /**
     * All user interface labels and object positions are handled and placed here.
     * Button interaction functions are called here.
     */
    private void  addUIControlsLevelCompleted(){
        // add the Welcome quot to the pane
        setLevelCompleteMessage();
        Label headerLabel = new Label(levelCompleteMessage);
        headerLabel.setFont(Font.font("Arial", FontWeight.BOLD, 24));
        headerLabel.setTextFill(Color.BLUE);
        addLabelLevelComplete(headerLabel, levelCompletedPane);

        // add the sign up button to the right below of page
        next = new Button("Next");
        next.setPrefHeight(40);
        next.setDefaultButton(true);
        next.setPrefWidth(100);
        levelCompletedPane.add(next, 0, 1, 2, 1);
        GridPane.setHalignment(next, HPos.RIGHT);
        GridPane.setMargin(next, new Insets(20, 0,20,0));

        // add the sign in button to the left below of page
        mainMenuButton = new Button("Home");
        mainMenuButton.setPrefHeight(40);
        mainMenuButton.setDefaultButton(true);
        mainMenuButton.setPrefWidth(100);
        levelCompletedPane.add(mainMenuButton, 0, 1, 2, 1);
        GridPane.setHalignment(mainMenuButton, HPos.LEFT);
        GridPane.setMargin(mainMenuButton, new Insets(20, 0,20,0));

        setNextButtonHandler();
        setMainButtonHandler();
    }

    /**
     * This function is triggered when the level is completed.
     * @param headerLabel is the place
     * @param levelCompletedPane is the playground.
     */
    public static void addLabelLevelComplete(Label headerLabel, GridPane levelCompletedPane) {
        levelCompletedPane.add(headerLabel, 0,0,2,1);
        GridPane.setHalignment(headerLabel, HPos.CENTER);
        GridPane.setMargin(headerLabel, new Insets(20, 0,20,0));
    }

    /**
     * This function sets the main window's scene to its own scene
     * Then start shooting from spaceship and aliens
     */
    public void startLevel(){
        Main.window.setScene(scene);
        spaceShip.startShooting(pane);
        startAliensShooting();

    }

    /**
     * start all aliens shooting animation
     */
    void startAliensShooting(){
        for (Alien alien : aliens) {
            alien.startShootingAnimation(pane);
            alien.startMovingAnimation();
        }
    }

    /**
     * stops the level and starts the level completed scene
     */
    public void stopLevelSuccess(boolean addScore){
        //set is active false to stop all bullet's moving animation
        isActive = false;
        for (Alien alien : aliens) {
            alien.stopShootingAnimation();
            alien.stopMovingAnimation();
        }
        spaceShip.stopShooting();
        pane.getChildren().clear();
        if (addScore)
            addScore();
        Main.window.setScene(this.levelCompletedScene);
    }

    public abstract void addScore();


    /**
     * stops the level and starts the game over scene
     */
    public void stopLevelFailed(){
        //set is active false to stop all bullet's moving animation
        isActive = false;
        for (Alien alien : aliens) {
            alien.stopShootingAnimation();
        }
        spaceShip.stopShooting();
        pane.getChildren().clear();
        Main.startGameOver();
    }


    /// Belows are getters and setters


    public abstract void setLevelCompleteMessage();

    /**
     * @return current scene.
     */
    public Scene getScene() {
        return scene;
    }

    /**
     * Sets current scene with given scene
     * @param scene is the given scene
     */
    public void setScene(Scene scene) {
        this.scene = scene;
    }

    /**
     * @return All the spaceships of the level, it is same for first three level but different for last level.
     */
    public ArrayList<SpaceShip> getSpaceShip() {
        ArrayList<SpaceShip> result = new ArrayList<>();
        result.add(spaceShip);
        return result;
    }

    /**
     * @return current pane of the scene.
     */
    public Pane getPane() {
        return pane;
    }

    /**
     * @return all the aliens in the level.
     */
    public ArrayList<Alien> getAliens() {
        return aliens;
    }
}
