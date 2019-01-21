import java.io.BufferedReader;
import java.io.Console;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
public class CengCoinParser {

	public static ArrayList<CengCoin> parseCoinsFromFile(String filename)
	{
		FileInputStream fstream = null;
            
            try {
                fstream = new FileInputStream(filename);
            } catch (FileNotFoundException ex) {
                Logger.getLogger(CengCoinParser.class.getName()).log(Level.SEVERE, null, ex);
            }
            BufferedReader br_file = new BufferedReader(new InputStreamReader(fstream));
            String strLine;
            ArrayList<CengCoin> coinList = new ArrayList<CengCoin>();
            
            try {
                while((strLine = br_file.readLine()) != null){
                    String[] fields = strLine.split("\\|");
                    CengCoin temp = new CengCoin(Integer.parseInt(fields[1]),fields[2],fields[3],fields[4]);
                    coinList.add(temp);
                }
            } catch (IOException ex) {
                Logger.getLogger(CengCoinParser.class.getName()).log(Level.SEVERE, null, ex);
            }
                
            
		
		// You need to parse the input file in order to use GUI tables.
		// TODO: Parse the input file, and convert them into CengCoins

            return coinList;
	}
	
	public static void startParsingCommandLine() throws IOException
	{
		// TODO: Start listening and parsing command line -System.in-.
		// There are 4 commands:
		// 1) quit : End the app, gracefully. Print nothing, call nothing.
		// 2) add : Parse and create the coin, and call CengCoinExchange.addCoin(newlyCreatedCoin).
		// 3) search : Parse the key, and call CengCoinExchange.searchCoin(parsedKey).
		// 4) print : Print the whole hash table with the corresponding buckets, call CengCoinExchange.printEverything().

		// Commands (quit, add, search, print) are case-insensitive.
            
                InputStreamReader cin = new InputStreamReader(System.in);
                BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
                Console c = System.console();
                
                String input = "";
                while(true){
                    input = in.readLine();
                    String[] fields = input.split("\\|");
                    if(fields[0].equals("add")){
                        CengCoin tempCoin = new CengCoin(Integer.parseInt(fields[1]),fields[2],fields[3],fields[4]);
                        CengCoinExchange.addCoin(tempCoin);
                    }
                    else if(fields[0].equals("search"))
                        CengCoinExchange.searchCoin(Integer.parseInt(fields[1]));
                    else if(fields[0].equals("print"))
                        CengCoinExchange.printEverything();
                    else if(fields[0].equals("quit"))
                        System.exit(0);
                    
                }
                    
	}
}
