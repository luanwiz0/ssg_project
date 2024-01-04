<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <title>중고책 전체목록</title>
  <meta charset="utf-8">
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

<div class="container">
<div class="row">
  <h2>내가 등록한 중고책 목록</h2>
    
    <br>      
  <table class="table table-hover">
    <thead>
      <tr>
        <th>책 이름</th>
        <th>저자</th>
        <th>출판사</th>
        <th>카테고리</th>
        <th>책 상태</th>
        <th>원가</th>
        <th>중고 판매가</th>
        <th>판매 상태</th>
      </tr>
    </thead>
      <c:forEach var="ub" items="${usedBookList}">
      <tbody>
      <tr>
      	<input type="hidden" name="usedBookId" value="${usedBook.usedBookId}"/>
        <td><a href="#none" onclick="location.href='<c:url value='/usedBook/info/${ub.usedBookId}'/>'">
        ${ub.title}</a></td>
        <td>${ub.author}</td>
        <td>${ub.publisher}</td>
        <td>${ub.category}
        <td>${ub.bookStatus}</td>
        <td>${ub.price}</td>
        <td>${ub.discountPrice}</td>
        <td>${ub.sellStatus}</td>
      </tr>
    </tbody>
    </c:forEach>
  </table>
</div>
</div>
</body>

	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</html>