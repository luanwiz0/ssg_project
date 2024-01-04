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

<h2 align="center">장바구니</h2><br>

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
	<c:forEach var="item" items="${itemList}" varStatus="status">
	<tr>
		<td><br><br><br>${status.count}</td>
		<td><br><br><br>${item.kind}</td>
		<td><img border="0" style="width:100px; height:150px;" src="<c:url value="/image/" />${item.imageUrl}" /></td>
		<td><br><br><br>${item.title}</td>
		<!-- 수정 버튼 -->
		
		<c:choose>
		
		<c:when test="${item.kind eq '중고책' or item.kind eq '공동구매' or item.kind eq '경매도서'}">
		<td>
			<br><br><input type="text" name="quantity" value="1" style="width:100px;" disabled><br><br>
			
		</td>
		</c:when>
		
		
		<c:when test="${item.kind ne '중고책' }">
		<td>
			<form action="/cart/update" method="post">
				<br><br><input type="hidden" name="cartItemId" value="${item.cartId}">
				<input type="number" name="quantity" value="${item.quantity}" style="width:100px;"><br><br>
				<button type="submit" class="btn btn-outline-secondary btn-sm" style="font-size: small">수정</button>
			</form>
		</td>
		</c:when>
		
		</c:choose>
		<td><br><br><br>${item.price}</td>
		<!-- 삭제 버튼 -->
		<!-- <a href="/cart/delete?cartItemId=${item.cartId}">삭제</a> -->
		<td>
			<br><br>
			<button type="submit" class="btn btn-outline-secondary btn-sm" style="width:70px; font-size: small;"
				onclick="location.href='/cart/delete?cartItemId=${item.cartId}'">삭제</button>
		</td>
	</tr>
	</c:forEach>
</table>
</div>
<br>
<br>
<c:choose>
	<c:when test="${not empty itemList}">
		<button type="submit" class="btn btn-outline-secondary" onclick="location.href='/order/payment'">결제 페이지</button>
	</c:when>
</c:choose>
<br><br>
<input class="btn btn-outline-secondary btn-sm" style="width: 130pt;height:25pt; background-color:dimgray; color: white;"type="button" value = "회원정보로 돌아가기" onclick="location.href='<c:url value='/account/userInfo'/>'">
<div><br></div>
<br><br><br>
</div>
<!-- footer bar -->
<%@include file="/WEB-INF/jsp/footer.jsp"%> 
</body>
</html>