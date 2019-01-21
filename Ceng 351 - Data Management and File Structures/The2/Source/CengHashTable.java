
import static java.lang.Math.log10;
import static java.lang.Math.pow;
import java.util.ArrayList;

public class CengHashTable {


        public ArrayList<CengHashRow> table = new ArrayList<CengHashRow>();
        public int global;
        public String Prefix;
        public CengHashTable()
	{
            CengHashRow tmp = new CengHashRow();
            CengCoinExchange.getBucketList().table.add(tmp.Bucket);
            CengCoinExchange.getBucketList().bucketcount++;
            table.add(tmp);
            this.global = 0;
            this.Prefix = "0";
            
        }
        
        public void split(int index,int total_bucket){
            int hashmod = CengCoinExchange.getHashMod();
            int bucksize = CengCoinExchange.getBucketSize();
            int connected_bucket_number =(int) pow(2,(global - table.get(index).Bucket.hash_pref));
            int i = index;
            table.get(i).Bucket.hash_pref++;
            for(i=index; i < (connected_bucket_number / 2)+index ; i++){
                
            }
            CengBucket split_bucket = new CengBucket();
            split_bucket.hash_pref = table.get(index).Bucket.hash_pref;
            for(int j = 0; j < bucksize;j++){
                String key_string = Integer.toBinaryString(table.get(index).Bucket.list.get(j).key()%hashmod);
                int tmp = key_string.length(); 
                if(key_string.length() < (int)(log10(hashmod) / log10(2))){
                    for(int k = 0; k < (int)(log10(hashmod) / log10(2))- tmp; k++)
                        key_string = "0" + key_string;
                }
                if(key_string.substring(0,global).equals(split_bucket.hash_pref)){
                    split_bucket.list.add(table.get(index).Bucket.list.get(j));
                    split_bucket.count++;
                    table.get(index).Bucket.list.remove(j);
                    table.get(index).Bucket.count--;
                    j--;
                    bucksize--;
                }
            }
            
            for(;i<connected_bucket_number + index;i++){
                table.get(i).Bucket = split_bucket;
            }
            
            CengCoinExchange.getBucketList().table.add(total_bucket,split_bucket);
            CengCoinExchange.getBucketList().bucketcount++;
        }
        public void extend(int index){
            int max_table_size = CengCoinExchange.getHashMod();
            int table_size = table.size();
            int count = 0;
            if(table_size < max_table_size){
                for(int i = 0; i < table_size; i++){
                    CengHashRow tmp_row = new CengHashRow();
                    table.add(i+1,tmp_row);
                    if(i != index){
                        table.get(i+1).Bucket = table.get(i).Bucket;
                        i++;
                        table_size++;
                        index++;
                        count++;
                    }
                    else if(i == index){ 
                        table.get(i).Bucket.hash_pref++;
                        tmp_row.Bucket.hash_pref = table.get(i).Bucket.hash_pref ;
                        
                        
                        
                        CengBucket tmp_bucket = new CengBucket();
                        tmp_bucket.hash_pref = table.get(i).Bucket.hash_pref;
                        table.get(i+1).Bucket = tmp_bucket;
                        
                        
                        
                        CengCoinExchange.getBucketList().table.add(index+1-count,tmp_bucket);
                        CengCoinExchange.getBucketList().bucketcount++;
                        i++;
                        table_size++;
                        
                    }
                }
            }
        }
        public void fix_hashrows(){
            int hashmod = CengCoinExchange.getHashMod();
            for(int i = 0; i < pow(2,global); i++){
                String binary = Integer.toBinaryString(i);
                int len = binary.length();
                if(len < (int)(log10(hashmod) / log10(2))){
                    for(int j=0; j < global- len;j++)
                        binary = "0" + binary;
                }
                table.get(i).hashpref = binary;
            }
        }
        public void addCoin(CengCoin coin){
            int bucksize = CengCoinExchange.getBucketSize();
            int hashmod = CengCoinExchange.getHashMod();
            if(global == 0 ){
                if(table.get(0).Bucket.count < bucksize ){
                    table.get(0).Bucket.list.add(coin);
                    table.get(0).Bucket.count++;
                }
                else{
                    CengHashRow tmp_row = new CengHashRow();
                    table.add(tmp_row);
                    table.get(0).Bucket.hash_pref = 1;
                    tmp_row.Bucket.hash_pref = 1;
                    tmp_row.hashpref = "1";
                    CengBucket tmp_bucket = new CengBucket();
                    tmp_bucket.hash_pref = 1;
                    table.get(1).Bucket = tmp_bucket;
                    CengCoinExchange.getBucketList().table.add(1,tmp_bucket);
                    CengCoinExchange.getBucketList().bucketcount++;
                    global++;
                    table.get(0).hashpref = "0";
                    table.get(1).hashpref = "1";
                    
                    for(int i = 0; i < bucksize;i++){
                        String key_string = Integer.toBinaryString(table.get(0).Bucket.list.get(i).key()%hashmod);
                        int tmp = key_string.length(); 
                        if(key_string.length() < (int)(log10(hashmod) / log10(2))){
                            
                            for(int z = 0; z < (int)(log10(hashmod) / log10(2))- tmp; z++)
                            key_string = "0" + key_string;
                        }
                        if(!key_string.substring(0,global).equals(table.get(0).hashpref)){
                            table.get(1).Bucket.list.add(table.get(0).Bucket.list.get(i));
                            table.get(1).Bucket.count++;
                            table.get(0).Bucket.list.remove(i);
                            table.get(0).Bucket.count--;
                            i--;
                            bucksize--;
                        }
                    }
                    addCoin(coin);
                }
            }
            else{
                String key_string = Integer.toBinaryString(coin.key()%hashmod);
                int tmp = key_string.length(); 
                if(key_string.length() < (int)(log10(hashmod) / log10(2))){
                    for(int i = 0; i < (int)(log10(hashmod) / log10(2))- tmp; i++)
                        key_string = "0" + key_string;
                }
                int total_bucket = 0;
                for(int i=0; i<table.size();i++){
                    if(i != table.size()-1 && table.get(i).Bucket != table.get(i+1).Bucket)
                        total_bucket++;
                    
                    if(key_string.substring(0,global).equals(table.get(i).hashpref)){
                        if(table.get(i).Bucket.count < bucksize){
                            table.get(i).Bucket.list.add(coin);
                            table.get(i).Bucket.count++;
                        }
                        else{
                            if(global == table.get(i).Bucket.hash_pref){
                                int flag = 0;
                                if(global != (int)(log10(hashmod) / log10(2))){
                                global++;
                                extend(i);
                                fix_hashrows();
                                addCoin(coin);
                                }
                                break;
                            }
                            else{
                                
                                if(i != 0){
                                    total_bucket++;
                                    if(i != table.size()-1 && table.get(i).Bucket != table.get(i+1).Bucket && table.get(i).Bucket == table.get(i-1).Bucket)
                                        total_bucket--;
                                    if(table.get(i).Bucket == table.get(i-1).Bucket){
                                        int k= i;
                                        while(table.get(k).Bucket == table.get(k-1).Bucket){
                                            if(table.get(k).Bucket == table.get(k-1).Bucket){
                                                k--;
                                                
                                            }
                                        }
                                        split(k,total_bucket);
                                        addCoin(coin);
                                        break;
                                    }
                                    else{
                                        split(i,total_bucket);
                                        addCoin(coin);
                                    }
                                }
                                else{
                                        split(i,1);
                                        addCoin(coin);
                                        break;
                                }
                                
                            }
                        }
                    }
                }
            }
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

	public int prefixBitCount()
	{
		// TODO: Return table's hash prefix length.
		return global;
	}

	public int rowCount()
	{
		// TODO: Return the count of HashRows in table.
		return table.size();		
	}

	public CengHashRow rowAtIndex(int index)
	{
		// TODO: Return corresponding hashRow at index.
		return table.get(index);
	}

	// Own Methods

}
