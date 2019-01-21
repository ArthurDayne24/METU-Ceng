package GameEngine.Scorboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ScoreboardService {

    @Autowired
    private ScoreboardRepository scoreboardRepository;

    @Autowired
    private LeaderBoardItemRepository leaderBoardItemRepository;

    /**
     * This is the function that gets all the scores from the database and add each score to the List.
     * @return List<Scoreboard>
     */
    public List<Scoreboard> getAllScores(){
        List<Scoreboard> scores = new ArrayList<>();
        scoreboardRepository.findAll().forEach(scores::add);
        return scores;
    }

    public Scoreboard getScore(ScoreboardIdentity scoreboardIdentity){
        return scoreboardRepository.findOne(scoreboardIdentity);
    }

    public Scoreboard addScore(Scoreboard scoreboard){
        return scoreboardRepository.save(scoreboard);
    }

    public Scoreboard updateScore(Scoreboard scoreboard){
        return scoreboardRepository.save(scoreboard);
    }

    public void deleteScore(ScoreboardIdentity scoreboardIdentity){
        scoreboardRepository.delete(scoreboardIdentity);
    }

    /**
     * This is the function that deletes scores which are exactly created before 1 week(604800 second) from Scoreboard table in the database.
     * Will be called every day at 12:00
     */
    @Scheduled(cron = "0 0 12 * * ?")
    public void deleteWeekBefore(){
        Date date =new Date(System.currentTimeMillis() - 604800000);
        scoreboardRepository.deleteScores(date);

    }

    /**
     * This is the function that gets weekly score table by
     * checking whether score is created exactly after 1 week(604800 second) and gets them and show user as all time leader board
     * @return List<LeaderBoardItem>
     */
    public List<LeaderBoardItem> getWeeklyScoreTable(){
        Date date =new Date(System.currentTimeMillis() - 604800000);
        return  leaderBoardItemRepository.weeklyTable(date);

    }
}
