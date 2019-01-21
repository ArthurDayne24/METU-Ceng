package requests;


import com.google.gson.Gson;
import models.Player;
import models.Score;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.json.simple.parser.JSONParser;

import static utils.Constants.*;

public class Requests {

    // Base url for all requests
        private static final String baseUrl =  SPRING_BASE_URL;


    /**
     * This function returns the web service response to the get request of "/login/username/password" query.
     * Web service returns "true" if given name exists in database with given password.
     * @param name is the name of player that wants to login
     * @param password is the password that the player provided
     * @return String value "true" or "false"
     */
    public static boolean authentication(String name, String password){
        // create query string
        // String builder is preferred to append strings objects
        StringBuilder querySting =  new StringBuilder();
        querySting.append(baseUrl).append("login/").append(name).append("/").append(password);

        String response = performGetRequest(querySting.toString());
        if(response.equals("true")){
            return true;
        }
        System.out.println(response);
        return false;

    }

    /**
     * This function finds the player with the given name from data base
     * Make sure call this function when you sure there exists a player with given name
     * @param playerName the name of the player that we want to get
     * @return the player whose name is "playerName"
     */
    public static Player getPlayerFromDB(String playerName){
        // create query string
        // String builder is preferred to append strings objects
        StringBuilder querySting =  new StringBuilder();
        querySting.append(baseUrl).append("player/").append(playerName);

        String response = performGetRequest(querySting.toString());
        Gson g = new Gson();
        return g.fromJson(response, Player.class);

    }

    /**
     * This function performs the get request to the given query string
     * @param queryString the String that will be queried
     * @return the response of server as String
     */
    private static String performGetRequest(String queryString){
        try {
            // open up a connection
            URL url = new URL(queryString);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");

            // set timeouts to prevent the app hang on
            con.setConnectTimeout(5000);
            con.setReadTimeout(5000);

            // read the response
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuilder content = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            // close the buffered reader and connection
            in.close();
            con.disconnect();

            //return the result
            return content.toString();

        } catch (IOException e) {
            e.printStackTrace();
            // return message indicating where the exception occurred.
            return "Exception occurred during the authentication";
        }
    }


    /**
     * It enables program to perform post request to the backend server with given query string.
     * @param queryString is the query of the program
     * @return if it is successful.
     */
    private static boolean performPostRequest(String queryString){
        try {
            // open up a connection
            URL url = new URL(queryString);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();

            con.setRequestMethod("POST");
            con.setDoOutput(true);
            con.setRequestProperty("User-Agent", "Java client");
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

            // set timeouts to prevent the app hang on
            con.setConnectTimeout(5000);
            con.setReadTimeout(5000);

            StringBuilder content;

            BufferedReader in = new BufferedReader( new InputStreamReader(con.getInputStream()));

            String line;
            content = new StringBuilder();

            while ((line = in.readLine()) != null) {
                content.append(line);
                content.append(System.lineSeparator());
            }

            // close the buffered reader and connection
            in.close();
            con.disconnect();

            // if response is empty string return false, otherwise return true.
            return !content.toString().equals("");

        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

    }

    /**
     * Add score to the current player.
     * @param score value
     * @return if it is successful
     */
    public static boolean addScore(Score score){
        // create query string
        // String builder is preferred to append strings objects
        StringBuilder queryString=  new StringBuilder();
        queryString.append(baseUrl).append("add_score/").append(score.getName()).append("/").append(score.getScore());
        return performPostRequest(queryString.toString());

    }

    /**
     * Gets the score of the player from database.
     * @param query of the program
     * @return ArrayList of all the scores of the player.
     */
    public static ArrayList<Score> scoreRequest(String query){
        StringBuilder queryString=  new StringBuilder();
        queryString.append(baseUrl).append(query);

        String response = performGetRequest(queryString.toString());

        JSONObject jsonObject;
        JSONArray jsonarray;
        ArrayList<Score> scores = new ArrayList<>();
        try {
            int i= 0;
            JSONParser helper = new JSONParser();
            jsonarray = (JSONArray)helper.parse(response);
            for (Object object: jsonarray) {
                jsonObject = (JSONObject)helper.parse(object.toString());
                scores.add(new Score(0, (String)jsonObject.get("name"),(long) jsonObject.get("score")));
                i++;
            }
            return scores;
        } catch (ParseException parse) {
            // Invalid syntax
            return null;
        }
    }


    /**
     * Whenever a new player is registered, this function handles the adding player to the database
     * @param playerName is nickname of the player.
     * @param password of the player
     * @return if it is successful
     */
    public static boolean addPlayerToDB(String playerName,String password){
        // create query string
        // String builder is preferred to append strings objects
        StringBuilder queryString=  new StringBuilder();
        queryString.append(baseUrl).append("add_player/").append(playerName).append("/").append(password);

        return performPostRequest(queryString.toString());

    }

}
