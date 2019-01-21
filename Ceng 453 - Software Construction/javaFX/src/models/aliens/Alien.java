package models.aliens;

import javafx.animation.Timeline;
import javafx.scene.layout.Pane;
import javafx.scene.shape.Circle;
import models.bullets.Bullet;

public abstract class Alien extends Circle{
    Timeline shootingAnimation;
    Timeline movingAnimation;
    int hp;

    Alien(int x, int y, int radius){
        super(x, y, radius);
    }

    /**
     * this function is called when a spaceship's bullet hits the alien
     * function subtracts bullet's damage power from it's hp
     * hp might end up with negative value
     * @param bullet the bullet that hits the alien
     */
    public void getShot(Bullet bullet){
        hp-= bullet.getDamagePower();
    }

    /**
     * Returns true (dead) if aliens's hp lover than or equal to 0
     * @return if dead or not
     */
    public boolean isDead() {
        return hp <= 0;
    }

    /**
     * This function is overwritten in subclasses
     * this function creates bullet and adds it to the pane
     * After creating bullet, it starts bullet's animation
     * @param pane the pane that we are shooting in
     */
    public abstract void shoot(Pane pane);


    /**
     * This function is overwritten in subclasses
     * It calls shoot function periodically
     * @param pane the pane that we shoot in
     */
    public abstract void startShootingAnimation(Pane pane);

    /**
     * This function is overwritten in subclasses
     * It moves the aliens
     */
    public abstract void startMovingAnimation();

    /**
     * Stops the shooting animation.
     */
    public void stopShootingAnimation(){
        if (shootingAnimation != null)
            shootingAnimation.stop();
    }

    /**
     * Stops the moving animation.
     */
    public void stopMovingAnimation(){
        if (movingAnimation != null)
            movingAnimation.stop();
    }
}
