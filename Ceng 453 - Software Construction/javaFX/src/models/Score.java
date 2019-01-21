package models;


public class Score {
    private int rank;
    private String name;
    private long score;

    /**
     * Constructor of the score class.
     * @param name of the player.
     * @param score value.
     */
    public Score(String name, long score){
        this.name = name;
        this.score = score;
    }

    /**
     * Constructor of the score class.
     * @param rank of the player.
     * @param name of the player.
     * @param score value
     */
    public Score(int rank, String name, long score){
        this.rank = rank;
        this.name = name;
        this.score = score;

    }

    /**
     * @return score of the playerç
     */
    public long getScore() {
        return score;
    }

    /**
     * @return sets score of the player.
     */
    public String getName() {
        return name;
    }

}
