package GameEngine.Player;

import GameEngine.Scorboard.LeaderBoardItem;
import com.google.common.hash.Hashing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.nio.charset.StandardCharsets;
import java.util.List;

@RestController
public class PlayerController {


    @Autowired
    private PlayerService playerService;

    /**
     * gets all of the players that is present in player table
     * @return the list of players in player table
     */
    @RequestMapping(value = "/players", method = RequestMethod.GET)
    public List<Player> getAllPlayers(){
        return playerService.getAllPlayers();
    }

    /**
     * gets the player whose name is the "name" parameter from the player table
     * @param name the name of the player that we want to get
     * @return the player that we get from player table
*/
    @RequestMapping(value = "/player/{name}", method = RequestMethod.GET)
    public Player getPlayer(@PathVariable String name){
        return playerService.getPlayer(name);
    }

    /**
     * creates a player with the given name and password with zero score
     * adds it to the database
     * will be used while registering the player
     * @param name is the name of the player that will be created
     * @param password is the password of the player that will be created
     * @return  the inserted player
     */
    @RequestMapping(value = "/add_player/{name}/{password}", method = RequestMethod.POST)
    public Player addPlayer(@PathVariable String name, @PathVariable String password){
        Player player = new Player(name,0,password);                                                 // create player with 3 argument constructor
        return playerService.addPlayer(player);
    }

    /**
     * first gets the player whose name is the "name" parameter
     * sets it's score to given score value
     * saves the players to the database
     * @param name is the name of the player that we want to change his/her score
     * @param score is the value that we want to set the player's score
     * @return the updated player
     */
    @RequestMapping(value= "/updateScore/{name}/{score}",method = RequestMethod.PUT)
    public Player updatePlayer(@PathVariable String name,@PathVariable int score){
        Player player = playerService.getPlayer(name);
        if (player != null){
            player.setScore(score);
            return playerService.updatePlayer(player);
        }
        return null;
    }

    /**
     * first gets the player whose name is the "name" parameter
     * sets his/her password to given password
     * @param name is the name of the player that we want to change his/her score
     * @param password is the password that we want to set the player's password
     * @return the updated player
     */
    @RequestMapping(value= "/updatePassword/{name}/{oldPassword}/{password}",method = RequestMethod.PUT)
    public Player updatePlayer(@PathVariable String name, @PathVariable String oldPassword ,@PathVariable String password) {
        if( authenticatePlayer(name,oldPassword) ){
            Player player = playerService.getPlayer(name);
            if (player != null){
                player.setPasswordHash(password);
                return playerService.updatePlayer(player );
            }
        }
        return null;
    }

    /**
     * deletes the player whose name is the "name" parameter
     * @param name the name of the player that we want to delete
     */
    @RequestMapping(value = "/delete/{name}",method = RequestMethod.DELETE)
    public void deletePlayer(@PathVariable String name){
        playerService.deletePlayer(name);
    }

    /**
     * gets the specified player from the database and checks provided password with player's password
     * @param name specifies the player
     * @param password password that player provided
     * @return if the password matches or not
     */
    @RequestMapping(value = "/login/{name}/{password}" , method = RequestMethod.GET)
    public boolean authenticatePlayer(@PathVariable String name,@PathVariable String password){
        Player player = playerService.getPlayer(name);
        if(player != null){
            String providedHash = Hashing.sha256()
                    .hashString(password, StandardCharsets.UTF_8)
                    .toString();
            return player.getPasswordHash().equals(providedHash);
        }
        return false;

    }


    /**
     * Simply returns all time leader board.
     * This is the request that returns the players and their all time point
     * It's query is implemented as custom query in repository.
     *
     */
    @RequestMapping(value = "/get_all_time_table",method = RequestMethod.GET)
    public List<LeaderBoardItem> getAllTimeTable(){
        return playerService.getAllTimeTable();
    }

}
