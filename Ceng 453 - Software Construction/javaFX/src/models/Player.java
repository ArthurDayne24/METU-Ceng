package models;

public class Player {
    private String playerName;
    private int score;

    // two argument constructor
    public Player(String playerName, int score) {
        this.playerName = playerName;
        this.score = score;
    }

    /// Belows are getters and setters.

    public String getPlayerName() {
        return playerName;
    }

    /**
     * @return score of the player.
     */
    public int getScore() {
        return score;
    }

    /**
     * Setting function of the score for player.
     * @param score of the player.
     */
    public void setScore(int score) {
        this.score = score;
    }
}
