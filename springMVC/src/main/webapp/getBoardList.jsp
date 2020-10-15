<%-- <%@page import="com.springbook.biz.board.impl.BoardDAO" %>
<%@page import="com.springbook.biz.board.boardVO" %>
<%@page import="com.springbook.biz.user.userVO" %> 
<%@page import="java.util.List"%>
	EL 식이랑 JSTL 식으로 할꺼다 임포트 없어진다
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
   <%
	/* //1. 사용자 입력 정보 추출(검색 기능은 나중에 구현) 
	//2. DB 연동 처리
	
	boardVO vo = new boardVO();
   BoardDAO dao =new BoardDAO();
   List<boardVO> boardList= dao.getboardList(vo);
   
   //3. 응답 화면 HTML 구성 */
   //위에꺼 다 서블릿 으로 옮김 
   
/*    // 세션에 저장된 글 목록을 꺼낸다
   userVO user=(userVO) session.getAttribute("user");
   List<boardVO> boardList=(List) session.getAttribute("boardList");
   이것도 필요없어짐
   */
   
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
</head>
<body>
<center>
<h1><spring:message code="message.board.list.mainTitle"/></h1>
<h3>${user.name}<spring:message code="message.board.list.welcomeMsg"/>... <a href="logout.do">log-out</a></h3>


<!--검색 시작  -->
<form action="getBoardList.do" method="post">
	<table border="1" cellpadding="0" cellspacting="0" width="700">
		<tr>
			<td align="right">
				<select name="searchCondition">
					<c:forEach items="${conditionMap }" var="option">
						<option value="${option.value }">${option.key }
					</c:forEach>
				</select>
				<input name="serchKeyword" type="text"/>
				<input type="submit" value="<spring:message code="message.board.list.search.condition.btn"/>"/>
			</td>
		</tr>
	</table>
</form>
<!-- 검색 종료 -->
<table border="1" cellpadding="0" cellspacting="0" width="700">
	<tr>
		<th bgcolor="orange" width="100"><spring:message code="message.board.list.table.head.seq"/></th>
		<th bgcolor="orange" width="100"><spring:message code="message.board.list.table.head.title"></spring:message></th>
		<th bgcolor="orange" width="100"><spring:message code="message.board.list.table.head.writer"/></th>
		<th bgcolor="orange" width="100"><spring:message code="message.board.list.table.head.regDate"/></th>
		<th bgcolor="orange" width="100"><spring:message code="message.board.list.table.head.cnt"/></th>
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
<a href="insertBoard.jsp"><spring:message code="message.board.list.link.insertBoard"/></a>
</center>

</body>
</html>