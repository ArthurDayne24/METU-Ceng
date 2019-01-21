package scenes;

import javafx.geometry.HPos;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import main.Main;
import requests.Requests;
import scenes.levels.Level;
import utils.Utils;

import static utils.Constants.*;

public class SignIn {
    private Scene scene;
    private Button signInButton;
    private Button backButton;
    private PasswordField passwordField;
    private TextField nameField;
    private GridPane gridPane;


    public SignIn() {
        gridPane = Utils.createGridPane();
        addUIControlsSignIn();
        this.scene = new Scene(gridPane,GENERAL_SCENE_WIDTH, GENERAL_SCENE_HEIGHT);
    }


    /**
     * It adds the elements that will be appearing in first page (in the grid pane of this class)
     */
    private void addUIControlsSignIn() {
        // Add Header
        Label headerLabel = new Label("Sign In Page");
        headerLabel.setFont(Font.font("Arial", FontWeight.BOLD, 24));
        Level.addLabelLevelComplete(headerLabel, gridPane);

        //gridPane.setStyle("-fx-background-color: #59f2ff");


        // Add Name Label
        Label nameLabel = new Label("User Name : ");
        //nameLabel.setStyle("-fx-background-color: #26a9ff;-fx-text-fill: #dde7ff;-fx-background-radius: 50%;-fx-background-size: cover");
        gridPane.add(nameLabel, 0,1);

        // Add Name Text Field
        nameField = new TextField();
        nameField.setPrefHeight(30);
        //nameField.setStyle("-fx-background-color: #80faff");
        gridPane.add(nameField, 1,1);

        // Add Password Label
        Label passwordLabel = new Label("Password : ");
        //passwordLabel.setStyle("-fx-border-color: #26a9ff;-fx-background-color: #26a9ff;-fx-text-fill: #fffefa");

        gridPane.add(passwordLabel, 0, 3);



        // Add Password Field
        passwordField = new PasswordField();
        passwordField.setPrefHeight(30);
        //passwordField.setStyle("-fx-background-color: #80faff");
        gridPane.add(passwordField, 1, 3);

        // Add Submit Button
        signInButton = new Button("Sign In");
        FirstScene.addSignUpButton(gridPane,signInButton, 0, 4);


        // Add Back Button
        backButton = new Button("Back");
        backButton.setPrefHeight(40);
        backButton.setDefaultButton(true);
        backButton.setPrefWidth(100);
        gridPane.add(backButton, 0, 4, 2, 1);
        GridPane.setHalignment(backButton, HPos.LEFT);
        GridPane.setMargin(backButton, new Insets(20, 0,20,0));

    }

    /**
     * sets the sign in button handler
     * when sign in button is clicked the handle method is performed.
     */
    public void setSignInButtonHandler(){
        signInButton.setOnAction(event -> {
            // if name is not provided
            if (nameField.getText().isEmpty()) {
                Utils.showAlert(Alert.AlertType.ERROR, gridPane.getScene().getWindow(), "Form Error!", "Please enter your name");
            }
            // if password is not provided
            else if (passwordField.getText().isEmpty()) {
                Utils.showAlert(Alert.AlertType.ERROR, gridPane.getScene().getWindow(), "Form Error!", "Please enter a Password");
            }
            // name and password is provided
            else{
                // make the authentication request
                boolean responseOfAuthenticate = Requests.authentication(nameField.getText(),passwordField.getText());
                // if response is true, meaning that player exist in database with given credentials
                if (responseOfAuthenticate){
                    //set the player to a server's response player
                    Main.player = Requests.getPlayerFromDB(nameField.getText());
                    // Show welcome message
                    Main.startHomePage();
                }
                // player is not exist with given credentials
                else {
                    Utils.showAlert(Alert.AlertType.WARNING, gridPane.getScene().getWindow(), "Login Error!", "Name or password is wrong");
                }

            }
        });
    }


    /**
     * it sets the back button click handler
     * it opens the given scene when button is clicked
     * @param scene the scene that will be opened when back button clicked
     */
    public void setBackButtonHandler(Scene scene){
        backButton.setOnAction(e -> Main.window.setScene(scene));
    }

    /// Belows are getters and setters

    public Scene getScene() {
        return scene;
    }

    public void setScene(Scene scene) {
        this.scene = scene;
    }

}
