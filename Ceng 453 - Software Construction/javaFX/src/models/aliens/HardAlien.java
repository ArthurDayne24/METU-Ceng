package models.aliens;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.util.Duration;
import models.bullets.*;

import static utils.Constants.*;

public class HardAlien extends Alien {
    private int moveX=0, moveY=20, dx=POSITIVE_DIRECTION, dy=POSITIVE_DIRECTION;

    /**
     * Constructor of the hard alien.
     * @param x is the horizontal position of the circle.
     * @param y is the vertical position of the circle.
     * @param radius is the radius.
     */
    public HardAlien(int x, int y, int radius){
        super(x,y,radius);
        this.hp  = 2;
        this.setFill(Color.RED);
        this.setStroke(Color.ORCHID);
    }

    /**
     * Bullet animation is triggered here with a random chance of firing bullet
     * @param pane the pane that we shoot in
     */
    @Override
    public void startShootingAnimation(Pane pane) {
        this.shootingAnimation = new Timeline(
                new KeyFrame( Duration.millis(HARD_FIRE_RATE), e -> {
                    double d = Math.random();
                    if (d < HARD_ALIEN_CHANCE)
                        shoot(pane);
                })
        );
        this.shootingAnimation.setCycleCount(Timeline.INDEFINITE);
        // Start animation
        this.shootingAnimation.play();
    }


    /**
     * Moving animation of the hard alien is done here.
     * Simply makes circle by changing position of the circle at a time.
     */
    @Override
    public void startMovingAnimation() {
        this.movingAnimation = new Timeline(
                new KeyFrame( Duration.millis(30), e -> {
                    if(moveX > HARD_ALIEN_ANIMATION_SAME_DIRECTION_STEP_COUNT || moveX < 0) dx = -1*dx;
                    if(moveY > HARD_ALIEN_ANIMATION_SAME_DIRECTION_STEP_COUNT || moveY < 0) dy = -1*dy;
                    if(dx == POSITIVE_DIRECTION){
                        if(dy == POSITIVE_DIRECTION){
                            this.setCenterX(this.getCenterX() + 1 );
                            this.setCenterY(this.getCenterY() + 1 );
                            moveX++;  moveY++;
                        }else {
                            this.setCenterX(this.getCenterX() + 1 );
                            this.setCenterY(this.getCenterY() - 1 );
                            moveX++;  moveY--;
                        }
                    }else {
                        if(dy == POSITIVE_DIRECTION){
                            this.setCenterX(this.getCenterX() - 1 );
                            this.setCenterY(this.getCenterY() + 1 );
                            moveX--;  moveY++;
                        }else {
                            this.setCenterX(this.getCenterX() - 1 );
                            this.setCenterY(this.getCenterY() - 1 );
                            moveX--;  moveY--;
                        }
                    }
                })
        );
        this.movingAnimation.setCycleCount(Timeline.INDEFINITE);
        // Start animation
        this.movingAnimation.play();
    }


    /**
     * Hard alien bullet creation is done here and than animation of the hard alien bullet starts from here
     * @param pane the pane that we are shooting in
     */
    @Override
    public void shoot(Pane pane) {
        //create bullet
        BulletAlienHard bullet = new BulletAlienHard((int) (this.getCenterX()), (int) this.getCenterY(), 3);

        //add bullet to the pane
        pane.getChildren().addAll(bullet);

        bullet.startAnimation(pane, HARD_BULLET_SPEED);
    }


}
