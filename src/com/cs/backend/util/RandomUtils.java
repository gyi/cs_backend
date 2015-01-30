package com.cs.backend.util;
 
 import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import org.apache.log4j.Logger;
 
 public class RandomUtils{
   private static final Logger logger = Logger.getLogger(RandomUtils.class);
 
   private static Random random = new Random();
 
   public static int random(int max) {
     return random.nextInt(max);
   }
 
   public static int random(int min, int max) {
     if (max - min <= 0) return min;
     return min + random.nextInt(max - min + 1);
   }
 
   public static boolean isGenerate(int probability, int gailv){
     if (gailv == 0) gailv = 1000;
     int random_seed = random.nextInt(gailv + 1);
     return probability >= random_seed;
   }
 
   public static boolean isGenerate2(int probability, int gailv){
     if (probability == gailv) return true;
     if (gailv == 0) gailv = 1;
     int random_seed = random.nextInt(probability);
     return random_seed + 1 <= gailv;
   }
 
   public static int randomValue(int max, int min){
     int temp = max - min;
     temp = random.nextInt(temp + 1);
     temp += min;
     return temp;
   }
 
   public static boolean isGenerateToBoolean(float num, int maxcout){
     double count = Math.random() * maxcout;
 
     if (count < num) {
       return true;
     }
     return false;
   }
 
   public static boolean isGenerateToBoolean(int num, int maxcout){
     double count = Math.random() * maxcout;
 
     if (count < num) {
       return true;
     }
     return false;
   }
 
   public static int randomIntValue(int min, int max){
     return (int)(Math.random() * (max - min + 1)) + min;
   }
 
   public static float randomFloatValue(float min, float max){
     return (float)(Math.random() * (max - min)) + min;
   }
 
   public static Object randomItem(Collection<? extends Object> collection) {
     if ((collection == null) || (collection.size() == 0)) {
       return null;
     }
     int t = (int)(collection.size() * Math.random());
     int i = 0;
     for (Iterator<? extends Object> item = collection.iterator(); (i <= t) && (item.hasNext()); ) {
       Object next = item.next();
       if (i == t) {
         return next;
       }
       i++;
     }
     return null;
   }
 
   public static int randomIndexByProb(List<Integer> probs) {
     try{
       LinkedList<Integer> newprobs = new LinkedList<Integer>();
       for (int i = 0; i < probs.size(); i++){
         if (i == 0){
        	 newprobs.add((Integer)probs.get(i));
         }else {
           newprobs.add(Integer.valueOf(((Integer)newprobs.get(i - 1)).intValue() + ((Integer)probs.get(i)).intValue()));
         }
       }
 
       if (newprobs.size() <= 0) {
         return -1;
       }
       int last = ((Integer)newprobs.getLast()).intValue();
 
       int random = random(last);
       for (int i = 0; i < newprobs.size(); i++) {
         int value = ((Integer)newprobs.get(i)).intValue();
 
         if (value > random)
           return i;
       }
     }
     catch (Exception e) {
       logger.error(probs.toString(), e);
     }
     return -1;
   }
}