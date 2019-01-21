package scenes.levels;

import main.Main;
import models.aliens.EasyAlien;
import models.aliens.HardAlien;
import models.Score;
import requests.Requests;

import java.util.ArrayList;

import static utils.Constants.*;

public class Level3 extends Level {

    public Level3(){
        super();
    }


    /**
     * It adds the elements that will be appearing in Level 3
     * Different kind of aliens are added.
     */
    @Override
    protected void addUIControls() {
        addCommonUIControls();

        // add 5 hard 5 easy alien
        aliens = new ArrayList<>();
        int x = 100, y = 100, radius = 14;
        for (int i = 0 ; i<5; i++, x+=100){
            aliens.add(new HardAlien(x, y, radius));
        }
        x = 150; y = 250;
        for (int i = 0 ; i<3; i++, x+=150){
            aliens.add(new HardAlien(x, y, radius));
        }

        x = 100; y = 400; radius = 20;
        for (int i =0; i < 5;i++ , x+=100){
            aliens.add(new EasyAlien(x, y, radius));
        }

        x = 150; y = 550;
        for (int i =0; i < 3;i++ , x+=150){
            aliens.add(new EasyAlien(x, y, radius));
        }

        // add spaceship and aliens to the pane
        pane.getChildren().add(spaceshipHp);
        pane.getChildren().add(spaceShip);
        pane.getChildren().addAll(aliens);

        spaceShip.setMovementWithMouse();
    }

    /**
     * This function adds 15 score to the player
     */
    @Override
    public void addScore() {
        Score score = new Score(Main.player.getPlayerName(),LEVEL_3_POINT);
        Main.player.setScore(Main.player.getScore() + LEVEL_3_POINT);
        if(!Requests.addScore(score)){
            System.out.println("Score could not added");
        }
    }


    @Override
    public void setLevelCompleteMessage() {
        this.levelCompleteMessage = "You have completed level 3.\nClick Next button to proceed with level 4.\nClick Main button to proceed with main page";
    }

    /**
     * it sets the sign in button click handler
     * it opens the sign in scene when button is clicked
     */
    @Override
    public void setNextButtonHandler(){
        next.setOnAction(e -> Main.startLevel4());
    }


}
