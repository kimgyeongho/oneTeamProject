<%@page import="com.springbook.biz.board.impl.BoardDAO" %>
<%@page import="com.springbook.biz.board.boardVO" %>
<%@page contentType ="text/html; charset=EUC-KR"%>
<%
	//1. 사용자 입력 정보 추출 
	String seq = request.getParameter("seq");
	//2. DB 연동처리
	
	boardVO vo = new boardVO();
	vo.setSeq(Integer.parseInt(seq));
	
	BoardDAO dao=new BoardDAO();
	dao.deleteboard(vo);	
	//3. 화면 네비게이션
	
	response.sendRedirect("getBoardList.jsp");
	
	
%>