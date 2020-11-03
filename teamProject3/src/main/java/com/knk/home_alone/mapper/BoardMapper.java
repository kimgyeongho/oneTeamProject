package com.knk.home_alone.mapper;

import java.util.List;
import java.util.Map;


import com.knk.home_alone.domain.BoardVO;

public interface BoardMapper {
	
	//메인화면 검색창을 통해 게시판 확인 및 게시판 클릭시 게시판 목록 보이기
	public List<BoardVO> getboardList(BoardVO vo)throws Exception;
	public List<BoardVO> seq() throws Exception;
	public List<BoardVO> seq2(BoardVO vo) throws Exception;

	//클릭시 게시판 상세 보기 
	public BoardVO getBoard(BoardVO vo)throws Exception;
	//게시판 조회수 올리기
	public void  bodercot(BoardVO vo)throws Exception;
	//게시판 글쓰기
	public void boardupdate(BoardVO vo)throws Exception;
	//게시판 이미지 올리기
	public void boardImage(Map<String, Object> imageMap)throws Exception;
    //게시판 상세보기 이미지 출력하기
	public List<Map<String, Object>> getboardImage(int seq) throws Exception;
	//게시판 글 수정하기
	public void boardupdate2(BoardVO vo)throws Exception;
	//게시판 이미지 수정하기
	public void boardImageUpdate(Map<String, Object> imageMap)throws Exception;
    //게시판 글 삭제하기
	public void board_Delete(BoardVO vo)throws Exception;
    //이미지 글 삭제하기
	public void board_Delete2(BoardVO vo)throws Exception;
	// 위도경도  찾기
		public List<String> selec_lat() throws Exception;
		public List<String> selec_lng() throws Exception;
}
