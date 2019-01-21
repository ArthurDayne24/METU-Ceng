package playerControllerTest;


import GameEngine.Player.Player;
import GameEngine.Player.PlayerController;
import org.mockito.Mockito;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Profile;


@Profile("testPlayerController")
@Configuration
public class playerControllerTestConfiguration {
    @Bean
    @Primary
    public PlayerController playerController(){
        return Mockito.mock(PlayerController.class);
    }

}



