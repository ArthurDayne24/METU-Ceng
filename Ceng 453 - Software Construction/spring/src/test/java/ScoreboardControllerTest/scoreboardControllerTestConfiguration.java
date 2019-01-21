package ScoreboardControllerTest;


import GameEngine.Player.PlayerController;
import GameEngine.Scorboard.ScoreboardController;
import org.mockito.Mockito;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Profile;

@Profile("testScoreboardController")
@Configuration
public class scoreboardControllerTestConfiguration {
    @Bean
    @Primary
    public ScoreboardController scoreBoardCont(){
        return Mockito.mock(ScoreboardController.class);
    }

}
