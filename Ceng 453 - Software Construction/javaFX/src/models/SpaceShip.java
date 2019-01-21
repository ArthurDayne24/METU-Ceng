package models;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.util.Duration;
import main.Main;
import models.bullets.Bullet;
import models.bullets.*;

import static utils.Constants.*;


public class SpaceShip extends Rectangle {
    private int hp;
    private Timeline shootingAnimation;

    public SpaceShip(int x, int y, int width, int height){
        super(x, y, width, height);
        hp = 3;
        this.setFill(Color.GREEN);

    }

    /**
     * this function sets spaceship moves with the mouse
     */
    public void setMovementWithMouse(){
        // set mouse control to spaceship
        this.setOnMouseDragged(e -> {
            this.setX(e.getX() - this.getWidth()/2);
            this.setY(e.getY() - this.getHeight()/2);
        });
    }

    /**
     * This function start shooting from the spaceShip
     * This needs to be called when level 1 starts
     */
    public void startShooting(Pane pane){
        // create bullets in every 200 millisecond

        shootingAnimation = new Timeline(
                new KeyFrame(Duration.millis(SPACESHIP_FIRE_RATE), e -> createBullet(pane)));
        shootingAnimation.setCycleCount(Timeline.INDEFINITE);
        shootingAnimation.play(); // Start animation
    }

    /**
     * this function should be called when a aliens's bullet hits the spaceship
     * it subtracts bullet damage power from it's hp
     * it sets it's color according to it's remaining hp
     * hp might end up with negative values
     * @param bullet is the bullet that hits the spaceship
     */
    public void getShot(Bullet bullet){
        hp -= bullet.getDamagePower();
        if(hp == 2){
            this.setFill(Color.DARKORANGE);
        }else if (hp == 1){
            this.setFill(Color.ORANGERED);
        }
        Main.level.updateSpaceshipHp();
    }

    /**
     * Returns true (dead) if spaceship's hp lover than or equal to 0
     * @return if dead or not
     */
    public boolean isDead(){
        return hp <= 0;
    }

    /**
     * stops shooting animation
     */
    public void stopShooting(){
        shootingAnimation.stop();
    }

    /**
     * This function creates a bullet
     * adds the bullet to the pane and start animation
     * @param pane the pane that we will add the bullets
     */
    private void createBullet(Pane pane){
        //create bullet
        BulletSpaceShip bullet = new BulletSpaceShip((int) (this.getX()+ this.getWidth() / 2), (int) this.getY(), 3);
        //add bullet to the pane
        pane.getChildren().addAll(bullet);
        // set animation to the bullet
        bullet.startAnimation(pane, SPACESHIP_BULLET_SPEED);
    }

    /**
     * @return health point of the player.
     */
    public int getHp() {
        return hp;
    }
}
