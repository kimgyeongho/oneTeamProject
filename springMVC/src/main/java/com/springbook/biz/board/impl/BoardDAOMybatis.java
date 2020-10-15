package com.springbook.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.boardVO;

@Repository
public class BoardDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	public BoardDAOMybatis() {
		System.out.println("마바 빈생성");
	}

	
	public void insertBoard(boardVO vo) {
		mybatis.insert("BoardDAOmy.insertBoard", vo);
	}
	
	public void updateBoard(boardVO vo) {
		mybatis.update("BoardDAOmy.updateBoard", vo);
	}
	public void deleteBoard(boardVO vo) {
		mybatis.delete("BoardDAOmy.deleteBoard",vo);
		
	}
	public boardVO getBoard(boardVO vo) {
		return (boardVO) mybatis.selectOne("BoardDAOmy.getBoard",vo);
	}
	public List<boardVO> getBoardList(boardVO vo){
		return mybatis.selectList("BoardDAOmy.getBoardList",vo);
	}
}
