package com.springbook.view.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.springbook.biz.board.boardVO;
import com.springbook.biz.board.impl.BoardService;

@Controller
@SessionAttributes("board")
public class BoardController {
	//검색 조건 목록
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		System.out.println("Requestmapping ㅂ보다 먼저 실행");
		Map<String, String > conditionMap = new HashMap<String, String>();
		conditionMap.put("제목","TITLE");
		conditionMap.put("내용","CONTENT");
		return conditionMap;
	}
	
	@Autowired
	private BoardService boardService;

	@RequestMapping("/dataTransForm.do")
	@ResponseBody
	public List<boardVO> dataTransform(boardVO vo){
		vo.setSearchCondition("TITLE");
		vo.setSerchKeyword("");
		List<boardVO> boardList=boardService.getboardList(vo);
		return boardList;
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(boardVO vo) {
		System.out.println("삭제"+vo.toString());

		boardService.deleteboard(vo);
		return "getBoardList.do";
	}

	@RequestMapping("/getBoard.do")
	public String getBoard(boardVO vo, Model mav) {
		System.out.println("글 상세조회 처리");

		mav.addAttribute("board", boardService.getboard(vo));
		return "getBoard.jsp";
	}

	@RequestMapping("/getBoardList.do")
	public String getBoardList(boardVO vo, Model mav) {
		System.out.println("글 목록 검색처리 GetBoardListController");
		if(vo.getSearchCondition()==null) vo.setSearchCondition("TITLE");
		if(vo.getSerchKeyword()==null) vo.setSerchKeyword("");
		
		mav.addAttribute("boardList", boardService.getboardList(vo));
		return "getBoardList.jsp";
	}

	@RequestMapping("/insertBoard.do")
	public String insertBoard(boardVO vo) throws  IOException {
		System.out.println("인서트보드 글등록");
		MultipartFile uploadFile= vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String filename= uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("D:/"+filename));
		}
		boardService.insertboard(vo);
		return "getBoardList.do";
	}

	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") boardVO vo) {
		System.out.println("번호" + vo.getSeq());
		System.out.println("제목" + vo.getTitle());
		System.out.println("작성자" + vo.getWriter());
		System.out.println("내용" + vo.getContent());
		System.out.println("등록일" + vo.getRegDate());
		System.out.println("조회수" + vo.getCnt());

		boardService.updateboard(vo);
		return "getBoardList.do";
	}

}
