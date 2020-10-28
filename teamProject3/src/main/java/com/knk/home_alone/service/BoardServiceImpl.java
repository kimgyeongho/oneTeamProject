package com.knk.home_alone.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.knk.home_alone.domain.BoardVO;
import com.knk.home_alone.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	@Setter(onMethod_ = @Autowired)	
	private BoardMapper boardMapper;

	//메인화면 검색창을 통해 게시판 확인 및 게시판 클릭시 게시판 목록 보이기
	@Override
	public List<BoardVO> getboardList(BoardVO vo) throws Exception {
		log.info("getboardList"+vo);
		return  boardMapper.getboardList(vo);
	}
	//게시판 글쓰기
	@Override
	public void boardupdate(BoardVO vo) throws Exception {
		boardMapper.boardupdate(vo);
	}
	//게시판 조회수 올리기
	@Override
	public void bodercot(BoardVO vo) throws Exception {
		boardMapper.bodercot(vo);

	}
	//게시판 이미지 올리기
	@Override
	public void boardImage(Map<String, Object> imageMap) throws Exception {
		boardMapper.boardImage(imageMap);
	}
	//클릭시 게시판 상세 보기 
	@Override
	public BoardVO getBoard(BoardVO vo) throws Exception {
		boardMapper.bodercot(vo);
		return boardMapper.getBoard(vo);
	}
	//게시판 상세보기 이미지 출력하기
	@Override
	public List<Map<String, Object>> getboardImage(int seq) throws Exception {
		return boardMapper.getboardImage(seq);
	}
	//게시판 글 수정하기
	@Override
	public void boardupdate2(BoardVO vo) throws Exception {
		boardMapper.boardupdate2(vo);
	}
	//게시판 이미지 수정하기
	@Override
	public void boardImageUpdate(Map<String, Object> imageMap) throws Exception {
		boardMapper.boardImageUpdate(imageMap);
		
	}
	//게시판 글 삭제하기
	@Override
	public void board_Delete(BoardVO vo) throws Exception {
		boardMapper.board_Delete(vo);
	}
	//게시판 글 삭제하기
	@Override
	public void board_Delete2(BoardVO vo) throws Exception {
		boardMapper.board_Delete2(vo);

	}

	


}
