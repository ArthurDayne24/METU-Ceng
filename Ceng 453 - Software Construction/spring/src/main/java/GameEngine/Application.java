package GameEngine;

import GameEngine.Scorboard.ScoreboardService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@SpringBootApplication
@EnableScheduling
public class Application {

    public static void main(String[] args){
        ScoreboardService scoreboardService;

//        public void delete(){
//            scoreboardService.deleteWeekBefore();
//        }

        SpringApplication.run(Application.class,args);
    }
}
