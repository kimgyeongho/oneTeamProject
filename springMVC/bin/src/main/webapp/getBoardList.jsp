<%-- <%@page import="com.springbook.biz.board.impl.BoardDAO" %>
<%@page import="com.springbook.biz.board.boardVO" %>
<%@page import="com.springbook.biz.user.userVO" %> 
<%@page import="java.util.List"%>
	EL 식이랑 JSTL 식으로 할꺼다 임포트 없어진다
--%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
<meta charset="EUC-KR">
<title>글목록</title>
</head>
<body>
<center>
<h1>글목록</h1>
<h3>이름골라내고싶다님 환영합니다... <a href="logout.do">log-out</a></h3>


<!--검색 시작  -->
<form action="getBoardList.do" method="post">
	<table border="1" cellpadding="0" cellspacting="0" width="700">
		<tr>
			<td align="right">
				<select name="searchCondition">
					<option value="TITLE">제목
					<option value="CONTENT">내용
				</select>
				<input name="serchKeyword" type="text"/>
				<input type="submit" value="검색"/>
			</td>
		</tr>
	</table>
</form>
<!-- 검색 종료 -->
<table border="1" cellpadding="0" cellspacting="0" width="700">
	<tr>
		<th bgcolor="orange" width="100">번호</th>
		<th bgcolor="orange" width="100">제목</th>
		<th bgcolor="orange" width="100">작성자</th>
		<th bgcolor="orange" width="100">등록일</th>
		<th bgcolor="orange" width="100">조회수</th>
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
<a href="insertBoard.jsp">새글등록</a>
</center>

</body>
</html>