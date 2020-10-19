package com.knk.home_alone.api;


import java.io.FileWriter;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.knk.home_alone.mapper.MainMapper;

public class JSONMaker {
	@Autowired //구글 아이디 값 
	private MainMapper mainMapper;

			public static void sand() throws Exception {
				
//				ArrayList<String> lat= (ArrayList<String>) mainMapper.selec_lat();
//				ArrayList<String> lng= (ArrayList<String>) mainMapper.selec_lng();

		        JSONObject myjson = new JSONObject();	
		        JSONArray positionsArray = new JSONArray();
    
		        int i=0;
		        while(i<i) {
			        JSONObject positionsInfo = new JSONObject();
//		        	positionsInfo.put("lat",lat.get(i));
//		        	positionsInfo.put("lng",lng.get(i));
		        	positionsArray.add(positionsInfo);
				    ++i;
		        } 		       
		        myjson.put("positions", positionsArray);
		          
		  try {
		        FileWriter writer = new FileWriter("C:\\Users\\kkh\\git\\git4\\oneTeamProject\\teamProject3\\src\\main\\webapp\\resources\\json\\json.json");
		        writer.write(myjson.toJSONString());
		        writer.flush();
		        writer.close();
		        
		        
		  }catch (Exception e) {
		   System.out.println(e);
		}
		   }
			
	}


