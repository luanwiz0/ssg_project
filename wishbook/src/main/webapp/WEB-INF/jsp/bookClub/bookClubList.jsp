<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.team_h.wishbook.domain.BookClub" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style>
	td{ text-align: center;}
	*{ font-family: 'NanumSquareNeoBold'; }
</style>
</head>
<body>
<!-- navigation bar -->
<%@include file="/WEB-INF/jsp/navbar.jsp"%>
<h2 align="center">독서모임 목록</h2>
<br>
<div class="container" class="container" style=" text-align: center;">
<div class="form-group col row justify-content-center h-100 align-items-center">
<table class="table table-bordered" align="center" style="text-align: center;">
	<tr>
		<th>독서 모임 이름</th>
		<th>모임장</th>
		<th>소개</th>
		<th>책 제목</th>
		<th>현재 인원</th>
	</tr>
	<c:forEach var="item" items="${list}">
	<%
		BookClub bookClub = (BookClub) pageContext.getAttribute("item");
		String memberId = (String)session.getAttribute("userId");
		String userId = bookClub.getUserId();
	%>
		<tr>
			<td>${item.clubName}</td>
			<td>${item.userId}</td>
			<td>${item.description}</td>
			<td><a href="#none" onclick="location.href='<c:url value='/book/info/${item.bookId}'/>'">${item.title}</a></td>
			<td>${item.currNum}</td>
			<!-- 로그인하지 않은 경우 신청 불가능 -->
			<% if(memberId != null){ %>
				<!-- 클럽의 회원장인 경우: 독서모임 수정&삭제 버튼 보이게 -->
					<% if(memberId.equals(userId) || memberId.equals("admin")){%>
					<td><a href="/bookClub/update?clubId=${item.clubId}">수정</a></td>
					<td><a href="/bookClub/delete?clubId=${item.clubId}">삭제</a></td>
				<%} %>
				<td><a href="/bookClub/register?clubId=${item.clubId}">신청</a></td>
			<% } %>
			<td><a href="/bookClub/userList?clubId=${item.clubId}">회원 목록</a></td>
	</tr><br>
</c:forEach>
</table>
</div>
<br>
<%if (session.getAttribute("userId") != null) { %>  
<a href="/bookClub/add">독서모임 추가</a>
<%} %>
</div>
<br><br><br>
<!-- footer bar -->
<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>