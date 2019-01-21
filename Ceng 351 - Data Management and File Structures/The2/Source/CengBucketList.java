
import static java.lang.Math.pow;
import java.util.ArrayList;

public class CengBucketList {
    
        public ArrayList<CengBucket> table = new ArrayList<CengBucket>();
        public int bucketcount;
       
        
        public CengBucketList(){
            
        } 
	public void addCoin(CengCoin coin)
	{
            
	}
	
	public void searchCoin(Integer key)
	{
		// TODO: Empty Implementation
	}
	
	public void print()
	{
		// TODO: Empty Implementation
	}
	
	// GUI-Based Methods
	// These methods are required by GUI to work properly.
	
	public int bucketCount()
	{
		// TODO: Return all bucket count.
		return bucketcount;		
	}
	
	public CengBucket bucketAtIndex(int index)
	{
		// TODO: Return corresponding bucket at index.
		return table.get(index);
	}
	
	// Own Methods
}
