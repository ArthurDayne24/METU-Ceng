package GameEngine.Player;

import GameEngine.Scorboard.LeaderBoardItem;
import GameEngine.Scorboard.LeaderBoardItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PlayerService {

    @Autowired
    private PlayerRepository playerRepository;

    @Autowired
    private LeaderBoardItemRepository leaderBoardItemRepository;


    /**
     *
     * Calls Player Repository function to execute "SELECT" query of the Crud Repository in order to get all players in Player table in the database
     * @return List</Player>
     */
    public List<Player> getAllPlayers(){
        List<Player> players = new ArrayList<>();
        playerRepository.findAll().forEach(players::add);
        return players;
    }

    /**
     *
     * Returns a specific player which matches with provided name.
     *
     */
    public Player getPlayer(String name){
        return playerRepository.findOne(name);
    }

    /**
     *
     * Adds the provided player to the Player table in the database.
     *
     */
    public Player addPlayer(Player player){
        if(!playerRepository.exists(player.getPlayerName()))
            return playerRepository.save(player);
        return null;
    }

    /**
     *
     * Updates the specific player which matches with provided Player.
     *
     */
    public Player updatePlayer(Player player){
        return playerRepository.save(player);
    }

    /**
     *
     * Deletess the specific player which matches with provided Player.
     *
     */
    public void deletePlayer(String name){
        playerRepository.delete(name);
    }


    /**
     *
     * Calls Player Repository function to execute "SELECT" query of the Crud Repository in order to get all players' scores and shows as all time leader board
     * @return List</LeaderBoardItem>
     */
    public List<LeaderBoardItem> getAllTimeTable(){
        return leaderBoardItemRepository.allTimeTable();
    }



}
