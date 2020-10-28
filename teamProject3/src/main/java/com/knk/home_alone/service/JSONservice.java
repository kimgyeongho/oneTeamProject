package com.knk.home_alone.service;

import java.io.FileWriter;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.knk.home_alone.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;
@Log4j
public class JSONservice {
	@Autowired //json만들기 위한 Mapper에서 바로 사용  서비스에서 가지고 오지 않음
	private BoardMapper BoardMapper;
            //데이터베이스에서 위도,경도 값을 가지고와서 json 만들기
			public void sand() throws Exception {
				
				ArrayList<String> lat= (ArrayList<String>) BoardMapper.selec_lat();
				ArrayList<String> lng= (ArrayList<String>) BoardMapper.selec_lng();

		        JSONObject myjson = new JSONObject();	
		        JSONArray positionsArray = new JSONArray();
    
		        int i=0;
		        while(i<lat.size()) {
			        JSONObject positionsInfo = new JSONObject();
		        	positionsInfo.put("lat",lat.get(i));
		        	positionsInfo.put("lng",lng.get(i));
		        	positionsArray.add(positionsInfo);
				    ++i;
		        } 		       
		        myjson.put("positions", positionsArray);
				log.info("JSONservice" +myjson);

		  try {
		        FileWriter writer = new FileWriter("C:\\Users\\kkh\\git\\oneTeamProject4\\teamProject3\\src\\main\\webapp\\resources\\json\\json.json");
		        writer.write(myjson.toJSONString());
		        writer.flush();
		        writer.close();
		        
		        
		  }catch (Exception e) {
		   System.out.println(e);
		}
		   }
			
	}


