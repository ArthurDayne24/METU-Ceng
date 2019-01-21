package models.bullets;

import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import main.Main;
import models.aliens.*;

import java.util.ArrayList;

import static utils.Constants.*;


public class BulletSpaceShip extends Bullet {

    public BulletSpaceShip(int x, int y, int radius) {
        super(x, y, radius);
        this.setFill(Color.TAN);
        this.damagePower = SPACESHIP_BULLET_DAMAGE;
    }

    /**
     * This function moves bullet to positive y direction (up)
     * and checks if bullet crashes with any aliens
     * If detect collision, removes the bullet and
     * if the alien is dead, removes the alien
     */
    @Override
    public void move(Pane pane) {
        // if level is active
        if(Main.level.isActive){
            // move the bullet
            this.setCenterY(this.getCenterY() - Y_STEP_DISTANCE);
            checkCollision(pane);
        }
        // if level is not active
        else {
            // stop bullet moving
            stopAnimation();
        }
    }

    /**
     * This function checks if this bullet hits to a alien
     * if detects a hit, it calls a getShot method of alien
     * if alien is dead, function removes it from the pane
     * if no alien is left, it stops the level
     * @param pane the pane collusion occurs
     */
    @Override
    public void checkCollision(Pane pane){
        // get the aliens sin the level
        ArrayList<Alien> aliens = Main.level.getAliens();
        // for each alien
        for (int i = 0; i< aliens.size(); i++){
            // bullet hits the alien
            if (aliens.get(i).getBoundsInParent().intersects(this.getBoundsInParent()) ){
                // get shot for the alien
                aliens.get(i).getShot(this);
                // remove the bullet
                pane.getChildren().remove(this);
                // stop bullets animation
                this.bulletAnimation.stop();
                this.setCenterY(0);
                // if alien is dead
                if (aliens.get(i).isDead()){
                    // remove the alien
                    pane.getChildren().remove(aliens.get(i));
                    // stop alien's shooting
                    aliens.get(i).stopShootingAnimation();
                    //stop alien from level's aliens list
                    aliens.remove(i);
                    // if no alien is left
                    if(aliens.isEmpty()){
                        // stop level
                        Main.level.stopLevelSuccess(true);
                    }
                }
                break;
            }
        }
    }

}
