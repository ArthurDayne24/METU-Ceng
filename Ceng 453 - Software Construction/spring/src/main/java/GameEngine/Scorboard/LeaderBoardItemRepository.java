package GameEngine.Scorboard;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

public interface LeaderBoardItemRepository extends CrudRepository<LeaderBoardItem, String> {

    /**
     * This is the custom query that selects the players' scores which are created after the given time from Scoreboard table.
     * In our game, this time will be 1 week.
     * This query will be executed to show user weekly leader board.
     * @param date
     */
    @Query(value = "SELECT name, sum(score) as score FROM scoreboard  WHERE scoreboard.date > :date  GROUP by name ORDER by score DESC " , nativeQuery = true)
    List<LeaderBoardItem> weeklyTable(@Param("date") Date date);

    /**
     * This is the custom query that selects the players' all time scores from Player table.
     * This query will be executed to show user all time leader board.
     */
    @Query(value = "SELECT player_name as name, score  FROM player ORDER by score DESC " , nativeQuery = true)
    List<LeaderBoardItem> allTimeTable();

}
