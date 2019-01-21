package GameEngine.Scorboard;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import java.util.Date;


public interface ScoreboardRepository extends CrudRepository<Scoreboard,ScoreboardIdentity> {

    /**
     * This is the query that deletes all the scores, which are created before the given date, from Scoreboard table.
     * @param date
     */
    @Transactional
    @Modifying
    @Query(value = "DELETE FROM scoreboard  WHERE scoreboard.date < :date",nativeQuery = true)
    void deleteScores(@Param("date") Date date);

}
