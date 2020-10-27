package jsontest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class JDBCUtil {
	public JDBCUtil() {
	}
	public static Connection getconnection() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mariadb://localhost:3306/mydb","root","akfldkdb");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	public static void close(PreparedStatement stmt, Connection conn) {
		if(stmt !=null) {
			try {
				if(!stmt.isClosed()) stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				stmt=null;
			}
		}
		if(conn !=null) {
			try {
				if(!conn.isClosed()) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				conn=null;
			}
		}
	}
	public static void close(PreparedStatement stmt, Connection conn , ResultSet rs) {
		if(stmt !=null) {
			try {
				if(!stmt.isClosed()) stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				stmt=null;
			}
		}
		if(conn !=null) {
			try {
				if(!conn.isClosed()) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				conn=null;
			}
		}
		if(rs !=null) {
			try {
				if(!rs.isClosed()) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				rs=null;
			}
		}
	}
}
