package scenes;

import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import main.Main;
import scenes.levels.Level;
import utils.Utils;

public class GameOver {
    private Scene scene;
    private GridPane pane;
    private Button home;
    private Button restart;

    public GameOver(){
        pane = Utils.createGridPane();
        addUIControlsGameOver();
        this.scene = new Scene(pane,800,500);
    }

    /**
     * It adds the elements that will be appearing in game over screen
     */
    private void  addUIControlsGameOver(){
        // add the Welcome quot to the pane
        Label headerLabel = new Label("Game Over");
        headerLabel.setFont(Font.font("Arial", FontWeight.BOLD, 24));
        headerLabel.setTextFill(Color.BLUE);
        Level.addLabelLevelComplete(headerLabel, pane);

        // add the restart button to the right below of page
        restart = new Button("Start Again");
        restart.setPrefHeight(40);
        restart.setDefaultButton(true);
        restart.setPrefWidth(100);
        FirstScene.addSignInButton(pane, restart);

        // add the main button to the left below of page
        // add the sign in button to the left below of page
        home = new Button("Home");
        FirstScene.addSignUpButton(pane, home, 2, 1);

        setRestartButtonHandler();
        setHomeButtonHandler();
    }

    // Below are setter and getter.


    private void setRestartButtonHandler(){
        restart.setOnAction(e -> Main.startLevel1());
    }

    private void setHomeButtonHandler(){
        home.setOnAction(e -> Main.startHomePage());
    }

    public Scene getScene() {
        return scene;
    }

    public void setScene(Scene scene) {
        this.scene = scene;
    }
}
