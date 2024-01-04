<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
	
<!-- 버튼 위치 조절 -->


<h2 align="center">공동구매 내역</h2><br>
<table class="table table-bordered" align="center" style="width: 1000px; text-align: center;">
	<th></th>
	<th>책 제목</th>
	<th>작가</th>
	<th>가격</th>
	<th>달성률</th>
	<th>마감기한</th>
 <tbody>
	<c:forEach items="${userOrderList}" var="userOrder">
		<tr>
			<td><img border="0" style="width:100px; height:150px;" src="<c:url value="/image/" />${userOrder.imageUrl}" /></td>
			<td><br><br><br>${userOrder.title}</td>
			<td><br><br><br>${userOrder.author}</td>
			<td><br><br><p style="text-decoration: line-through;">${userOrder.bookPrice}원</p>
			${userOrder.price}원 (${userOrder.discountRate}%&darr;)</td>
			<td><br><br><br>${userOrder.customerNum} / ${userOrder.maxCustomNum}</td>
			<fmt:formatDate var="deadline" value="${userOrder.deadline}" pattern="yyyy-MM-dd"/>
	  		<td><br><br><br>${deadline}</td>
		</tr>
	</c:forEach>
</tbody>
</table><br>
<div align="center">
<input class="btn btn-outline-secondary btn-sm" style="width: 130pt;height:25pt; background-color:dimgray; color: white;"type="button" value = "회원정보로 돌아가기" onclick="location.href='<c:url value='/account/userInfo'/>'">
<div><br></div>
</div>

<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>