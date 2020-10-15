package com.springbook.biz.user.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;
import com.springbook.biz.user.UserVO;

@Repository("userDAO")
public class userDAO{
	public userDAO() {
	}
		// jdbc 관련 변수
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
		private final String userget="select * from users where id=? and pw=?";
		
		//회원등록
		
		public UserVO getuser(UserVO vo) {
			System.out.println("userDAO에서 받아오는 클라이언트가 보낸 유정보는:"+vo.toString());
			UserVO user = null;
			conn = JDBCUtil.getconnection();
			try {
				pstmt = conn.prepareStatement(userget);
				pstmt.setString(1,vo.getId());
				pstmt.setString(2,vo.getPw());
				rs=pstmt.executeQuery();
				if(rs.next()) {
					user=new UserVO();
					user.setId(rs.getString("id"));
					user.setPw(rs.getString("pw"));
					user.setName(rs.getString("name"));
					user.setRole(rs.getString("role"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(pstmt, conn);
			}
			
			
				return user;
				
			
		}
}
