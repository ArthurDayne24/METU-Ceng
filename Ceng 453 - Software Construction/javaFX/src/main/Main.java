package main;

import javafx.application.Application;
import javafx.stage.Stage;
import models.*;
import scenes.*;
import scenes.levels.*;

public class Main extends Application {
    private FirstScene firstScene;
    public static SignIn signIn;
    private static GameOver gameOver;
    public static SignUp signUp;
    public static HomePage homePage;
    public static Level level;
    public static Stage window;
    public static Player player;
    public static Table table;


    @Override
    public void start(Stage primaryStage){
        window = primaryStage;
        primaryStage.setTitle("Alien Shooter Application");

        // initialize the scenes and button handler
        initializeScenesSetHandlers();

//        startLevel1();
        primaryStage.setScene(firstScene.getScene());

        primaryStage.show();

    }


    /**
     * This function initializes the game scenes and their button handlers.
     */
    private void initializeScenesSetHandlers(){
        // initialize scenes
        firstScene = new FirstScene();
        signIn = new SignIn();
        signUp = new SignUp();
        gameOver = new GameOver();
        homePage = new HomePage();
        table = new Table();

        // set the button handlers

        // in first scene, navigate to sign in pane when sign in button is clicked
        firstScene.setSignInButtonHandler();
        // in first scene, navigate to sign up pane when sign up button is clicked
        firstScene.setSignUpButtonHandler();
        // in signIn scene, navigate to firstScreen pane when back button is clicked
        signIn.setBackButtonHandler(firstScene.getScene());
        // in signUp scene, navigate to firstScreen pane when back button is clicked
        signUp.setBackButtonHandler(firstScene.getScene());

        table.setBackButtonHandler();

        signIn.setSignInButtonHandler();
        signUp.signUpButtonHandler();
    }

    /**
     * creates a new level 1 and assigns level to it
     * starts the level
     */
    public static void startLevel1(){
        level = new Level1();
        level.startLevel();
    }

    /**
     * creates a new level 2 and assigns level to it
     * starts the level
     */
    public static void startLevel2(){
        level = new Level2();
        level.startLevel();
    }

    /**
     * creates a new level 1 and assigns level to it
     * starts the level
     */
    public static void startLevel3(){
        level = new Level3();
        level.startLevel();
    }

    public static void startLevel4(){
        level = new Level4();
        level.startLevel();
    }

    /**
     * sets window's scene to the home page's scene
     */
    public static void startHomePage(){
        window.setScene(homePage.getScene());
    }

    /**
     * sets window's scene to the game over's scene
     */
    public static void startGameOver(){
        window.setScene(gameOver.getScene());
    }


    public static void main(String[] args) {
        launch(args);
    }
}
