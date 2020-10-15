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
	          myjson.put("lng",y);
	          myjson.put("lat",x);
	          myjson.put("lng",y1);
	          myjson.put("lat",x1);
	          
	          
	          JSONArray subjectlist = new JSONArray();
	         for(int i=0; i<myjson.size(); i++){
	          subjectlist.add(myjson);
	         }
	          JSONObject position = new JSONObject();
	          position.put("positions", subjectlist);
	       
	          System.out.println(position.toJSONString());
	          
	  try {
	        FileWriter writer = new FileWriter("src/main/webapp/resources/my.json");
	        writer.write(subjectlist.toJSONString());
	        writer.flush();
	        writer.close();
	        
	        
	  }catch (Exception e) {
	   System.out.println(e);
	}
	   }

	
	}


