<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
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
	
<h2 align="center">검색 결과</h2><br>

<div class="container">
<div class="form-group col row justify-content-center h-100 align-items-center">
<table class="table table-bordered">
  <thead class="table-light">
    <tr>
      <th class="col-sm-1" scope="col">&nbsp;</th>
      <th class="col-sm-2" scope="col">책 제목</th>
      <th class="col-sm-1" scope="col">저자</th>
      <th scope="col">카테고리</th>
      <th scope="col">출판사</th>
      <th scope="col">가격</th>
      <th class="col-sm-1" scope="col">&nbsp;</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${bookList}" var="book">
		<tr>
			<td><img border="0" style="width:100px; height:150px;" src="<c:url value="/image/" />${book.imageUrl}" />
			<td>${book.title}</td>
			<td>${book.author}</td>
			<td>${book.category}</td>
			<td>${book.publisher}</td>
			<td>${book.price}</td>
			<td><form action="/auction/add/${book.bookId}" method="post">
			<input type="hidden" name="bookId" value="${book.bookId}"/>
			<div class="col-sm-offset-5 col-sm-15">
			<button type="submit" class="btn btn-secondary" value="선택">선택</button>
			</div>
			</form></td>
		</tr>
	</c:forEach>
  </tbody>
</table>
</div>
</div>

</body>
	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</html>