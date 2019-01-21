package GameEngine.Scorboard;

import GameEngine.Player.Player;
import GameEngine.Player.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;


/**
 * The class below is request handler .
 * Simply URLs and functions are mapped.
 * Takes given URL with corresponding HTTP method and sends received parameters to desired functions.
 */

@RestController
public class ScoreboardController {
    @Autowired
    private ScoreboardService scoreboardService;



    @Autowired
    private PlayerService playerService;


    /**
     *
     * This get request gets all the scores from the scoreboard table in database
     *
     */
    @RequestMapping(value = "/scores", method = RequestMethod.GET)
    public List<Scoreboard> getAllScores(){
        return scoreboardService.getAllScores();
    }


    /**
     *
     * This post request insert a game score, which includes name, score and date, to the scoreboard
     * Since we are not getting date as input, date variable is time of end of the game
     * Also updates the player's score inside the "player" table
     * @param name  is the name of the player who has the score
     * @param score is the value that player's score that we want to add to the database
     *
     */
    @RequestMapping(value = "/add_score/{name}/{score}" , method = RequestMethod.POST)
    public Scoreboard addScore(@PathVariable String name,@PathVariable int score){
        Date date =new Date();
        ScoreboardIdentity scoreboardIdentity = new ScoreboardIdentity(name,date);
        Scoreboard scoreboard = new Scoreboard(scoreboardIdentity,score);
        Player player =playerService.getPlayer(name);
        if(player != null){
            player.setScore(player.getScore() + score);
            playerService.updatePlayer(player);
            return scoreboardService.addScore(scoreboard);

        }
        return null;
    }

//
//      WE ARE NOT SURE IF WE NEED TO uSE  THIS REQUEST
//
//
//     /**
//     *
//     * This delete request is implemented in order to update scoreboard table.
//     * When a day passes, this request deletes all the scores that has been created one week before.
//     * This method will only be used when a day passes.
//     * This request will have never been requested by player. It will be automatically called at 12:00
//     */
//    @RequestMapping(value = "/delete_week_before" , method = RequestMethod.DELETE)
//    public void deleteWeekBefore(){
//        scoreboardService.deleteWeekBefore();
//    }
//


    /**
     * Simply weekly leader board.
     * This is the request that returns the players and their weekly gathered point
     * It's query is implemented as custom query in repository.
     *
     */
    @RequestMapping(value = "/get_weekly_score",method = RequestMethod.GET)
    public List<LeaderBoardItem> getWeeklyTable(){
        return scoreboardService.getWeeklyScoreTable();
    }


}
