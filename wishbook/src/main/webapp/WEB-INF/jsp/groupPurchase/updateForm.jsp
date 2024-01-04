<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	  h2{
	  	font-family: 'NanumSquareNeoBold';
	  }
</style>
</head>
<body>
 	<!-- navigation bar -->
	<%@include file="/WEB-INF/jsp/navbar.jsp"%>
<div style=" text-align: center;">
<h2>공동구매 상세정보</h2><br>
<div class="container" style=" text-align: center;">
<div class="form-group col row justify-content-center h-100 align-items-center">
<table class="table table-bordered"  align="center"style="width: 400px; height: 400px; text-align: center;">
	<th colspan = "2">책 정보</th>
	<tr>
		<td>제목</td>
		<td>${groupPurchase.title}</td>
	</tr>
	<tr>
		<td>저자</td>
		<td>${groupPurchase.author}</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>${groupPurchase.bookPrice}</td>
	</tr>	
	<th colspan = "2">공동구매 정보</th>
	<tr><form action="/groupPurchase/updateFormDiscountRate" method="post">
		<input type="hidden" name="groupId" value="${groupPurchase.groupId}"/>
		<td><label for="discountRate">할인율</label></td>
	  	<td>
	  		<input type="radio" id="discountRate" name="discountRate" value="5" ${discountRate == '5' ? 'checked="checked"' : '' }>5%
	 		<input type="radio" id="discountRate" name="discountRate" value="10" ${discountRate == '10' ? 'checked="checked"' : '' }>10%
	  		<input type="radio" id="discountRate" name="discountRate" value="15" ${discountRate == '15' ? 'checked="checked"' : '' }>15%
	  	<button type="submit">선택</button></form></td>
	</tr>
	<tr>
	  <td>할인 가격</td>
	  <td>${price}</td>
	</tr>
	<form action="/groupPurchase/update.do" method="post">
	<tr>
	  <td>최소 인원</td>
	  <td><input type="int" value="${groupPurchase.minCustomNum}" name="minCustomNum" size="20"/></td>
	</tr>
	<tr>
	  <td>최대 인원</td>
	  <td><input type="int" value="${groupPurchase.maxCustomNum}" name="maxCustomNum" size="20"/></td>
	</tr>
	<tr>
	  <td>마감 기한</td>
	  <fmt:formatDate var="deadline" value="${groupPurchase.deadline}" pattern="yyyy-MM-dd"/>
	  <td><input type="date" value="${deadline}" name="deadline" size="20"/></td>
	</tr>
</table></div></div>
<input type="hidden" name="groupId" value="${groupPurchase.groupId}"/>
<input type="hidden" name="customerNum" value="${groupPurchase.customerNum}"/>
<input type="hidden" name="bookId" value="${groupPurchase.bookId}"/>
<input type="hidden" name="discountRate" value="${discountRate}"/>
<input type="hidden" name="status" value="${groupPurchase.status}"/>
<input type="hidden" name="title" value="${groupPurchase.title}"/>
<input type="submit" value="수정" /></div><br>
</form>
<div style=" text-align: center;">
<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>