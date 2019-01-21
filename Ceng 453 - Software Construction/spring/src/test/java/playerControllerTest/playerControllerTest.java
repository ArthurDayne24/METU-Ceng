package playerControllerTest;


import GameEngine.Application;
import GameEngine.Player.Player;
import GameEngine.Player.PlayerController;
import GameEngine.Scorboard.LeaderBoardItem;
import com.google.common.hash.Hashing;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.nio.charset.StandardCharsets;
import java.util.List;

import static org.mockito.Mockito.doThrow;


/**
 * This is the main test function that tests al the possible url inputs and check the result whether matches with expected values.
 * Explanation of the each test functions are given on the top of the each function.
 */
@ActiveProfiles("testPlayerController")
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Application.class)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class playerControllerTest {
    private PlayerController mock = org.mockito.Mockito.mock(PlayerController.class);


    @Autowired
    private PlayerController playerController;

    /**
     * newPlayer will be tested.
     * Initial Player object.
     */
    private Player newPlayer = new Player("newPlayer",0,"newPassword");

    /**
     * Test Case: Give new player and we expect newPlayer to be added to the Player table in database
     * expected -> return added Player
     */
    @Test
    public void AgivenNewPlayer_CanAddPlayer(){
        Mockito.when(mock.addPlayer(newPlayer.getPlayerName(),"newPassword")).thenReturn(newPlayer);
        Player responseNewPlayer = playerController.addPlayer(newPlayer.getPlayerName(),"newPassword");
        Assert.assertEquals(newPlayer.getScore(),responseNewPlayer.getScore());
        Assert.assertEquals(newPlayer.getPasswordHash(),responseNewPlayer.getPasswordHash());

    }

    /**
     * Test Case: Give new player again and we expect newPlayer not to be added because of primary key constraint of the player_name column
     * expected -> return null
     */
    @Test
    public void BgivenExistingPlayer_CannotAddPlayer(){
        Mockito.when(mock.addPlayer(newPlayer.getPlayerName(),"newPassword")).thenReturn(null);
        Player player1 = playerController.addPlayer(newPlayer.getPlayerName(),"newPassword");
        Assert.assertEquals(player1,null);
    }

    /**
     * Test Case: Non-existing player login attempt is tested, won't be able ot login as non-existing player
     * expected return value -> false
     */
    @Test
    public void CgivenNonExistingPlayer_thenCannotLogin(){
        Mockito.when(mock.authenticatePlayer("nonExistingPlayer","nonExistingPassword")).thenReturn(false);
        boolean result = playerController.authenticatePlayer("nonExistingPlayer","nonExistingPassword");
        Assert.assertEquals(false,result);
    }

    /**
     * Test Case: Existing player with false password login attempt is tested, won't be able ot login since false password is given
     * expected return value -> false
     */
    @Test
    public void DgivenFalsePasswordExistingPlayer_thenCannotLogin(){
        Mockito.when(mock.authenticatePlayer(newPlayer.getPlayerName(),"falsePassword")).thenReturn(false);
        boolean result = playerController.authenticatePlayer(newPlayer.getPlayerName(),"falsePassword");
        Assert.assertEquals(false,result);
    }

    /**
     * Test Case: Existing player with true password login attempt is tested, will be able ot login since true password is given
     * expected return value -> true
     */
    @Test
    public void EgivenTruePasswordExistingPlayer_thenCanLogin(){
        Mockito.when(mock.authenticatePlayer(newPlayer.getPlayerName(),"newPassword")).thenReturn(true);
        boolean result = playerController.authenticatePlayer(newPlayer.getPlayerName(),"newPassword");
        Assert.assertEquals(true,result);
    }


    /**
     * Test Case: Getting Non-Existing player information by giving its name attempt is tested, expect to not give any player
     * expected return value -> null
     */
    @Test
    public void FwhenGivenNotExistingName_thenRetrieveNull() {
        Mockito.when(mock.getPlayer("notInDatabase")).thenReturn(null);
        Player player2 = playerController.getPlayer("notInDatabase");
        Assert.assertEquals(player2,null);
    }

    /**
     * Test Case: Getting Existing player information by giving its name attempt is tested, tester expect server to give correct player
     * expected return value -> Player
     */
    @Test
    public void GwhenExistingNameIsProvided_thenRetrieveCorrectPlayer() {
        Mockito.when(mock.getPlayer(newPlayer.getPlayerName())).thenReturn(newPlayer);
        Player player2 = playerController.getPlayer(newPlayer.getPlayerName());
        Assert.assertEquals(newPlayer.getScore(),player2.getScore());
        Assert.assertEquals(newPlayer.getPasswordHash(),player2.getPasswordHash());
    }

    /**
     * Test Case: Getting all players information attempt is tested, tester expect server to give not null list
     * Since even if there is no player in database, it should return empty list, not null
     * expected return value ->  not null list
     */
    @Test
    public void HgetAllPlayersShouldNotBeNull(){
        List<Player> players = playerController.getAllPlayers();
        Assert.assertNotEquals(null,players);
    }

    /**
     * Test Case: Getting all time scores information attempt is tested, tester expect server to give not null list
     * Since even if there is no player and their scores in database, it should return empty list, not null
     * expected return value ->  not null list
     */
    @Test
    public void HgetAllTimeScoreShouldNotBeNull(){
        List<LeaderBoardItem> allTimeLeaderboard= playerController.getAllTimeTable();
        Assert.assertNotEquals(null,allTimeLeaderboard);
    }

    /**
     * Test Case: Updating non-existing Player's score attempt is tested, tester expect server to not update any player's score
     * expected return value -> null
     */
    @Test
    public void IupdateScoreOfNonExistingPlayer_thenRetrieveNull(){
        Mockito.when(mock.updatePlayer("nonExistingPlayer",100)).thenReturn(null);
        Player responseNewPlayer = playerController.updatePlayer("nonExistingPlayer",100);
        Assert.assertEquals(null,responseNewPlayer);
    }

    /**
     * Test Case: Updating existing Player's score attempt is tested, tester expect server to update given player
     * expected return value -> Player object
     */
    @Test
    public void JupdateScoreOfExistingPlayer_thenSuccessfulUpdate(){
        Mockito.when(mock.updatePlayer(newPlayer.getPlayerName(),100)).thenReturn(newPlayer);
        Player responseNewPlayer = playerController.updatePlayer(newPlayer.getPlayerName(),100);
        Assert.assertEquals(newPlayer.getScore()+100,responseNewPlayer.getScore());
    }

    /**
     * Test Case: Updating non-existing Player's password attempt is tested, tester expect server to not update any Player's password
     * expected return value -> null
     */
    @Test
    public void KupdatePasswordOfNonExistingPlayer_thenRetrieveNull(){
        Mockito.when(mock.updatePlayer("nonExistingPlayer","dummyOldPassword","dummyNewPassword")).thenReturn(null);
        Player responseNewPlayer = playerController.updatePlayer("nonExistingPlayer","dummyOldPassword","dummyNewPassword");
        Assert.assertEquals(null,responseNewPlayer);
    }

    /**
     * Given wrong Password and Existing Player
     * Test Case: Updating existing Player's password attempt is tested, tester expect server to not update given player's password because of false oldPassword
     * expected return value -> null
     */

    @Test
    public void LupdatePasswordOfExistingPlayerWithFalsePassword_thenNoUpdate(){
        Mockito.when(mock.updatePlayer(newPlayer.getPlayerName(),"falsePassword","updatePassword")).thenReturn(null);
        Player responseNewPlayer = playerController.updatePlayer(newPlayer.getPlayerName(),"falsePassword","updatePassword");
        Assert.assertEquals(null,responseNewPlayer);
    }

    /**
     * Given correct Password and Existing Player
     * Test Case: Updating existing Player's password attempt is tested, tester expect server to update given player's password
     * expected return value -> updatedPlayer
     */
    @Test
    public void LupdatePasswordOfExistingPlayer_thenSuccessfulUpdate(){
        Player responseNewPlayer = playerController.updatePlayer(newPlayer.getPlayerName(),"newPassword","updatePassword");
        String updatedPasswrodHash = Hashing.sha256()
                .hashString("updatePassword", StandardCharsets.UTF_8)
                .toString();
        Assert.assertEquals(updatedPasswrodHash,responseNewPlayer.getPasswordHash());
    }

    /**
     * Test Case: Deleting existing Player from database attempt is tested, tester expect server to delete given player
     * Return value is null because tester try to get the player from database but since player is deleted, tester returns null
     * expected return value = null
     */
    @Test
    public void MdeleteExistingPlayer_CanDelete(){
        playerController.deletePlayer(newPlayer.getPlayerName());
        Player responseNewPlayer = playerController.getPlayer(newPlayer.getPlayerName());
        Assert.assertEquals(null,responseNewPlayer);
    }

    /**
     * Test Case: Deleting non-existing Player from database attempt is tested, tester expcet server to throw exception
     * expected response -> Throw exception
     */
    @Test
    public void NdeleteNonExistingPlayer_CannotDelete(){
          doThrow(new EmptyResultDataAccessException(1)).when(mock).deletePlayer(newPlayer.getPlayerName());
    }

}


