<%@page import="com.springbook.biz.user.impl.userDAO" %>
<%@page import="com.springbook.biz.user.UserVO" %>
<%@page contentType ="text/html; charset=EUC-KR"%>
<%
	//1. ����� �Է� ���� ���� 
String id = request.getParameter("id");
String pw = request.getParameter("pw");
   //2.DB ���� ó��
   UserVO vo =new UserVO();
   vo.setId(id);
   vo.setPw(pw);
   
   userDAO dao=new userDAO();
  UserVO user = dao.getuser(vo);
   
   //3. ȭ�� �׺���̼�
   if(user != null){
	   response.sendRedirect("getBoardList.jsp");
   }else{
	   response.sendRedirect("login.jsp");
   }
%>