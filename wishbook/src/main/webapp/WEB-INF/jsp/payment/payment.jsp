<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<hr><h3 align="center">결제 목록</h3><hr>
<br>
<div class="container" style=" text-align: center;">
<div class="form-group col row justify-content-center h-100 align-items-center">
<table class="table table-bordered"  align="center" style="text-align: center;">
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td>제목</td>
		<td>수량</td>
		<td>가격</td>
	</tr>
	<!-- 
	<th>cartId</th>
	<th>bookId</th> -->
	<c:forEach var="item" items="${orderInfo.itemList}" varStatus="status">
	<tr>
		<td><br><br><br>${status.count}</td>
		<td><br><br><br>${item.kind}</td>
		<td><img border="0" style="width:100px; height:150px;" src="<c:url value="/image/" />${item.imageUrl}" /></td>
		<td><br><br><br>${item.title}</td>
		<td><br><br><br>${item.quantity}</td>
		<td><br><br><br>${item.price}</td>
		<!-- 
		<td><br><br><br>${item.cartId}</td>
		<td><br><br><br>${item.bookId}</td> -->
	</tr>
</c:forEach>
</table>

<div class="container"><hr>
<h3 align="center">결제 정보</h3><hr><br>
<section class="container mt-3" style="max-width: 600px;">
<form:form modelAttribute="orderInfo" action="/order/add" method="post">
	<div class="form-group" style="width:600px;">
		<label for="userTel">전화번호</label> 
		<form:input type="text" path="userTel" class="form-control" placeholder="전화번호" />
	</div>
	<div class="form-group" style="width:600px;">
		<label for="address">주소</label> 
		<form:input type="text" path="address" class="form-control" placeholder="주소" />
	</div>
	<div class="form-group" style="width:600px;">
		<label for="cardType" class="form-group">카드사</label>
		<form:select path="cardType">
		<form:options items="${orderInfo.cardTypes}"/>
	</form:select> 
	</div>
	<div class="form-group" style="width:600px;">
		<label for="cardNum">카드번호</label> 
		<form:input type="text" path="cardNum" class="form-control" placeholder="카드번호" />
	</div><br>
	<div class="form-group" align="center">        
        <button type="submit" class="btn btn-outline-secondary">확인</button>
    </div>
</form:form>
</section>
</div>
</div>
</div>
<br><br><br><br>
<!-- footer bar -->
<%@include file="/WEB-INF/jsp/footer.jsp"%> 
</body>
</html>