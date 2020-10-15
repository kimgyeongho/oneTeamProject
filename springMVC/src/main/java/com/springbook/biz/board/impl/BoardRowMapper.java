package com.springbook.biz.board.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springbook.biz.board.boardVO;

public class BoardRowMapper implements RowMapper<boardVO> {
	public BoardRowMapper() {
		System.out.println("BoardRowMapper 생성");
	}

	@Override
	public boardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		boardVO vo=new boardVO();
		vo.setSeq(rs.getInt("seq"));
		vo.setTitle(rs.getString("title"));
		vo.setWriter(rs.getString("writer"));
		vo.setContent(rs.getString("content"));
		vo.setRegDate(rs.getDate("regdate"));
		vo.setCnt(rs.getInt("cnt"));
		return vo;
	}

}
