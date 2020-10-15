<%@page import="com.springbook.biz.user.impl.userDAO" %>
<%@page import="com.springbook.biz.user.UserVO" %>
<%@page contentType ="text/html; charset=EUC-KR"%>
<%
	//1. 사용자 입력 정보 추출 
String id = request.getParameter("id");
String pw = request.getParameter("pw");
   //2.DB 연동 처리
   UserVO vo =new UserVO();
   vo.setId(id);
   vo.setPw(pw);
   
   userDAO dao=new userDAO();
  UserVO user = dao.getuser(vo);
   
   //3. 화면 네비게이션
   if(user != null){
	   response.sendRedirect("getBoardList.jsp");
   }else{
	   response.sendRedirect("login.jsp");
   }
%>