<%-- <%@page import="com.springbook.biz.board.impl.BoardDAO" %>
<%@page import="com.springbook.biz.board.boardVO" %>
<%@page import="com.springbook.biz.user.userVO" %> 
<%@page import="java.util.List"%>
	EL ���̶� JSTL ������ �Ҳ��� ����Ʈ ��������
--%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
   <%
	/* //1. ����� �Է� ���� ����(�˻� ����� ���߿� ����) 
	//2. DB ���� ó��
	
	boardVO vo = new boardVO();
   BoardDAO dao =new BoardDAO();
   List<boardVO> boardList= dao.getboardList(vo);
   
   //3. ���� ȭ�� HTML ���� */
   //������ �� ���� ���� �ű� 
   
/*    // ���ǿ� ����� �� ����� ������
   userVO user=(userVO) session.getAttribute("user");
   List<boardVO> boardList=(List) session.getAttribute("boardList");
   �̰͵� �ʿ������
   */
   
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�۸��</title>
</head>
<body>
<center>
<h1>�۸��</h1>
<h3>�̸���󳻰�ʹٴ� ȯ���մϴ�... <a href="logout.do">log-out</a></h3>


<!--�˻� ����  -->
<form action="getBoardList.do" method="post">
	<table border="1" cellpadding="0" cellspacting="0" width="700">
		<tr>
			<td align="right">
				<select name="searchCondition">
					<option value="TITLE">����
					<option value="CONTENT">����
				</select>
				<input name="serchKeyword" type="text"/>
				<input type="submit" value="�˻�"/>
			</td>
		</tr>
	</table>
</form>
<!-- �˻� ���� -->
<table border="1" cellpadding="0" cellspacting="0" width="700">
	<tr>
		<th bgcolor="orange" width="100">��ȣ</th>
		<th bgcolor="orange" width="100">����</th>
		<th bgcolor="orange" width="100">�ۼ���</th>
		<th bgcolor="orange" width="100">�����</th>
		<th bgcolor="orange" width="100">��ȸ��</th>
	</tr>
	
	<c:forEach items="${boardList }" var="board">
	<tr>
		<td>${board.seq }</td>
		<td align="left"><a href="getBoard.do?seq=${board.seq }">
									                                           ${board.title }</a></td>
		<td>${board.writer }</td>
		<td>${board.regDate}</td>
		<td>${board.cnt}</td>						                                           
	</tr>
	</c:forEach>
</table>
<br>
<a href="insertBoard.jsp">���۵��</a>
</center>

</body>
</html>