package scenes.levels;


import main.Main;
import models.*;
import models.aliens.*;
import requests.*;

import java.util.ArrayList;

import static utils.Constants.*;

public class Level1 extends Level{

    public Level1(){
        super();
    }


    /**
     * It adds the elements that will be appearing in Level 1
     */
    @Override
    protected void addUIControls() {
        addCommonUIControls();

        // add 5 hard 5 easy alien
        aliens = new ArrayList<>();
        int x = 100, yEasy = 200, yHard = 100;
        for (int i = 0 ; i<5; i++, x+=100){
            aliens.add(new HardAlien(x-20, yHard, HARD_ALIEN_RADIUS));
            aliens.add(new EasyAlien(x, yEasy, EASY_ALIEN_RADIUS));
        }

        // add spaceship and aliens to the pane
        pane.getChildren().add(spaceshipHp);
        pane.getChildren().add(spaceShip);
        pane.getChildren().addAll(aliens);

        spaceShip.setMovementWithMouse();

    }

    /**
     * Sets message when the level is completed
     */
    @Override
    public void setLevelCompleteMessage() {
        this.levelCompleteMessage = "You have completed level 1.\nClick Next button to proceed with level 2.\nClick Main button to proceed with main page";
    }

    /**
     * it sets the sign in button click handler
     * it opens the sign in scene when button is clicked
     */
    @Override
    public void setNextButtonHandler(){
        next.setOnAction(e -> Main.startLevel2());
    }

    /**
     * This function adds 5 score to the player for level 1.
     */
    @Override
    public void addScore() {
        Score score = new Score(Main.player.getPlayerName(),LEVEL_1_POINT);
        Main.player.setScore(Main.player.getScore() + LEVEL_1_POINT);
        if(!Requests.addScore(score)){
            System.out.println("Score could not added");
        }
    }


}
