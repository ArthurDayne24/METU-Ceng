package models.bullets;

import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import main.Main;

import static utils.Constants.*;


public class BulletAlienHard extends Bullet {

    /**
     * Constructor of the hard alien bullet.
     * Damage of the easy alien bullet is 2.
     * @param x is the horizontal position of the bullet.
     * @param y is the vertical position of the bullet.
     * @param radius is the radius.
     */
    public BulletAlienHard(int x, int y, int radius){
        super(x, y, radius);
        this.setFill(Color.RED);
        this.damagePower = HARD_BULLET_DAMAGE ;


    }


    /**
     * Movement of the bullet is done here.
     * Changes its position by increasing vertical position by 10
     * Moves faster than easy alien bullet.
     * If it is passive, then stop animation.
     * @param pane the pane that bullet moves in
     */
    @Override
    public void move(Pane pane) {
        // if level is active
        if(Main.level.isActive){
            // move the bullet
            this.setCenterY(this.getCenterY()+Y_STEP_DISTANCE);
            this.checkCollision(pane);
        }
        // if level is not active
        else {
            // stop bullet moving
            stopAnimation();
        }
    }

}
