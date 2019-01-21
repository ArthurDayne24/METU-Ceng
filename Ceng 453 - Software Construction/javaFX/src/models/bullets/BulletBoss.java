package models.bullets;

import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import main.Main;

import static utils.Constants.*;


public class BulletBoss extends Bullet {
    private double xStep;

    /**
     * Constructor of the hard alien bullet.
     * Damage of the easy alien bullet is 3 which means if spaceships is hit by boss, it is dead.
     * Also tangent of the bullet is got here.
     * @param x is the horizontal position of the bullet.
     * @param y is the vertical position of the bullet.
     * @param radius is the radius.
     */
    public BulletBoss(int x, int y, int radius,int spaceshipNo) {
        super(x, y, radius);
        this.setFill(Color.RED);
        this.damagePower = BOSS_BULLET_DAMAGE ;

        // calculate the distance that each time bullet will move at x direction
        double spaceShipX = Main.level.getSpaceShip().get(spaceshipNo).getX();
        double spaceShipY = Main.level.getSpaceShip().get(spaceshipNo).getY();
        double distanceX = spaceShipX - this.getCenterX();
        double distanceY = spaceShipY - this.getCenterY();
        xStep = (Y_STEP_DISTANCE * distanceX ) / distanceY ;
    }

    /**
     * Movement of the bullet is done here.
     * Changes its position by increasing vertical position by 10 and horizontal position by xStep which is tangent.
     * Moves faster than easy and hard alien bullet.
     * If it is passive, then stop animation.
     * @param pane the pane that bullet moves in
     */
    @Override
    public void move(Pane pane) {
        if(Main.level.isActive){
            // move the bullet
            this.setCenterY(this.getCenterY()+Y_STEP_DISTANCE);
            this.setCenterX(this.getCenterX()+xStep);
            this.checkCollision(pane);
        }
        // if level is not active
        else {
            // stop bullet moving
            stopAnimation();
        }
    }

}
