package com.springbook.biz.board.impl;

import java.util.List;

import com.springbook.biz.board.boardVO;

public interface BoardService {

	// 글등록
	void insertboard(boardVO vo);

	// 글 수정
	void updateboard(boardVO vo);

	// 글삭제
	void deleteboard(boardVO vo);

	// 글 상세조회
	boardVO getboard(boardVO vo);

	//글목록 조회
	List<boardVO> getboardList(boardVO vo);
}