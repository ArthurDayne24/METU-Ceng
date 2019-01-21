package GameEngine.Scorboard;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * This is the entity that helps us to show user leader boards as only player_name and his/her score columns
 */
@Entity
public class LeaderBoardItem {

    @Id
    @Column(name = "name")
    private String name;

    @Column(name = "score")
    private long score;

    public LeaderBoardItem(){

    }

    /**
     * Simple constructor.
     * @param name
     * @param score
     */
    public LeaderBoardItem(String name, long score){
        this.name = name;
        this.score = score;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getScore() {
        return score;
    }

    public void setScore(long tolalScore) {
        this.score = tolalScore;
    }
}
