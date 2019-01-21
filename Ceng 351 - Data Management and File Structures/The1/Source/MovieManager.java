
import com.mysql.jdbc.Statement;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gorkem
 */
public class MovieManager implements IMovieManager {

    /* These values are read from databaseConfiguration.txt file. */
    private String _USERNAME;
    private String _PASSWORD;
    private String _HOST;
    private String _DATABASE_SCHEMA;
    private int _PORT_NUMBER;

    private static String _DB_CONFIG_FILE_NAME = "databaseConfiguration.txt";
    private static String _ACTOR_FILE_NAME = "actors.txt";
    private static String _MOVIE_FILE_NAME = "movies.txt";
    private static String _DIRECTOR_FILE = "directors.txt";
    private static String _USER_FILE = "users.txt";

    private Connection _connection;

    // DO NOT MODIFY THIS FUNCTION
    public void ReadDatabaseConfiguration() throws Exception {
        BufferedReader br = null;

        try {
            String currentLine;
            br = new BufferedReader(new FileReader(this._DB_CONFIG_FILE_NAME));

            while ((currentLine = br.readLine()) != null) {
                if (currentLine.startsWith("host")) {
                    this._HOST = currentLine.replace("host=", "").trim();
                }
                if (currentLine.startsWith("schema")) {
                    this._DATABASE_SCHEMA = currentLine.replace("schema=", "").trim();
                }
                if (currentLine.startsWith("username")) {
                    this._USERNAME = currentLine.replace("username=", "").trim();
                }
                if (currentLine.startsWith("password")) {
                    this._PASSWORD = currentLine.replace("password=", "").trim();
                }
                if (currentLine.startsWith("port")) {
                    this._PORT_NUMBER = Integer.parseInt(currentLine.replace("port=", "").trim());
                }
            }
        } catch (Exception ex) {
            System.out.println("Error while reading databaseConfiguration.txt file: " + ex.getMessage());
            throw ex;
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
            } catch (IOException ex) {
                System.out.println("Error while reading databaseConfiguration.txt file: " + ex.getMessage());
                throw ex;
            }
        }

