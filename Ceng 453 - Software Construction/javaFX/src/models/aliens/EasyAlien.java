package models.aliens;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.util.Duration;
import models.bullets.BulletAlienEasy;

import static utils.Constants.*;

public class EasyAlien extends Alien {

    /**
     * Constructor of the easy alien.
     * @param x is the horizontal position of the circle.
     * @param y is the vertical position of the circle.
     * @param radius is the radius.
     */
    public EasyAlien(int x, int y, int radius){
        super(x,y,radius);
        this.hp = 1;
        this.setFill(Color.DARKBLUE);
        this.setStroke(Color.BLUE);
    }


    /**
     * Bullet animation is triggered here with a random chance of firing bullet
     * @param pane the pane that we shoot in
     */
    @Override
    public void startShootingAnimation(Pane pane) {
        this.shootingAnimation = new Timeline(
                new KeyFrame( Duration.millis(EASY_FIRE_RATE), e -> {
                    double d = Math.random();
                    if (d < EASY_ALIEN_CHANCE)
                        shoot(pane);
                })
        );
        this.shootingAnimation.setCycleCount(Timeline.INDEFINITE);
        // Start animation
        this.shootingAnimation.play();

    }

    /**
     * No moving animation belongs to easy alien
     */
    @Override
    public void startMovingAnimation() { }

    /**
     * Easy alien bullet creation is done here and than animation of the easy alien bullet starts from here
     * @param pane the pane that we are shooting in
     */
    @Override
    public void shoot(Pane pane) {
        //create bullet
        BulletAlienEasy bullet = new BulletAlienEasy((int) (this.getCenterX()), (int) this.getCenterY(), 3);

        //add bullet to the pane
        pane.getChildren().addAll(bullet);

        bullet.startAnimation(pane, EASY_BULLET_SPEED);



    }




}
