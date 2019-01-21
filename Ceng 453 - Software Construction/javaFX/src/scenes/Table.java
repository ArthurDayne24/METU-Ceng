package scenes;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import main.Main;
import models.Score;
import requests.Requests;

import java.util.ArrayList;

public class Table {
    private Scene scene;
    private javafx.scene.control.Button backButton;
    private TableView table;
    private VBox vbox;
    public Table(){
        this.table = new TableView();
        vbox = new VBox();
        backButton = new javafx.scene.control.Button("Back");
        addUIControlTable();
        this.scene = new Scene(vbox,480,550);


    }

    /**
     * It adds the elements that will be appearing in scoreboard screen
     */
    private void addUIControlTable(){
        // Add Header
        final javafx.scene.control.Label headerLabel = new javafx.scene.control.Label("ScoreBoard");
        headerLabel.setFont(Font.font("Arial", FontWeight.BOLD, 24));

        table.setEditable(true);
        TableColumn rankCol = new TableColumn("Rank");
        rankCol.setPrefWidth(50);
        rankCol.setCellValueFactory(
                new PropertyValueFactory<Score, Integer>("rank"));

        TableColumn userNameCol = new TableColumn("User Name");
        userNameCol.setPrefWidth(200);
        userNameCol.setCellValueFactory(
                new PropertyValueFactory<Score, String>("name"));

        TableColumn scoreCol = new TableColumn("Score");
        scoreCol.setPrefWidth(100);
        scoreCol.setCellValueFactory(
                new PropertyValueFactory<Score, Long>("score"));

        table.getColumns().addAll(rankCol,userNameCol, scoreCol);
        // Add Back Button

        backButton.setPrefHeight(40);
        backButton.setDefaultButton(true);
        backButton.setPrefWidth(100);

        vbox.setSpacing(5);
        vbox.setPadding(new Insets(20, 50, 0, 50));
        vbox.getChildren().addAll(headerLabel, table, backButton);


    }

    /**
     * Shows the weekly table by setting the current scene with the scoreboard scene.
     */
    void showWeeklyTable(){
        Main.window.setScene(scene);
        ArrayList<Score> scores = Requests.scoreRequest("get_weekly_score");

        setTable(scores);
    }


    /**
     * Shows the all time scoreboard by setting the current scene with the scoreboard scene.
     */
    void showAllTimeTable(){
        Main.window.setScene(scene);
        ArrayList<Score> scores = Requests.scoreRequest("get_all_time_table");
        setTable(scores);
    }

    /**
     * Sets the table rows with the given score array.
     * @param scores is the list of the all time scores.
     */
    private void setTable(ArrayList<Score> scores){

        ObservableList<Score> data = FXCollections.observableArrayList();
        if(scores != null){
            int i = 0;
            for (Score score:scores){
                if (i >= 10)
                    break;
                data.add(new Score(i+1, score.getName(),score.getScore() ));
//                System.out.println(score.getName() + " " + score.getScore());
                i++;
            }
            table.setItems(data);
        }
    }

    public void setBackButtonHandler(){
        backButton.setOnAction(e -> Main.window.setScene(Main.homePage.getScene()));
    }


    public Scene getScene() {
        return scene;
    }


    public void setScene(Scene scene) {
        this.scene = scene;
    }

}