        System.out.println("Database configuration is read.");
    }

    // DO NOT MODIFY THIS FUNCTION
    public void InitializeConnection() {

        String url = "jdbc:mysql://" + this._HOST + ":" + this._PORT_NUMBER + "/"
                + this._DATABASE_SCHEMA + "?useUnicode=true&characterEncoding=UTF-8";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            this._connection = DriverManager.getConnection(url, this._USERNAME,
                    this._PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {

            e.printStackTrace();
        }

        System.out.println("Database connection initialized.");
    }

    @Override
    public void ParseFilesAndInsertData() {
        Actor actor = new Actor();
        Director director = new Director();
        User user = new User();
        Movie movie = new Movie();
        int i = 1;
        String[] fields_movie = null;
        String[] fields_user = null;
        String[] fields_casted_in = null;
        FileInputStream fstream = null;
        try {
            fstream = new FileInputStream("actors.txt");
        } catch (FileNotFoundException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        BufferedReader br_actor = new BufferedReader(new InputStreamReader(fstream));
        String strLine;
        
            try {
            while((strLine = br_actor.readLine()) != null){
                String[] fields_actor = strLine.split(";");
                //System.out.println(fields_actor[0] + " - " + fields_actor[1]);
                actor.setAid(Integer.parseInt(fields_actor[0]));
                actor.setName(fields_actor[1]);
                InsertActor(actor);
            }
        } catch (IOException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            fstream = new FileInputStream("directors.txt");
        } catch (FileNotFoundException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        BufferedReader br_director = new BufferedReader(new InputStreamReader(fstream));
        
        try {
            while((strLine = br_director.readLine()) != null){
                String[] fields_director = strLine.split(";");
                //System.out.println(fields_director[0] + " - " + fields_director[1]);
                director.setDid(Integer.parseInt(fields_director[0]));
                director.setName(fields_director[1]);
                InsertDirector(director);
            }
        } catch (IOException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
   
   try {
            fstream = new FileInputStream("movies.txt");
        } catch (FileNotFoundException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        BufferedReader br_movies = new BufferedReader(new InputStreamReader(fstream));
        Statement statement;
        try {
            statement = (Statement) this._connection.createStatement();
            try {
            while((strLine = br_movies.readLine()) != null){
                fields_movie = strLine.split(";");
                movie.setMid(Integer.parseInt(fields_movie[0]));
                movie.setTitle(fields_movie[1]);
                movie.setYear(Integer.parseInt(fields_movie[2]));
                movie.setGenre(fields_movie[3]);
                String director_name = fields_movie[5];
                String quququq= "select D.Did from director D where D.name = " + "'" + director_name + "';";
                ResultSet resultSet = statement.executeQuery(quququq); 
                ResultSetMetaData rsmd = resultSet.getMetaData();
                int columnsNumber = rsmd.getColumnCount();
                while (resultSet.next()) {
                    for (i = 1; i <= columnsNumber; i++) {
                        String columnValue = resultSet.getString(i);
                        director.setDid(Integer.parseInt(columnValue));
                        director.setName(director_name);
                        movie.setDirector(director);
                    }
                }
                movie.setRating(Float.parseFloat(fields_movie[6]));
                InsertMovie(movie);
                
                int colmnumb;
                int k;
                fields_casted_in = fields_movie[4].split(",");
                for(k = 0; k< 4; k++){
                    
                    String castque = "select A.aid from actor A where A.name = " + "'" + fields_casted_in[k].trim() + "'";
                    ResultSet resset = statement.executeQuery(castque);
                    resset.next();
                    actor.setAid(resset.getInt("aid"));
                    InsertCastedIn(actor,movie);
                }
                              
                
            
                
                
            }
            
        } catch (IOException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        } catch (SQLException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            fstream = new FileInputStream("users.txt");
        } catch (FileNotFoundException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        BufferedReader br_user = new BufferedReader(new InputStreamReader(fstream));
        
        try {
            while((strLine = br_user.readLine()) != null){
                fields_user = strLine.split(";");
                user.setUid(Integer.parseInt(fields_user[0]));
                user.setName(fields_user[1]);
                user.setAge(Integer.parseInt(fields_user[2]));
                InsertUser(user);
                String[] For_watch = fields_user[3].split(",");
                for(i = 0; i < 10;i++){
                    For_watch[i] = For_watch[i].replaceAll("\\s","");
                    movie.setMid(Integer.parseInt(For_watch[i]));
                    InsertWatched(user,movie);
                }
                
            }
        } catch (IOException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
   
    }

    @Override
    public void CreateTables() {
        
        int result;
        int numberofTablesInserted = 0;
        String queryCreateActorTable = "create table actor(" + 
                                                               "aid int," +
                                                               "name varchar(50)," +
                                                               "primary key (aid))";
        
        try {
            Statement statement = (Statement) this._connection.createStatement();
			
		//Player Table
            result = statement.executeUpdate(queryCreateActorTable);
            
            numberofTablesInserted++;
			
            //close
            statement.close();
	} catch (SQLException e) {
            e.printStackTrace();
        }
        
        String queryCreateDirectorTable = "create table director(" +
                                                                     "did int," +
                                                                     "name varchar(50)," +
                                                                     "primary key (did))";
        
        try {
            Statement statement = (Statement) this._connection.createStatement();
			
		//Player Table
            result = statement.executeUpdate(queryCreateDirectorTable);
            
            numberofTablesInserted++;
			
            //close
            statement.close();
	} catch (SQLException e) {
            e.printStackTrace();
        }
        
        String queryCreateMovieTable = "create table movie(" +
                                                                "mid int," +
                                                                "title varchar(100)," +
                                                                "genre varchar(50)," +
                                                                "year int," +
                                                                "did int," +
                                                                "rating double," +
                                                                "primary key (mid)," +
                                                                "foreign key (did) references director(did) on delete cascade on update cascade)";
        
        try {
            Statement statement = (Statement) this._connection.createStatement();
			
		//Player Table
            result = statement.executeUpdate(queryCreateMovieTable);
            
            numberofTablesInserted++;
			
            //close
            statement.close();
	} catch (SQLException e) {
            e.printStackTrace();
        }
        
        String queryCreateUserTable = "create table user(" +
                                                            "uid int," +
                                                            "name varchar(50)," +
                                                            "age int," +
                                                            "primary key (uid))";
        
        try {
            Statement statement = (Statement) this._connection.createStatement();
			
		//Player Table
            result = statement.executeUpdate(queryCreateUserTable);
            
            numberofTablesInserted++;
			
            //close
            statement.close();
	} catch (SQLException e) {
            e.printStackTrace();
        }
        
        String queryCreateCasted_InTable = "create table casted_in(" +
                                                                        "aid int," +
                                                                        "mid int," +
                                                                        "primary key (aid,mid)," +
                                                                        "foreign key (mid) references movie(mid) on delete cascade on update cascade," +
                                                                        "foreign key (aid) references actor(aid) on delete cascade on update cascade)";
        
        try {
            Statement statement = (Statement) this._connection.createStatement();
			
		//Player Table
            result = statement.executeUpdate(queryCreateCasted_InTable);
           
            numberofTablesInserted++;
			
            //close
            statement.close();
	} catch (SQLException e) {
            e.printStackTrace();
        }
        
        String queryCreateWatchedTable = "create table watched(" +
                                                                    "uid int," +
                                                                    "mid int," +
                                                                    "primary key (uid,mid)," +
                                                                    "foreign key (uid) references user(uid) on delete cascade on update cascade," +
                                                                    "foreign key (mid) references movie(mid) on delete cascade on update cascade)";
        
        try {
            Statement statement = (Statement) this._connection.createStatement();
			
		//Player Table
            result = statement.executeUpdate(queryCreateWatchedTable);
            
            numberofTablesInserted++;
			
            //close
            statement.close();
	} catch (SQLException e) {
            e.printStackTrace();
        }
    }
        

    @Override
    public void InsertActor(Actor actor) {
        int numberofInsertActor = 0;
	int result;
            String query = "insert into actor values (\"" +
            actor.getAid() + "\",\"" +
            actor.getName() + "\")";
            try {
                
            
		Statement st = (Statement) this._connection.createStatement();
		result = st.executeUpdate(query);
		//System.out.println(result);
		numberofInsertActor++;
		//Close
		st.close();

            } catch (SQLException e) {
		e.printStackTrace();
            }
        
    }

    @Override
    public void InsertDirector(Director director) {
        int numberofInsertDirector = 0;
	int result;
        String query = "insert into director values (\"" +
        director.getDid() + "\",\"" +
        director.getName() + "\")";
        try {
            
		Statement st = (Statement) this._connection.createStatement();
		result = st.executeUpdate(query);
		//System.out.println(result);
		numberofInsertDirector++;
		//Close
		st.close();

            } catch (SQLException e) {
		e.printStackTrace();
            }
    }

    @Override
    public void InsertMovie(Movie movie) {
        int numberofInsertMovie = 0;
	int result;
        String query = "insert into movie values (\"" +
        movie.getMid() + "\",\"" +
        movie.getTitle() + "\",\"" +
        movie.getGenre() + "\",\"" +
        movie.getYear() + "\",\"" +
        movie.getDirector().getDid()  + "\",\"" +
        movie.getRating() + "\")";
        try {
            
		Statement st = (Statement) this._connection.createStatement();
		result = st.executeUpdate(query);
		//System.out.println(result);
		numberofInsertMovie++;
		//Close
		st.close();

            } catch (SQLException e) {
		e.printStackTrace();
            }
    }

    @Override
    public void InsertUser(User user) {
        int numberofInsertUser = 0;
	int result;
        String query = "insert into user values (\"" +
        user.getUid() + "\",\"" +
        user.getName() + "\",\"" +
        user.getAge() + "\")";
        try {
            
		Statement st = (Statement) this._connection.createStatement();
		result = st.executeUpdate(query);
		//System.out.println(result);
		numberofInsertUser++;
		//Close
		st.close();

            } catch (SQLException e) {
		e.printStackTrace();
            }
    }

    @Override
    public void InsertCastedIn(Actor actor, Movie movie) {
        int numberofInsertCasted_In = 0;
	int result;
        String query = "insert into casted_in values (\"" +
        actor.getAid() + "\",\"" +
        movie.getMid() + "\")";
        try {
            
		Statement st = (Statement) this._connection.createStatement();
		result = st.executeUpdate(query);
		//System.out.println(result);
		numberofInsertCasted_In++;
		//Close
		st.close();

            } catch (SQLException e) {
		e.printStackTrace();
            }
    }

    @Override
    public void InsertWatched(User user, Movie movie) {
        int numberofInsertWatched = 0;
	int result;
        String query = "insert into watched values (\"" +
        user.getUid() + "\",\"" +
        movie.getMid() + "\")";
        try {
            
		Statement st = (Statement) this._connection.createStatement();
		result = st.executeUpdate(query);
		//System.out.println(result);
		numberofInsertWatched++;
		//Close
		st.close();

            } catch (SQLException e) {
		e.printStackTrace();
            }
    }

    @Override
    public List<Movie> GetMoviesOfDirector(int did) {
        List<Movie> Movie_list = new ArrayList<Movie>();
        Statement statement;
        Statement statement1;
        Director d = new Director();
        try {
            String query = "select * from movie where did = " + "'" + did + "'";
            String d_query = "select * from director where did = " + "'" + did + "'";
            statement1 = (Statement) this._connection.createStatement();
            statement = (Statement) this._connection.createStatement();
            ResultSet resset = statement.executeQuery(query);
            ResultSet resset1 = statement1.executeQuery(d_query);
            resset1.next();
            while(resset.next()){
                Movie m = new Movie();
                m.setMid(resset.getInt("mid"));
                m.setTitle(resset.getString("title"));
                m.setYear(resset.getInt("year"));
                m.setGenre(resset.getString("genre"));
                m.setRating(resset.getFloat("rating"));
                d.setDid(resset1.getInt("did"));
                d.setName(resset1.getString("name"));
                m.setDirector(d);
                Movie_list.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return Movie_list;
    }

    @Override
    public List<Movie> GetMoviesOfActor(int aid) {
        List<Movie> Movie_list = new ArrayList<Movie>();
        Statement statement;
        Statement statement1;
        Statement statement2;
        String d_query1;
        try {
            String query = "select mid from casted_in where aid = "  + aid;
            statement1 = (Statement) this._connection.createStatement();
            statement = (Statement) this._connection.createStatement();
            statement2 = (Statement) this._connection.createStatement();
            ResultSet resset = statement.executeQuery(query);
            ResultSet resset1;
            ResultSet resset2;
            while(resset.next()){
                String d_query = "select * from movie where mid = " + resset.getInt("mid");
                resset1 = statement1.executeQuery(d_query);
                resset1.next();
                Movie m = new Movie();
                m.setMid(resset1.getInt("mid"));
                m.setTitle(resset1.getString("title"));
                m.setYear(resset1.getInt("year"));
                m.setGenre(resset1.getString("genre"));
                m.setRating(resset1.getFloat("rating"));
                d_query1 = "select * from director where did = " + resset1.getInt("did") ;
                resset2 = statement2.executeQuery(d_query1);
                resset2.next();
                Director d = new Director(resset2.getInt("did"),resset2.getString("name"));
                m.setDirector(d);
                Movie_list.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return Movie_list;
    }

    @Override
    public List<Movie> GetUserWatchlist(int uid) {
        List<Movie> Movie_list = new ArrayList<Movie>();
        Statement statement;
        Statement statement1;
        Statement statement2;
        String d_query1;
        try {
            String query = "select mid from watched where uid = "  + uid;
            statement1 = (Statement) this._connection.createStatement();
            statement = (Statement) this._connection.createStatement();
            statement2 = (Statement) this._connection.createStatement();
            ResultSet resset = statement.executeQuery(query);
            ResultSet resset1;
            ResultSet resset2;
            while(resset.next()){
                String d_query = "select * from movie where mid = " + resset.getInt("mid");
                resset1 = statement1.executeQuery(d_query);
                resset1.next();
                Movie m = new Movie();
                m.setMid(resset1.getInt("mid"));
                m.setTitle(resset1.getString("title"));
                m.setYear(resset1.getInt("year"));
                m.setGenre(resset1.getString("genre"));
                m.setRating(resset1.getFloat("rating"));
                d_query1 = "select * from director where did = " + resset1.getInt("did") ;
                resset2 = statement2.executeQuery(d_query1);
                resset2.next();
                Director d = new Director(resset2.getInt("did"),resset2.getString("name"));
                m.setDirector(d);
                Movie_list.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return Movie_list;
    }

    @Override
    public List<Movie> GetMoviesWithTwoActors(String actorName1, String actorName2) {
        String query = "select M.mid,M.title,M.year,M.genre,M.did,M.rating from casted_in C ,movie M ,actor A where A.name =" +  
        "'" + actorName1 + "'" +  "and A.aid = C.aid and M.mid = C.mid and M.mid in" +
        "(Select M.mid from movie M ,casted_in C, actor A where A.name =" + "'" +  actorName2 + "'" + 
        "and A.aid = C.aid and M.mid = C.mid);";
        List<Movie> Movie_list = new ArrayList<Movie>();
        Statement statement;
        Statement statement2;
        String d_query1;
        try {
            statement = (Statement) this._connection.createStatement();
            statement2 = (Statement) this._connection.createStatement();
            ResultSet resset = statement.executeQuery(query);
            while(resset.next()){
                Movie m = new Movie();
                m.setMid(resset.getInt("mid"));
                m.setTitle(resset.getString("title"));
                m.setGenre(resset.getString("genre"));
                m.setYear(resset.getInt("year"));
                m.setRating(resset.getFloat("rating"));
                d_query1 = "select * from director where did = " + resset.getInt("did") ;
                ResultSet resset2 = statement2.executeQuery(d_query1);
                resset2.next();
                Director d = new Director(resset2.getInt("did"),resset2.getString("name"));
                m.setDirector(d);
                Movie_list.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return Movie_list;
    }

    @Override
    public List<Movie> GetMoviesAboveRating(float rating) {
        String query = "select * from movie where rating >" + rating;
        List<Movie> Movie_list = new ArrayList<Movie>();
        Statement statement;
        Statement statement2;
        String d_query1;
        try {
            statement = (Statement) this._connection.createStatement();
            statement2 = (Statement) this._connection.createStatement();
            ResultSet resset = statement.executeQuery(query);
            while(resset.next()){
                Movie m = new Movie();
                m.setMid(resset.getInt("mid"));
                m.setTitle(resset.getString("title"));
                m.setGenre(resset.getString("genre"));
                m.setYear(resset.getInt("year"));
                m.setRating(resset.getFloat("rating"));
                d_query1 = "select * from director where did = " + resset.getInt("did") ;
                ResultSet resset2 = statement2.executeQuery(d_query1);
                resset2.next();
                Director d = new Director(resset2.getInt("did"),resset2.getString("name"));
                m.setDirector(d);
                Movie_list.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return Movie_list;
    }

    @Override
    public void ChangeRatingsOfMoviesLike(String pattern, float value) {
        String query = "update movie set rating =" + value + " where title like " + "'%" + pattern + "%'";
        Statement statement;
        try {
            statement = (Statement) this._connection.createStatement();
            statement.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void DeleteDirectorWithId(int did) {
        String query = "delete from director where did =" + did;
        Statement statement;
        try {
            statement = (Statement) this._connection.createStatement();
            statement.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void DeleteUserWithId(int uid) {
        String query = "delete from user where uid =" + uid;
        Statement statement;
        try {
            statement = (Statement) this._connection.createStatement();
            statement.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void PrintViewStatsByMovie() {
        String query = "select M.mid, M.title, count(W.uid) as count from movie M, watched W where M.mid = W.mid group by W.mid order by count DESC, M.title ASC";
        try {
            Statement statement = (Statement) this._connection.createStatement();
            ResultSet resset = statement.executeQuery(query);
            while(resset.next()){
                System.out.print(resset.getInt("mid"));
                System.out.println('|' + resset.getString("title") + '|' + resset.getInt("count"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void PrintViewStatsByGenre() {
        String query = "select M.genre, count(W.uid) as count from movie M, watched W where M.mid = W.mid group by M.genre order by count DESC, M.genre ASC";
        try {
            Statement statement = (Statement) this._connection.createStatement();
            ResultSet resset = statement.executeQuery(query);
            while(resset.next()){
                System.out.println(resset.getString("genre") + '|' + resset.getInt("count"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void PrintAverageMovieRatingOfDirectors() {
        String que = "select D.name, round(avg(rating),1)as avg, count(W.uid) as cnt from movie M , watched W, director D  where D.did = M.did and M.mid = W.mid group by M.did order by avg DESC, D.name ASC";
        try {
            Statement statement = (Statement) this._connection.createStatement();
            ResultSet resset = statement.executeQuery(que);
            while(resset.next()){
                System.out.println(resset.getString("name") + "|" + resset.getFloat("avg") + "|" + resset.getInt("cnt"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void DropTables() {
        int result;
        int numberofTablesDropped = 0;
        
        String queryDropCasted_InTable = "drop table if exists casted_in";
        
        try {
			Statement statement = (Statement) this._connection.createStatement();


			result = statement.executeUpdate(queryDropCasted_InTable);
			numberofTablesDropped++;
			//System.out.println(result);


			//close
			statement.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        String queryDropWatchedTable = "drop table if exists watched";
        
        try {
			Statement statement = (Statement) this._connection.createStatement();


			result = statement.executeUpdate(queryDropWatchedTable);
			numberofTablesDropped++;
			//System.out.println(result);


			//close
			statement.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        String queryDropMovieTable = "drop table if exists movie";
        
        try {
			Statement statement = (Statement) this._connection.createStatement();


			result = statement.executeUpdate(queryDropMovieTable);
			numberofTablesDropped++;
			//System.out.println(result);


			//close
			statement.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        
        String queryDropActorTable = "drop table if exists actor";
        
        try {
			Statement statement = (Statement) this._connection.createStatement();


			result = statement.executeUpdate(queryDropActorTable);
			numberofTablesDropped++;
			//System.out.println(result);


			//close
			statement.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        String queryDropDirectorTable = "drop table if exists director";
        
        try {
			Statement statement = (Statement) this._connection.createStatement();


			result = statement.executeUpdate(queryDropDirectorTable);
			numberofTablesDropped++;
			//System.out.println(result);


			//close
			statement.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        
        
        String queryDropUserTable = "drop table if exists user";
        
        try {
			Statement statement = (Statement) this._connection.createStatement();


			result = statement.executeUpdate(queryDropUserTable);
			numberofTablesDropped++;
			//System.out.println(result);


			//close
			statement.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        
        
        
    }

    /* 
     - This main function is for helping you
     - You don't have to send your main function when you submit your code.
        
     - Use this template to continue coding. 
     - Just implement a function above, and call it with example parameters
     in main function below.
     
    public static void main(String[] args) throws Exception {

        MovieManager manager = new MovieManager();
        List<Movie> lm; // use for lists
        manager.ReadDatabaseConfiguration(); // make db configs
        manager.InitializeConnection(); // initialize conn
        manager.DropTables(); // cleaning database if any
        manager.CreateTables(); // create tables to fill
        manager.ParseFilesAndInsertData(); // read input files and fill tables
        System.out.println("PrintViewStatsByMovie:");
        manager.PrintViewStatsByMovie();
        System.out.println("PrintViewStatsByMovieEnds");
        System.out.println("PrintAverageMovieRatingOfDirectors:");
        manager.PrintAverageMovieRatingOfDirectors();
        System.out.println("PrintViewStatsByGenre:");
        manager.PrintViewStatsByGenre();
        
        lm = manager.GetMoviesAboveRating(9.1f);
        System.out.println("GetMoviesAboveRating Test: " + String.valueOf(lm.size() == 2));
        System.out.println(lm.get(0).getTitle() + "," + lm.get(1).getTitle());
        lm = manager.GetMoviesWithTwoActors("Marlon Brando","Al Pacino");
        System.out.println("GetMoviesWithTwoActors Test: " + String.valueOf(lm.size() == 1));
        System.out.println("GetMoviesWithTwoActors Test 2: " + lm.get(0).getTitle());
        Actor actor = new Actor(1958,"Gary Oldman");
        Director director = new Director(51, "Bob Gale");
        Movie movie = new Movie(60, "Interstate 60: Episodes of the Road", "Adventure", 7.7f, 2002, director);
        User user = new User(57,"Antonius Block", 27);
        manager.InsertUser(user);
        manager.InsertDirector(director);
        manager.InsertMovie(movie);
        manager.InsertActor(actor);
        manager.InsertCastedIn(actor, movie);
        manager.InsertWatched(user, movie);   
        
        lm = manager.GetUserWatchlist(57);
        System.out.println("Check Insertion Test: " + String.valueOf(lm.size() == 1));
        System.out.println("Check Insertion  Test: " + lm.get(0).getDirector().getName().equals("Bob Gale"));
        System.out.println("Check Insertion  Test: " + lm.get(0).getTitle().equals("Interstate 60: Episodes of the Road"));
        manager.ChangeRatingsOfMoviesLike("rInGs",9.9f);
        lm = manager.GetUserWatchlist(11);
        System.out.println("GetUserWatchlist Test: " + String.valueOf(lm.size() == 10));
        for(int i = 0; i < lm.size(); i++){
            if(lm.get(i).getTitle().indexOf("Rings") != -1)
                System.out.println("ChangeRatingsOfMoviesLike Test: " + String.valueOf(lm.get(i).getRating() == 9.9f));
        }
        System.out.println("DeleteUserWithId Test: " + String.valueOf(lm.size() == 0));
        manager.DeleteUserWithId(57);
        manager.DeleteDirectorWithId(51);
        lm = manager.GetUserWatchlist(57);
        System.out.println("DeleteUserWithId Test: " + String.valueOf(lm.size() == 0));
    }*/}
        