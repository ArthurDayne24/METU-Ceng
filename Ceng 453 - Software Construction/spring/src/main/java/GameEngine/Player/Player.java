package GameEngine.Player;

import com.google.common.hash.Hashing;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.nio.charset.StandardCharsets;

/**
 *
 * Code below create table named "player" and get its attributes from database
 * Since we have player_name, score and password_hash columns in player table in database, attributes of Player class must match with the database columns.
 *
 */

@Entity
@Table(name = "player")
public class Player implements Serializable {

    @NotNull
    @Column(name = "player_name")
    @Id
    private String playerName;


    @NotNull
    @Column(name = "score")
    private int score;

    @NotNull
    @Column(name = "password_hash")
    private String passwordHash;


    public Player(){                                                                                                    // No argument constructor

    }


    /**
     *
     * Simple constructor of Player
     * Gets actual password and convert it to SHA256 string
     * Player with hashed password is inserted to the Player table
     *
     */

    public Player(String mname,int score,String password){                                                              // 3  argument constructor
        super();
        this.playerName = mname;
        this.score = score;
        this.passwordHash = Hashing.sha256()
                .hashString(password, StandardCharsets.UTF_8)
                .toString();
    }

    ////// Belows are Getters and Setters

    public String getPasswordHash() {
        return passwordHash;
    }

    public String getPlayerName() {
        return playerName;
    }

    public void setPasswordHash(String password) {
        this.passwordHash = Hashing.sha256()
                .hashString(password, StandardCharsets.UTF_8)
                .toString();
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getScore() {
        return score;
    }


}
