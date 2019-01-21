public class CengHashRow {

	// GUI-Based Methods
	// These methods are required by GUI to work properly.
        public String hashpref;
        public CengBucket Bucket;
        public boolean visited;
        
        public CengHashRow(){
            this.hashpref = "0";
            this.visited = false;
            this.Bucket = new CengBucket();
            
        }
        public String hashPrefix()
	{
		// TODO: Return row's hash prefix (such as 0, 01, 010, ...)
		return hashpref;		
	}
	
	public CengBucket getBucket()
	{
		// TODO: Return the bucket that the row points at.
		return Bucket;		
	}
	
	public boolean isVisited()
	{
		// TODO: Return whether the row is used while searching.
		return visited;		
	}
	
        
	// Own Methods
        
}
