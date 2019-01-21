package scenes;

import javafx.geometry.HPos;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import main.Main;
import utils.Utils;

import static utils.Constants.*;

public class HomePage {
    private Scene scene;
    private GridPane pane;
    private Button play;
    private Button weeklyScoreboard;
    private Button totalScoreboard;

    public HomePage(){
        pane = Utils.createGridPane();
        addUIControls();
        this.scene = new Scene(pane,GENERAL_SCENE_WIDTH,GENERAL_SCENE_HEIGHT);
    }

    /**
     * It adds the elements that will be appearing in home page
     */
    private void addUIControls(){
        // add the Welcome quot to the pane
        Label headerLabel = new Label("Welcome " );
        headerLabel.setFont(Font.font("Arial", FontWeight.BOLD, 24));
        pane.add(headerLabel, 0,0,2,1);
        GridPane.setHalignment(headerLabel, HPos.LEFT);
        GridPane.setMargin(headerLabel, new Insets(20, 0,20,0));

        // add the sign up button to the right below of page
        play = new Button("Play");
        FirstScene.addSignUpButton(pane, play, 4, 0);

        // add the sign in button to the left below of page
        weeklyScoreboard = new Button("Weekly score table");
        weeklyScoreboard.setPrefHeight(40);
        weeklyScoreboard.setDefaultButton(true);
        weeklyScoreboard.setPrefWidth(200);
        FirstScene.addSignInButton(pane, weeklyScoreboard);

        // add the sign in button to the left below of page
        totalScoreboard = new Button("Total score table");
        totalScoreboard.setPrefHeight(40);
        totalScoreboard.setDefaultButton(true);
        totalScoreboard.setPrefWidth(200);
        pane.add(totalScoreboard, 4, 1, 2, 1);
        GridPane.setHalignment(totalScoreboard, HPos.RIGHT);
        GridPane.setMargin(totalScoreboard, new Insets(20, 0,20,0));

        setTotalScoreboardButtonHandler();
        setPlayButtonHandler();
        setWeeklyScoreboardButtonHandler();

    }

    // Below are setters and getters.


    private void setPlayButtonHandler(){
        play.setOnAction(e -> Main.startLevel1());
    }

    private void setWeeklyScoreboardButtonHandler(){
        weeklyScoreboard.setOnAction(e -> Main.table.showWeeklyTable());

    }

    private void setTotalScoreboardButtonHandler(){
        totalScoreboard.setOnAction(e -> Main.table.showAllTimeTable());

    }


    public Scene getScene() {
        return scene;
    }

    public void setScene(Scene scene) {
        this.scene = scene;
    }
}
