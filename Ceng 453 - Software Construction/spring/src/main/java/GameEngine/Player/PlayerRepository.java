package GameEngine.Player;

import org.springframework.data.repository.CrudRepository;

/**
 *
 * Crud Repository is used to map requests to SQL queries
 * Calling PlayerRepository functions operate SQL queries
 */
public interface PlayerRepository extends CrudRepository<Player, String > {

}
