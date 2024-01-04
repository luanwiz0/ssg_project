<!-- 1. 관리자  
	 2. 로그인 한 사용자 
	 3. 로그인 하지않은 사용자 -->

<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	  h3{
	  	font-family: 'NanumSquareNeoBold';
	  }
</style>
</head>
<body>
 	<!-- navigation bar -->
	<%@include file="/WEB-INF/jsp/navbar.jsp"%>
<h2 align="center">공동구매</h2><br>
<hr><h3 align="center">진행 중</h3><hr><br>
<div style=" text-align: center;">
<!-- 1. 관리자 일때 (userId == "admin") -->
<%if (session.getAttribute("userId") != null) {
	if (session.getAttribute("userId").equals("admin")) { %>	
	<table class="table table-hover" align="center" style="width: 1200px; text-align: center;">
		<th>&nbsp;</th>
		<th>책 제목</th>
		<th>저자</th>
		<th>가격</th>
		<th>달성률</th>
		<th>마감기한</th>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<c:forEach items="${ongoing_groupPurchaseList}" var="group">
			<tr>
				<td><img border="0" style="width:100px; height:150px;" src="<c:url value="/image/" />${group.imageUrl}" /></td>
				<td><br><br><br>${group.title}</td>
				<td><br><br><br>${group.author}</td>
				<td><br><br><p style="text-decoration: line-through;">${group.bookPrice}원</p>
				${group.price}원 (${group.discountRate}%&darr;)</td>
				<td><br><br><br>${group.customerNum} / ${group.maxCustomNum}</td>
				<fmt:formatDate var="deadline" value="${group.deadline}" pattern="yyyy-MM-dd"/>
	  			<td><br><br><br>${deadline}</td>
	  			<!-- 수정 -->
				<td><form action="/groupPurchase/update" method="post">
				<input type="hidden" name="groupId" value="${group.groupId}"/>
				<input type="hidden" name="price" value="${group.price}"/>
				<br><br><br><div class="form-group">
				<button type="submit" class="btn btn-outline-secondary btn-sm">수정</button></td></form></div>
				<!-- 삭제 -->
				<c:choose>
					<c:when test="${group.customerNum eq 0}">
						<form action="/groupPurchase/delete" method="post">
						<input type="hidden" name="groupId" value="${group.groupId}"/>
						<td><br><br><br>
						<div class="form-group"><button type="submit" class="btn btn-outline-secondary btn-sm" onclick="alert('삭제 하시겠습니까?');">삭제</button></td></form></div>
					</c:when>
				
					<c:when test="${group.customerNum ne 0}">
						<td><br><br><br><div class="form-group"><button type="submit" class="btn btn-outline-secondary btn-sm" onclick="location.href='<c:url value='/groupPurchase/existUser'/>'">삭제</button></td></div>
					</c:when>
				</c:choose>
				
				<!-- 신청한 회원 조회 -->
				<form action="/groupPurchase/memberList" method="post">
				<input type="hidden" name="groupId" value="${group.groupId}"/>
				<td><br><br><br>
				<div class="form-group"><button type="submit" class="btn btn-outline-secondary btn-sm">회원목록</button></td></form></div>
			</tr>
		</c:forEach>
	</table>
	<hr style="width : 70%;">
	<div class="form-group">
	<button type="submit" class="btn btn-outline-secondary btn-sm" onclick="location.href='/groupPurchase/add'" style="border:none; width: 60pt;height:25pt; background-color:dimgray; color: white;">등록</button></td></form></div>
	<%	} else { %>
	<!-- 2. 로그인 한 사용자 일때 -->
	<table class="table table-hover" align="center" style="width: 1200px; text-align: center;">
		<th>&nbsp;</th>
		<th>책 제목</th>
		<th>저자</th>
		<th>가격</th>
		<th>달성률</th>
		<th>마감기한</th>
		<th>&nbsp;</th>
		<c:forEach items="${ongoing_groupPurchaseList}" var="group">
			<tr>
				<td><img border="0" style="width:100px; height:150px;" src="<c:url value="/image/" />${group.imageUrl}" /></td>
				<td><br><br><br>${group.title}</td>
				<td><br><br><br>${group.author}</td>
				<td><br><br><p style="text-decoration: line-through;">${group.bookPrice}원</p>
				${group.price}원 (${group.discountRate}%&darr;)</td>
				<td><br><br><br>${group.customerNum} / ${group.maxCustomNum}</td>
				<fmt:formatDate var="deadline" value="${group.deadline}" pattern="yyyy-MM-dd"/>
	  			<td><br><br><br>${deadline}</td>
	  			<c:if test="${group.apply eq '1'}">
	  			<td><br><br><br><form action="/cart/add" method="post">
	  			<input type="hidden" name="groupId" value="${group.groupId}"/>
				<input type="hidden" name="bookId" value="${group.bookId}"/>
				<input type="hidden" name="quantity" value="1"/>
				<input type="hidden" name="price" value="${group.price}"/>
				<input type="hidden" name="kind" value="공동구매"/>
				<div class="form-group"><button type="submit" class="btn btn-outline-secondary btn-sm" onclick="alert('신청 하시겠습니까?');">신청</button></td></form></div>
	  			</c:if>
	  			<c:if test="${group.apply eq '0'}">
	  			<td><br><br><br>
	  			<button type="submit" class="btn btn-outline-secondary btn-sm"
				onclick="alert('장바구니에서 삭제 하시겠습니까?'); location.href='/cart/delete?cartItemId=${cartId}'">취소</button>
	  			<!--<form action="/groupPurchase/list_cancel" method="post">
				<input type="hidden" name="groupId" value="${group.groupId}"/>
				<div class="form-group"><button type="submit" class="btn btn-outline-secondary btn-sm" onclick="alert('취소 하시겠습니까?');">취소</button></td></form></div>
	  			  --></c:if>
	  			<c:if test="${group.apply eq '2'}">
	  			<td><br><br><br>신청완료
	  			</c:if>
			</tr>
		</c:forEach>
	</table>
	<br>
<%	} } else { %>
<!-- 3. 로그인 하지않은 사용자 일때 -->
<table class="table table-hover" align="center" style="width: 1200px; text-align: center;">
	<th>&nbsp;</th>
	<th>책 제목</th>
	<th>저자</th>
	<th>가격</th>
	<th>달성률</th>
	<th>마감기한</th>
	<c:forEach items="${ongoing_groupPurchaseList}" var="group">
		<tr>
			<td><img border="0" style="width:100px; height:150px;" src="<c:url value="/image/" />${group.imageUrl}" /></td>
			<td><br><br><br>${group.title}</td>
			<td><br><br><br>${group.author}</td>
			<td><br><br><p style="text-decoration: line-through;">${group.bookPrice}원</p>
				${group.price}원 (${group.discountRate}%&darr;)</td>
			<td><br><br><br>${group.customerNum} / ${group.maxCustomNum}</td>
			<fmt:formatDate var="deadline" value="${group.deadline}" pattern="yyyy-MM-dd"/>
	  		<td><br><br><br>${deadline}</td>
		</tr>
	</c:forEach>
</table>
<br>
<%	} %>
<br><br><br>
<hr><h3 align="center">마감</h3><hr><br>
<table class="table table-hover" align="center" style="width: 1000px; text-align: center;">
	<th>&nbsp;</th>
	<th>책 제목</th>
	<th>저자</th>
	<th>가격</th>
	<th>달성률</th>
	<th>마감기한</th>
	<th>&nbsp;</th>
	<c:forEach items="${end_groupPurchaseList}" var="group">
		<tr>
		<td>
		<img border="0" style="width:100px; height:150px;" src="<c:url value="/image/" />${group.imageUrl}" /></td>
			<td><br><br><br>${group.title}</td>
			<td><br><br><br>${group.author}</td>
			<td><br><br><p style="text-decoration: line-through;">${group.bookPrice}원</p>
				${group.price}원 (${group.discountRate}%&darr;)</td>
			<td><br><br><br>${group.customerNum} / ${group.maxCustomNum}</td>
			<fmt:formatDate var="deadline" value="${group.deadline}" pattern="yyyy-MM-dd"/>
	  		<td><br><br><br>${deadline}</td>
	  		<td><br><br><br>마감</td>
		</tr>
	</c:forEach>
</table>
<br>
</div>
<div style=" text-align: center;">
<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>