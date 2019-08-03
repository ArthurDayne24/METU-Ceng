import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.*;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.Partitioner;
import org.apache.hadoop.mapreduce.lib.input.*;
import org.apache.hadoop.mapreduce.lib.output.*;

import java.util.ArrayList;

public class Hw3 {
  
  public static class GameMapper extends Mapper<Object,Text,Text,Text>{
    private final static Text oneMatch = new Text("1");
      private Text word = new Text();

      public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
          StringTokenizer itr = new StringTokenizer(value.toString());

      while (itr.hasMoreTokens()) {
            word.set(itr.nextToken());

            if (word.equals(new Text("0")) || word.equals(new Text("1")) || word.equals(new Text("2")) ){
                continue;
          }
            context.write(word, oneMatch);
          }
    }
  }

  public static class PointAvarageMapper extends Mapper<Object,Text,Text,Text>{
      private final static Text zeroPoint = new Text("0");
      private final static Text onePoint = new Text("1");
      private final static Text threePoint = new Text("3");
      private Text word = new Text();

      public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
      
      StringTokenizer itr = new StringTokenizer(value.toString());

      ArrayList<String> teams = new ArrayList<String>();
      
      while (itr.hasMoreTokens()) {
        word.set(itr.nextToken());
        String temp = word.toString();

        if (word.equals(new Text("0"))){

          context.write(new Text(teams.get(0)), onePoint);
          context.write(new Text(teams.get(1)), onePoint);
          teams.clear();

        } else if (word.equals(new Text("1"))){

          context.write(new Text(teams.get(0)), threePoint);
          context.write(new Text(teams.get(1)), zeroPoint);
          teams.clear();

        } else if (word.equals(new Text("2"))){

          context.write(new Text(teams.get(0)), zeroPoint);
          context.write(new Text(teams.get(1)), threePoint);
          teams.clear();

        } else{
          teams.add(temp);
        }
      }
      }
  }

  public static class StatMapper extends Mapper<Object,Text,Text,Text>{
    private final static Text oneMatch = new Text("1");
    private Text word = new Text();

    public void map(Object key, Text value, Context context ) throws IOException, InterruptedException {
      StringTokenizer itr = new StringTokenizer(value.toString());

      while (itr.hasMoreTokens()) {

        word.set(itr.nextToken());
        
        if (word.equals(new Text("0")) || word.equals(new Text("1")) || word.equals(new Text("2")) ){
          context.write(word, oneMatch);
        }
      }
    } 
  }

    public static class GamePointCombinerReducer extends Reducer<Text,Text,Text, Text> {
    
      public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
        
          int sum = 0;
        
          for (Text val : values) {
            sum += Integer.parseInt(val.toString());
          }
        
          Text result = new Text(Integer.toString(sum));
          context.write(key, result);
      }
  }

  public static class AvarageCombiner extends Reducer<Text,Text,Text, Text> {

    public void reduce(Text key, Iterable<Text> values, Context context ) throws IOException, InterruptedException {
      float sum = 0;
      float counter = 0;
      for (Text val : values) {
        sum += Integer.parseInt(val.toString());
        counter++;
      }
      String res = Float.toString(sum/counter)  + "#" + Float.toString(counter);
      Text result = new Text(res);

      context.write(key, result);
    }
  }

  public static class StatCombiner extends Reducer<Text,Text,Text, Text> {
    
    public void reduce(Text key, Iterable<Text> values, Context context ) throws IOException, InterruptedException {
      
      int sum = 0;
      for (Text val : values) {
        sum += Integer.parseInt(val.toString());
      }

      String res = key.toString() + "#" + Integer.toString(sum);
      Text result = new Text(res);

      context.write(key, result);
      }
  }

  public static class AvarageReducer extends Reducer<Text,Text,Text, Text> {

    public void reduce(Text key, Iterable<Text> values, Context context ) throws IOException, InterruptedException {
      float sum = 0;
      float counter = 0;
      for (Text val : values) {
        String valString = val.toString();
        String [] valArray = valString.split("#");

        sum += Float.parseFloat(valArray[0]) * Float.parseFloat(valArray[1]);
        counter += Float.parseFloat(valArray[1]);
      }

      Text result = new Text(Float.toString(sum/counter));

      context.write(key, result);
    }
  }

  public static class StatReducer extends Reducer<Text,Text,Text, Text> {
    
    public void reduce(Text key, Iterable<Text> values,Context context ) throws IOException, InterruptedException {
      int sum = 0;
      for (Text val : values) {
        String valString = val.toString();
        String [] valArray = valString.split("#");

        sum += Integer.parseInt(valArray[1].toString());
      }

      Text result = new Text(Integer.toString(sum));

      if (key.equals(new Text("0"))){
        context.write(new Text("DRAW"), result);

      } else if (key.equals(new Text("1"))){
        context.write(new Text("HOME"), result);

      } else if (key.equals(new Text("2"))){
        context.write(new Text("AWAY"), result);
      }
    }
  }


  public static class StatPartitioner extends Partitioner < Text, Text >{
      @Override
       public int getPartition(Text key, Text value, int numReduceTasks)
       {
      if(key.toString().equals("2")){
        return 2;
          } else if(key.toString().equals("1")){
        return 1;
          } else {
        return 0;
       
      }
    }
  }



  public static void main(String[] args) throws Exception {
    Configuration conf = new Configuration();
      Job job = Job.getInstance(conf, "hw3");

      job.setJarByClass(Hw3.class);
      String type = args[0];
      if (type.equals("game") || type.equals("point")){
      job.setCombinerClass(GamePointCombinerReducer.class);
      job.setReducerClass(GamePointCombinerReducer.class);

      if (type.equals("game")) {
        job.setMapperClass(GameMapper.class);
      } else {
        job.setMapperClass(PointAvarageMapper.class);
      }

    } else if (type.equals("avg")){
    
      job.setMapperClass(PointAvarageMapper.class);
      job.setCombinerClass(AvarageCombiner.class);
      job.setReducerClass(AvarageReducer.class);
    
    } else if (type.equals("stat")){
    
      job.setNumReduceTasks(3);
      job.setMapperClass(StatMapper.class);
      job.setPartitionerClass(StatPartitioner.class);
      job.setCombinerClass(StatCombiner.class);
      job.setReducerClass(StatReducer.class);
    
    } else {

    }

    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(Text.class);

    FileInputFormat.addInputPath(job, new Path(args[1]));
    FileOutputFormat.setOutputPath(job, new Path(args[2]));
    
    System.exit(job.waitForCompletion(true)?0:1);



  }
}
