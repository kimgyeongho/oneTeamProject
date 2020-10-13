
/*package com.knk.home_alone.api;

import java.io.FileWriter;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class JSONMaker {

		 public static void main(String[] args) throws IOException{
	          // {} - JSONObject ,[] - JSONArray
	         JSONObject myjson = new JSONObject();
	         myjson.put("name", "김서연");
	         myjson.put("addr", "인천시");
	         myjson.put("age", "25");
	         JSONArray subjectlist = new JSONArray();
	         subjectlist.add("java");
	         subjectlist.add("spring");
	         subjectlist.add("hadoop");
	         myjson.put("subjectlist", subjectlist);
	  try {
	        FileWriter writer = new FileWriter("src/main/webapp/resources/my.json");
	        writer.write(myjson.toJSONString());
	        writer.flush();
	        writer.close();
	        System.out.println(myjson.toJSONString());
	        
	  }catch (Exception e) {
	   System.out.println(e);
	}
	   }

	
	}

*/
//github.com/kimgyeongho/oneTeamProject.git
