<%@page import="com.springbook.biz.board.impl.BoardDAO" %>
<%@page import="com.springbook.biz.board.boardVO" %>
<%@page contentType ="text/html; charset=EUC-KR"%>
<%
	//1. ����� �Է� ���� ���� 
	String seq = request.getParameter("seq");
	//2. DB ����ó��
	
	boardVO vo = new boardVO();
	vo.setSeq(Integer.parseInt(seq));
	
	BoardDAO dao=new BoardDAO();
	dao.deleteboard(vo);	
	//3. ȭ�� �׺���̼�
	
	response.sendRedirect("getBoardList.jsp");
	
	
%>