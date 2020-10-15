package com.springbook.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.board.boardVO;


@Service("boardService")
public class BoardServiceimpl implements BoardService {
	public BoardServiceimpl() {
		System.out.println("boardimpl 생성");
	}
	@Autowired
	private BoardDAOMybatis dao;
	@Override
	public void insertboard(boardVO vo) {
		dao.insertBoard(vo);
//		dao.insertboard(vo);
	}
	@Override
	public void updateboard(boardVO vo) {
		dao.updateBoard(vo);
	}
	@Override
	public void deleteboard(boardVO vo) {
		dao.deleteBoard(vo);
	}
	@Override
	public boardVO getboard(boardVO vo) {
		return dao.getBoard(vo);
	}
	@Override
	public List<boardVO> getboardList(boardVO vo) {
		return dao.getBoardList(vo);
	}
}
