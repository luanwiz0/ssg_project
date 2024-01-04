<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<title>독서모임 등록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style>
	th { text-align: center;}
	*{ font-family: 'NanumSquareNeoBold'; }
</style>
</head>
<body>
<!-- navigation bar -->
<%@include file="/WEB-INF/jsp/navbar.jsp"%>
<h2 align="center">독서모임 등록</h2><br>
<div style="text-align: center;">
	  <form action="/bookClub/bookSearch" method="post">	 
	  	<input type="text" value="${title}" name="title" size="20"/>
	  	<input type="submit" value="검색" />
	  </form>
	  <br><br>
</div>
<div class="container" style=" text-align: center;">
<div class="form-group col row justify-content-center h-100 align-items-center">



<form:form modelAttribute="bookClubInfo" action="/bookClub/add" method="POST">
<table class="table table-bordered"  align="center" style="width:600px; text-align: center;">
	<tr><th colspan = "2">독서모임 정보</th></tr>
		<tr>
			<td>bookId</td>
			<td><form:input type="text" path="bookId" /></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><form:input type="text" path="clubName" /></td>
		</tr>
		<tr>
			<td>소개</td>
			<td><form:input type="text" path="description" /></td>
		</tr>
		<tr>
			<td>최대 인원</td>
			<td><form:input type="number" path="maxNum" /></td>
		</tr>
		<tr>
			<td>모임 요일</td>
			<td><form:select path="dayVal">
			<form:options items="${bookClubInfo.dayStr}" />	
			</form:select></td>
		</tr>
		<tr>
			<td>시작 시간</td>
			<td><form:input type="number" path="startTime" /></td>
		</tr>
		<tr>
			<td>진행 시간</td>
			<td><form:input type="number" path="hour" /></td>
		</tr>
		<tr>
			<td>모임 장소</td>
			<td><form:input type="text" path="address" /></td>
		</tr>
	</table>
<br>
<input type="submit" value="확인">
</form:form>
</div>
</div>
<br><br><br>
<!-- footer bar -->
<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>