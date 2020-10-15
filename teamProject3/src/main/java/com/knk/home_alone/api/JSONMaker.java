package com.knk.home_alone.api;

import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class JSONMaker {

		 public static void main(String[] args) throws IOException{
	          // {} - JSONObject ,[] - JSONArray
			 
			 double x=37.559156687062148;
			 double y=126.92536526611102;
			 double x1=37.559156687062148;
			 double y1=126.92536526611102;
	         JSONObject myjson = new JSONObject();	
	         JSONArray positionsArray = new JSONArray();
	         JSONObject positionsInfo = new JSONObject();
	         
	         positionsInfo.put("lng",y);
	         positionsInfo.put("lat",x);
	         positionsInfo.put("lng",y1);
	         positionsInfo.put("lat",x1);
	          

	         for(int i=0; i<positionsInfo.size(); i++){
	        	 positionsArray.add(positionsInfo);
	         }
	         myjson.put("positions", positionsArray);
    
	          System.out.println(myjson.toJSONString());
	          
	  try {
	        FileWriter writer = new FileWriter("src/main/webapp/resources/my.json");
	        writer.write(myjson.toJSONString());
	        writer.flush();
	        writer.close();
	        
	        
	  }catch (Exception e) {
	   System.out.println(e);
	}
	   }

	
	}


