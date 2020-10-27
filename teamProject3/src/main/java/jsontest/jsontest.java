package jsontest;

import java.io.FileWriter;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class jsontest {

	public static void main(String[] args) {
		jsondao dao =new jsondao();
		JSONObject myjson = new JSONObject();
		JSONArray list =dao.json();
		myjson.put("주소값",list);
		try {
			FileWriter writer = new FileWriter("src/main/webapp/resources/sibal.json");
			writer.write(myjson.toJSONString());
			writer.flush();
			writer.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
