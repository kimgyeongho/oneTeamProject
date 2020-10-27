package jsontest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


public class jsondao  {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	JDBCUtil jdbcutil;
	public jsondao() {
		conn=jdbcutil.getconnection();
	}
	public JSONArray json(){
		JSONArray list = new JSONArray();
		String SQL= "SELECT * FROM json";
		try {
			pstmt =conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				JSONObject js = new JSONObject();
				js.put("lng",rs.getDouble("lng"));
				js.put("lat",rs.getDouble("lat"));
				list.add(js);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}
}
