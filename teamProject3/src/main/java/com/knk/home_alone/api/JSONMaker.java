package com.knk.home_alone.api;

import java.io.FileWriter;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.knk.home_alone.domain.addressTESt;
import com.knk.home_alone.mapper.MainMapper;

public class JSONMaker {
	@Autowired //구글 아이디 값 
	private MainMapper mainMapper;
/*		 public static void main(String[] args) {
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
	   }*/
			public void sand() throws Exception {
				
				addressTESt test= mainMapper.selecTest();
				
				String Lat= test.getLat();
				String Lng= test.getLng();
				System.out.println(Lat+Lng);
				
				 double x=37.559156687062148;
				 double y=126.92536526611102;
				 double x1=37.559156687062148;
				 double y1=126.92536526611102;
		         JSONObject myjson = new JSONObject();	
		         JSONArray positionsArray = new JSONArray();
		         JSONObject positionsInfo = new JSONObject();
		         
		         positionsInfo.put("lng",test.getLat());
		         positionsInfo.put("lat",test.getLng());
		      
		          

		         for(int i=0; i<positionsInfo.size(); i++){
		        	 positionsArray.add(positionsInfo);
		         }
		         myjson.put("positions", positionsArray);
	    
		          System.out.println(myjson.toJSONString());
		          
		  try {
		        FileWriter writer = new FileWriter("src/main/webapp/resources/json/my.json");
		        writer.write(myjson.toJSONString());
		        writer.flush();
		        writer.close();
		        
		        
		  }catch (Exception e) {
		   System.out.println(e);
		}
		   }
			
	}


