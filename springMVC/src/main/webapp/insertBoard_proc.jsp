<%@page import="com.springbook.biz.board.impl.BoardDAO" %>
<%@page import="com.springbook.biz.board.boardVO" %>
<%@page contentType ="text/html; charset=EUC-KR"%>
<%
	//1. 사용자 입력 정보 추출 
	request.setCharacterEncoding("EUC-KR");
String title = request.getParameter("title");
String writer = request.getParameter("writer");
String content = request.getParameter("content");


   //2.DB 연동 처리
    boardVO vo = new boardVO();
	vo.setTitle(title);
	vo.setWriter(writer);
	vo.setContent(content);
	
	   BoardDAO dao = new BoardDAO();
	   dao.insertboard(vo);
	   
   
   //3. 화면 네비게이션
response.sendRedirect("getBoardList.jsp");

  

%>