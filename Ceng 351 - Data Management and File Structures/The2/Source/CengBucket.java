
import java.util.ArrayList;

public class CengBucket {

	// GUI-Based Methods
	// These methods are required by GUI to work properly.
	public int count;
        public int hash_pref;
        public boolean is_visited;
        public ArrayList<CengCoin> list = new ArrayList<CengCoin>();
            
        public CengBucket(){
            this.count = 0;
            this.hash_pref = 0;
            this.is_visited = false;
        }
        
	public int coinCount()
	{
		// TODO: Return the coin count in the bucket
		return count;		
	}
	
	public CengCoin coinAtIndex(int index)
	{
		// TODO: Return the corresponding coin at the index.
		return list.get(index) ;
	}
	
	public int getHashPrefix()
	{
		// TODO: Return hash prefix length.
		return hash_pref;
	}
	
	public Boolean isVisited()
	{
		// TODO: Return whether the bucket is found while searching.
		return is_visited;		
	}
	
	// Own Methods
}
