package models.bullets;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.layout.Pane;
import javafx.scene.shape.Circle;
import javafx.util.Duration;
import main.Main;



public abstract class Bullet extends Circle {
    int damagePower;
    Timeline bulletAnimation;

    Bullet(int x, int y, int radius){
        super(x, y, radius);
    }

    /**
     * This function is overwritten in subclasses
     * Function moves the bullet and calls the collisionCheck function
     * @param pane the pane that bullet moves in
     */
    public abstract void move(Pane pane);

    /**
     * This function is overwritten in subclasses
     * starts the bullet movement animation
     * @param pane the pane that collision occurs
     */
    public void startAnimation(Pane pane, int speed){
        this.bulletAnimation = new Timeline(
                new KeyFrame( Duration.millis(speed), e -> this.move(pane))
        );
        this.bulletAnimation.setCycleCount(Timeline.INDEFINITE);
        // Start animation
        this.bulletAnimation.play();
    }

    /**
     * stops the bullet movement animation
     */
    void stopAnimation(){
        bulletAnimation.stop();
    }

    /**
     * This function is overwritten in BulletSpaceShip class
     * Function checks if bullet hit to the spaceship
     * If spaceship is dead, stops the level and opens game over scene
     * @param pane the pane that collision happens
     */
    void checkCollision(Pane pane){
        for (int i = 0 ; i< Main.level.getSpaceShip().size(); i++){
            if(! Main.level.getSpaceShip().get(i).isDead()) {
                if(Main.level.getSpaceShip().get(i).getBoundsInParent().intersects(this.getBoundsInParent()) ){
                    // bullet crashed with spaceship
                    Main.level.getSpaceShip().get(i).getShot(this);
                    pane.getChildren().remove(this);
                    this.stopAnimation();
                    if(Main.level.getSpaceShip().get(i).isDead()){
                        if (i == 0){
                            Main.level.stopLevelFailed();
                            Main.startGameOver();
                        } else {
                            Main.level.getSpaceShip().get(i).stopShooting();
                            pane.getChildren().remove(Main.level.getSpaceShip().get(i));
                        }
                    }
                    break;
                }

            }
        }
    }

    /// Getters and Setters

    public int getDamagePower() {
        return damagePower;
    }
}
