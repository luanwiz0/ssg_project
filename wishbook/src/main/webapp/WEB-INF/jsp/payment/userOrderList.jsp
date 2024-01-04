<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	td { text-align: center;}
	*{ font-family: 'NanumSquareNeoBold'; }
</style>
</head>
<body>
<!-- navigation bar -->
<%@include file="/WEB-INF/jsp/navbar.jsp"%>
<h2>주문 목록</h2>
<div class="container" style=" text-align: center;">
<div class="form-group col row justify-content-center h-100 align-items-center">
<table class="table table-bordered"  align="center" style="text-align: center;">
	<tr>
		<td>주문번호</td>
		<td></td>
		<td></td>
		<td>제목</td>
		<td>수량</td>
		<td>가격</td>
	</tr>
	<c:forEach var="item" items="${orderList}">
		<tr>
			<td><br><br><br>${item.orderId}</td>
			<td><br><br><br>${item.kind}</td>
			<td><img border="0" style="width:100px; height:150px;" src="<c:url value="/image/" />${item.imageUrl}" /></td>
			
			<td><br><br><br>${item.title}</td>
			<td><br><br><br>${item.quantity}</td>
			<td><br><br><br>${item.totalPrice}</td>
		</tr>
	</c:forEach>
</table>
<input class="btn btn-outline-secondary btn-sm" style="width: 130pt;height:25pt; background-color:dimgray; color: white;"type="button" value = "회원정보로 돌아가기" onclick="location.href='<c:url value='/account/userInfo'/>'">
<div><br></div>
</div>
</div>
</body>
</html>