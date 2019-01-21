package ScoreboardControllerTest;

import GameEngine.Application;
import GameEngine.Player.Player;
import GameEngine.Player.PlayerController;
import GameEngine.Scorboard.LeaderBoardItem;
import GameEngine.Scorboard.Scoreboard;
import GameEngine.Scorboard.ScoreboardController;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@ActiveProfiles("testScoreboardController")
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Application.class)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class scoreboardControllerTest {

    private ScoreboardController mock = org.mockito.Mockito.mock(ScoreboardController.class);

    @Autowired
    private ScoreboardController scoreboardController;


    @Autowired
    private PlayerController playerController;

    private Player newPlayer = new Player("newPlayer",0,"newPassword");

    /**
     * This test function tests if a given name that has not corresponding player
     * in the player table, whether score is added or not.
     * Expected result is that score should not added and "addScore()" method return null
     */
    @Test
    public void givenNonExistingName_thenNotAdded(){
        Mockito.when(mock.addScore("nonExistingName",0)).thenReturn(null);
        Scoreboard scoreboard = scoreboardController.addScore("nonExistingName",0);
        Assert.assertEquals(null,scoreboard);
    }

    /**
     * This test function tests if a given name that has corresponding player in
     * the player table, whether score is added or not.
     * Expected result is that score is added and "addScore()" method return inserted score
     *
     */
    @Test
    public void givenExistingName_thenAddTheScore(){
        playerController.addPlayer(newPlayer.getPlayerName(),"newPassword");
        Scoreboard scoreboard = scoreboardController.addScore(newPlayer.getPlayerName(),0);
        Assert.assertNotEquals(null,scoreboard);
        Assert.assertEquals( scoreboard.getScoreboardIdentity().getName(),newPlayer.getPlayerName());
        playerController.deletePlayer(newPlayer.getPlayerName());
    }

    /**
     * This test function test if getAllScores() method returns null or not.
     * Expected result is that returning value must never be null (empty list if there is no entry).
     */
    @Test
    public void getAllScoresMustBeNotNull(){
        List<Scoreboard> scoreboards = scoreboardController.getAllScores();
        Assert.assertNotEquals(null,scoreboards);
    }

    /**
     * This test function test if getWeeklyTable() method returns null or not.
     * Expected result is that returning value must never be null (empty list if there is no entry).
     */
    @Test
    public void getWeeklyLeaderBoardMustBeNotNull(){
        List<LeaderBoardItem> leaderBoardItems= scoreboardController.getWeeklyTable();
        Assert.assertNotEquals(null,leaderBoardItems);
    }

    /**
     * Because the database has more then one score entities with the same name, and we group them
     * with the name column, this function checks if result has more then one result with the same name or not.
     * Expected result is not to have two or more entities with the same name
     */
    @Test
    public void weeklyLeaderBoardTableMustHaveNoDuplicateNames(){
        List<LeaderBoardItem> leaderBoardItems= scoreboardController.getWeeklyTable();
        boolean flag = false;
        for (int i =0 ; i< leaderBoardItems.size() && !flag;i++){
            for (int j = i+1;j<leaderBoardItems.size();j++){
                if(leaderBoardItems.get(i).getName().equals(leaderBoardItems.get(j).getName())){
                    flag = true;
                    break;
                }
            }
        }
        Assert.assertFalse(flag);
    }

    /**
     * This function test if the entities are ordered by their score values in decreasing
     * (non increasing) order.
     * Expected result is to have entities in decreasing order with respect to their scores.
     */
    @Test
    public void weeklyLeaderBoardTableMustBeInDecreasingOrder(){
        List<LeaderBoardItem> leaderBoardItems= scoreboardController.getWeeklyTable();
        boolean flag = true;
        int size = (leaderBoardItems.size() -1);
        for (int i =0 ; i < size ;i++) {
            if(leaderBoardItems.get(i).getScore() < leaderBoardItems.get(i+1).getScore()){
                flag = false;
                break;
            }
        }
        Assert.assertTrue(flag);
    }
}
