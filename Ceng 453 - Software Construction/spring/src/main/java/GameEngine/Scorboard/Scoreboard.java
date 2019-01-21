package GameEngine.Scorboard;

import javax.persistence.*;
import javax.validation.constraints.NotNull;


/**
 *
 * Class below creates table named "scoreboard" which keeps track of the each game of the players, its score and date and gets its attributes from database
 * Since we have score, player and date columns in scoreboard table in database, attributes of Score class must match with the database columns.
 * Attribute 1: score which maps the score column in the scoreboard table in database
 * Attribute 2: ScoreboardIdentity object which has 2 attributes, named name and date, maps the player_name and date columns in the player table in database
 *
 */

@Entity
@Table(name = "scoreboard")
public class Scoreboard {



    @EmbeddedId
    private ScoreboardIdentity scoreboardIdentity;

    @NotNull
    @Column(name = "score")
    private int score;



    public Scoreboard(){

    }


    /**
     *
     * Simple constructor of Scoreboard
     * @param scoreboardIdentity
     * @param score
     *
     */


    public Scoreboard(ScoreboardIdentity scoreboardIdentity,int score) {
        this.scoreboardIdentity = scoreboardIdentity;
        this.score = score;
    }



    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }


    public ScoreboardIdentity getScoreboardIdentity() {
        return scoreboardIdentity;
    }

    public void setScoreboardIdentity(ScoreboardIdentity scoreboardIdentity) {
        this.scoreboardIdentity = scoreboardIdentity;
    }


}
