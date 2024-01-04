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
	  *{
	  	font-family: 'NanumSquareNeoBold';
	  }
</style>
  
</head>
<body>

 	<!-- navigation bar -->
	<%@include file="/WEB-INF/jsp/navbar.jsp"%>

<h2 align="center">등급 기준</h2><br>
<table class="table table-bordered" align="center"style="width: 400px; height: 200px; text-align: center;">
	<th class="col-sm-1" scope="col">등급</th>
	<th class="col-sm-1" scope="col">적립</th>
	<th class="col-sm-1" scope="col">누적 금액</th>
 <tbody>
	<c:forEach items="${gradeList}" var="grade">
		<tr>
			<td>${grade.name}</td>
			<td>${grade.pointRate}%</td>
			<td>${grade.standardPrice}원 이상</td>
		</tr>
	</c:forEach>
 </tbody>
</table>
<div style=" text-align: center;">
	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>