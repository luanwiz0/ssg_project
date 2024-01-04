<%@page contentType="text/html; charset=utf-8"%>
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
	
<div style=" text-align: center;">
<h2>공동구매 등록</h2><br>
<div class="container" style=" text-align: center;">
<div class="form-group col row justify-content-center h-100 align-items-center">
<table class="table table-bordered"  align="center"style="width: 500px; height: 400px; text-align: center;">
	<th colspan = "2">책 정보</th>
	<tr>
	  <form action="/groupPurchase/search" method="post">
	  <td>제목</td>
	  <td><input type="text" value="${book.title}" name="title" size="20"/>
	  <input type="submit" value="검색" /></td></form>
	</tr>
	<tr>
	  <td>저자</td>
	  <td>${book.author}</td>
	  <input type="hidden" value="${book.author}" name="author"/>
	</tr>
	<tr>
	  <td>가격</td>
	  <td>${book.price}</td>
	  <input type="hidden" value="${book.price}" name="bookPrice"/>
	</tr>
	<form action="/groupPurchase/addFormDiscountRate" method="post">
	<input type="hidden" name="bookId" value="${book.bookId}"/>
	<th colspan = "2">공동구매 정보</th>
	<tr>
	  <td><label for="discountRate">할인율</label></td>
	  <td>
	  <input type="radio" id="discountRate" name="discountRate" value="5" ${discountRate == '5' ? 'checked="checked"' : '' }>5%
	  <input type="radio" id="discountRate" name="discountRate" value="10" ${discountRate == '10' ? 'checked="checked"' : '' }>10%
	  <input type="radio" id="discountRate" name="discountRate" value="15" ${discountRate == '15' ? 'checked="checked"' : '' }>15%
	  <button type="submit" class="btn-sm">선택</button></form></td>
	</tr>
	<tr>
	  <td>할인 가격</td>
	  <td>${price}</td>
	</tr>
	<tr><form action="/groupPurchase/add.do" method="post">
	  <td>최소 인원</td>
	  <td><input type="int" name="minCustomNum" size="20"/></td>
	</tr>
	<tr>
	  <td>최대 인원</td>
	  <td><input type="int" name="maxCustomNum" size="20"/></td>
	</tr>
	<tr>
	  <td>마감 기한</td>
	  <td><input type="date" name="deadline" size="20"/></td>
	</tr>
</table></div></div>
<input type="hidden" name="bookId" value="${book.bookId}"/>
<input type="hidden" name="discountRate" value="${discountRate}"/>
<input type="hidden" name="customerNum" value="0"/>
<input type="hidden" name="status" value="ongoing"/>
<button type="submit">등록</button></form></div><br><br>
<div style=" text-align: center;">
<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>