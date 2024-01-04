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
<h2 align="center">검색 결과</h2><br>
<div class="container" style=" text-align: center;">
<div class="form-group col row justify-content-center h-100 align-items-center">
<table class="table table-hover" align="center" style="width: 1000px; text-align: center;">
	<th>카테고리</th>
	<th>&nbsp;</th>
	<th>책 제목</th>
	<th>저자</th>
	<th>출판사</th>
	<th>가격</th>
	<th>&nbsp;</th>
	<c:forEach items="${bookList}" var="book">
		<tr>
			<td><br><br><br>${book.category}</td>
			<td><img border="0" style="width:100px; height:150px;" src="<c:url value="/image/" />${book.imageUrl}" /></td>
			<td><br><br><br>${book.title}</td>
			<td><br><br><br>${book.author}</td>
			<td><br><br><br>${book.publisher}</td>
			<td><br><br><br>${book.price}원</td>
			<td><br><br><br><form action="/groupPurchase/add" method="post">
			<input type="hidden" name="bookId" value="${book.bookId}"/>
			<div class="form-group">
				<button type="submit" class="btn btn-secondary">선택</button></form></td>
		</tr>
	</c:forEach>
</table></div></div>
<div style=" text-align: center;">
<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>