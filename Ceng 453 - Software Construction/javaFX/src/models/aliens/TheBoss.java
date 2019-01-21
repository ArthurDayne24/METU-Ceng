package models.aliens;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.util.Duration;
import main.Main;
import models.bullets.BulletBoss;

import static utils.Constants.*;

public class TheBoss extends Alien {
    private int moveX=0, moveY=40, dx=POSITIVE_DIRECTION, dy=POSITIVE_DIRECTION;

    /**
     * Constructor of the easy alien.
     * @param x is the horizontal position of the circle.
     * @param y is the vertical position of the circle.
     * @param radius is the radius.
     */
    public TheBoss(int x, int y, int radius) {
        super(x, y, radius);
        this.hp = 25;
        this.setFill(Color.DARKMAGENTA);
        this.setStroke(Color.DARKRED);
    }

    /**
     * Bullet creation is done here but 2 bullets are created.
     * Their animations also start here.
     * Special thing in here is that there is 2 spaceship and the boss fight with them.
     * Therefore, the boss shoots fire towards both spaceship by taking tangent of the respective positions.
     * @param pane the pane that we shoot in
     */
    @Override
    public void shoot(Pane pane) {
        if (!Main.level.getSpaceShip().get(0).isDead()){
            BulletBoss bullet = new BulletBoss((int) (this.getCenterX()), (int) this.getCenterY(), 3,0);
            pane.getChildren().addAll(bullet);
            bullet.startAnimation(pane, BOSS_BULLET_SPEED);
        }
        if (!Main.level.getSpaceShip().get(1).isDead()){
            BulletBoss bullet = new BulletBoss((int) (this.getCenterX()), (int) this.getCenterY(), 3,1);
            pane.getChildren().addAll(bullet);
            bullet.startAnimation(pane, BOSS_BULLET_SPEED);
        }
    }

    /**
     * Bullet animation is triggered here with certain amount of time period
     * @param pane the pane that we shoot in
     */
    public void startShootingAnimation(Pane pane) {
        this.shootingAnimation = new Timeline(
                new KeyFrame( Duration.millis(BOSS_FIRE_RATE), e -> shoot(pane))
        );
        this.shootingAnimation.setCycleCount(Timeline.INDEFINITE);
        // Start animation
        this.shootingAnimation.play();
    }


    /**
     * Moving animation of the boss is done here.
     * Simply makes circle by changing position of the circle at a time.
     */
    @Override
    public void startMovingAnimation() {
        this.movingAnimation = new Timeline(
                new KeyFrame( Duration.millis(30), e -> {
                    if(moveX > BOSS_ANIMATION_SAME_DIRECTION_STEP_COUNT || moveX < 0) dx = -1*dx;
                    if(moveY > BOSS_ANIMATION_SAME_DIRECTION_STEP_COUNT || moveY < 0) dy = -1*dy;
                    if(dx == POSITIVE_DIRECTION){
                        if(dy == POSITIVE_DIRECTION){
                            this.setCenterX(this.getCenterX() + 2 );
                            this.setCenterY(this.getCenterY() + 2 );
                            moveX++;  moveY++;
                        }else {
                            this.setCenterX(this.getCenterX() + 2 );
                            this.setCenterY(this.getCenterY() - 2 );
                            moveX++;  moveY--;
                        }
                    }else {
                        if(dy == POSITIVE_DIRECTION){
                            this.setCenterX(this.getCenterX() - 2 );
                            this.setCenterY(this.getCenterY() + 2 );
                            moveX--;  moveY++;
                        }else {
                            this.setCenterX(this.getCenterX() - 2 );
                            this.setCenterY(this.getCenterY() - 2 );
                            moveX--;  moveY--;
                        }
                    }
                })
        );
        this.movingAnimation.setCycleCount(Timeline.INDEFINITE);
        // Start animation
        this.movingAnimation.play();
    }
}
