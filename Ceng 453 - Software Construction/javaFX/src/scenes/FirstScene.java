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
import scenes.levels.Level;
import utils.*;

public class FirstScene {
    private Scene scene;
    private Button signInButton;
    private Button signUpButton;

    /**
     * Constructor of the first scene.
     */
    public FirstScene() {
        GridPane gridPane = Utils.createGridPane();
        addUIControlsFirstPage(gridPane);
        this.scene = new Scene(gridPane,800,500);
    }

    /**
     * It adds the elements that will be appearing in first page
     * @param gridPane the pane that we want to add elements
     */
    private void addUIControlsFirstPage(GridPane gridPane){
        // add the Welcome quot to the pane
        Label headerLabel = new Label("Welcome to Alien Shooter");
        headerLabel.setFont(Font.font("Arial", FontWeight.BOLD, 24));
        Level.addLabelLevelComplete(headerLabel, gridPane);

        // add the sign up button to the right below of page
        signUpButton = new Button("Sign Up");
        addSignUpButton(gridPane, signUpButton, 0, 1);

        // add the sign in button to the left below of page
        signInButton = new Button("Sign In");
        signInButton.setPrefHeight(40);
        signInButton.setDefaultButton(true);
        signInButton.setPrefWidth(100);
        addSignInButton(gridPane, signInButton);

    }

    /**
     * Adds sign in button to the pane.
     * @param gridPane is the place where button will be added.
     * @param signInButton is the button that we add.
     */
    static void addSignInButton(GridPane gridPane, Button signInButton) {
        gridPane.add(signInButton, 0, 1, 2, 1);
        GridPane.setHalignment(signInButton, HPos.LEFT);
        GridPane.setMargin(signInButton, new Insets(20, 0,20,0));
    }

    /**
     * Adds sign up button to the pane.
     * @param gridPane is the place where button will be added.
     * @param signUpButton is the button that we add.
     */
    static void addSignUpButton(GridPane gridPane, Button signUpButton, int i, int i2) {
        signUpButton.setPrefHeight(40);
        signUpButton.setDefaultButton(true);
        signUpButton.setPrefWidth(100);
        gridPane.add(signUpButton, i, i2, 2, 1);
        GridPane.setHalignment(signUpButton, HPos.RIGHT);
        GridPane.setMargin(signUpButton, new Insets(20, 0,20,0));
    }

    /**
     * it sets the sign in button click handler
     * it opens the sign in scene when button is clicked
     */
    public void setSignInButtonHandler(){
        signInButton.setOnAction(e -> Main.window.setScene(Main.signIn.getScene()));
    }


    /**
     * it sets the sign up button click handler
     * it opens the sign up scene when button is clicked
     */
    public void setSignUpButtonHandler(){
        signUpButton.setOnAction(e -> Main.window.setScene(Main.signUp.getScene()));
    }


    /// Belows are getter and setters

    public Scene getScene() {
        return scene;
    }

    public void setScene(Scene scene) {
        this.scene = scene;
    }
}
