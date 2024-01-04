<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style>
	th { text-align: center;}
	
	  *{
	  	font-family: 'NanumSquareNeoBold';
	  }

</style>
</head>
<body>
 	<!-- navigation bar -->
	<%@include file="/WEB-INF/jsp/navbar.jsp"%>
<h2 align="center">신청 회원 목록</h2><br>
<div class="container" class="container" style=" text-align: center;">
<div class="form-group col row justify-content-center h-100 align-items-center">
<table class="table table-bordered" align="center"style="width: 900px; text-align: center;">
	<th style="width: 1%;"></th>
	<th class="col-sm-1" scope="col">ID</th>
	<th class="col-sm-1" scope="col">이름</th>
	<th class="col-sm-1" scope="col">이메일</th>
	<th class="col-sm-1" scope="col">연락처</th>
	<c:forEach items="${memberList}" var="member"  varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td>${member.userId}</td>
			<td>${member.name}</td>
			<td>${member.email}</td>
			<td>${member.phone}</td>
		</tr>
	</c:forEach>
</table></div></div>
<div style=" text-align: center;">
<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>