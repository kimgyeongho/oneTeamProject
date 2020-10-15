package com.springbook.biz.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.springbook.biz.board.impl.BoardService;

public class BoardServiceClient {

	public static void main(String[] args) {
		//1.Spring 컨테이너를 구동한다.
		AbstractApplicationContext container= new GenericXmlApplicationContext("applicationContext.xml");
		//2.Spring 컨테이너로 부터 boardserviceimpl 객체를 랍업 한다 .
		BoardService boardservice =(BoardService) container.getBean("boardService");
		boardVO vo =new boardVO();
//		vo.setSeq(100);
//		vo.setTitle("100번예제");
//		vo.setWriter("김재범100");
//		vo.setContent("임시 내용입니다아아아아아아아앙:100");
//		boardservice.insertboard(vo);
//		boardservice.deleteboard(vo);
		//검색
	List<boardVO> list =boardservice.getboardList(vo);
	for(boardVO c:list) {
		System.out.println(c.toString());
		
	
	}
	//컨테이너 종료
	container.close();
	
	}

}
