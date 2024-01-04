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
  	<h2>&nbsp;&nbsp;&nbsp;&nbsp;중고책 전체목록&nbsp;&nbsp;</h2>
  	<%if (session.getAttribute("userId") != null) { %> 
  	 <form method="get" action="/usedBook/add">
    	<div class="form-group">        
        	<button type="submit" class="btn btn-outline-secondary btn-sm">추가</button>&nbsp;&nbsp;
      	</div>
     </form>
    
      <div class="form-group">
     	<button type="button" class="btn btn-outline-secondary btn-sm"
        onclick="location.href='<c:url value='/usedBook/userUsedBookList'/>'">내가 올린 책</button>
      </div>
       <%} %>
    </div>
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
      	<%if (session.getAttribute("userId") != null) { %>  
        <td><a href="#none" onclick="location.href='<c:url value='/usedBook/info/${ub.usedBookId}'/>'">
        ${ub.title}</a></td>
        <%} else {%>
        <td><a href="#none" onclick="location.href='<c:url value='/account/login'/>'
        alert('로그인 한 사용자만 열람할 수 있습니다.\n로그인창으로 이동하시겠습니까?');">
        ${ub.title}</a></td>
        <%} %>
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
</body>

	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</html>