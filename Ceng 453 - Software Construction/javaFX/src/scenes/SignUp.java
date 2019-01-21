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

public class SignUp {
    private Scene scene;
    private Button signUpButton;
    private Button backButton;
    private TextField nameField;
    private PasswordField passwordField1;
    private PasswordField passwordField2;
    private GridPane gridPane;

    public SignUp() {
        gridPane = Utils.createGridPane();
        addUIControlsSignUp();
        this.scene = new Scene(gridPane,GENERAL_SCENE_WIDTH, GENERAL_SCENE_HEIGHT);
    }

    /**
     * It adds the elements that will be appearing in sign up page.
     */
    private void addUIControlsSignUp() {
        // Add Header
        Label headerLabel = new Label("Sign Up");
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
        nameField.setPrefWidth(400);
        //nameField.setStyle("-fx-background-color: #80faff");
        gridPane.add(nameField, 1,1);

        // Add Password Label
        Label passwordLabel1 = new Label("Password : ");
        //passwordLabel.setStyle("-fx-border-color: #26a9ff;-fx-background-color: #26a9ff;-fx-text-fill: #fffefa");

        gridPane.add(passwordLabel1, 0, 3);

        // Add Password Field
        passwordField1 = new PasswordField();
        passwordField1.setPrefHeight(30);
        passwordField1.setPrefWidth(400);
        //passwordField.setStyle("-fx-background-color: #80faff");
        gridPane.add(passwordField1, 1, 3);

        // Add Password Label
        Label passwordLabel2 = new Label("Password Again: ");
        //passwordLabel.setStyle("-fx-border-color: #26a9ff;-fx-background-color: #26a9ff;-fx-text-fill: #fffefa");

        gridPane.add(passwordLabel2, 0, 5);

        // Add Password Field
        passwordField2 = new PasswordField();
        passwordField2.setPrefHeight(30);
        passwordField2.setPrefWidth(400);
        //passwordField.setStyle("-fx-background-color: #80faff");
        gridPane.add(passwordField2, 1, 5);


        // Add Submit Button
        signUpButton = new Button("Sign Up");
        FirstScene.addSignUpButton(gridPane,signUpButton, 0, 7);

        // Add Back Button
        backButton = new Button("Back");
        backButton.setPrefHeight(40);
        backButton.setDefaultButton(true);
        backButton.setPrefWidth(100);
        gridPane.add(backButton, 0, 7, 2, 1);
        GridPane.setHalignment(backButton, HPos.LEFT);
        GridPane.setMargin(backButton, new Insets(20, 0,20,0));

    }


    /**
     * sets the sign up button handler
     * when sign up button is clicked the handle method is performed.
     * If sign up is successful, sign in scene starts
     */
    public void signUpButtonHandler(){
        signUpButton.setOnAction(event -> {
            // if name is not provided
            if (nameField.getText().isEmpty()) {
                Utils.showAlert(Alert.AlertType.ERROR, gridPane.getScene().getWindow(), "Form Error!", "Please enter your name");
            }
            // if password1 is not provided
            else if (passwordField1.getText().isEmpty()) {
                Utils.showAlert(Alert.AlertType.ERROR, gridPane.getScene().getWindow(), "Form Error!", "Please enter a Password");
            }
            // if password2 is not provided
            else if(passwordField2.getText().isEmpty()){
                Utils.showAlert(Alert.AlertType.ERROR, gridPane.getScene().getWindow(), "Form Error!", "Please reenter the Password");
            }
            //everything is provided
            else {
                // if given 2 password do not match
                if(! passwordField1.getText().equals(passwordField2.getText())){
                    Utils.showAlert(Alert.AlertType.WARNING, gridPane.getScene().getWindow(), "Password Error", "Given passwords do not match");

                }
                // everything is provided, passwords match
                else {
                    // if sign in successful
                    if (Requests.addPlayerToDB(nameField.getText(),passwordField1.getText())){
                        Utils.showAlert(Alert.AlertType.INFORMATION, gridPane.getScene().getWindow(), "Sign Up Successful", "Sign up is successful, you can sign in now !");
                        Main.window.setScene(Main.signIn.getScene());
                    }
                    // if sign in not successful,
                    else {
                        Utils.showAlert(Alert.AlertType.ERROR, gridPane.getScene().getWindow(), "Name Error", "Name already in use");
                    }

                }
            }

        });
    }

    /**
     * Handles when the back button is pressed.
     * @param scene is the playground.
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
