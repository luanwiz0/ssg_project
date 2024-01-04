<%@page contentType="text/html; charset=utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id = "toDay" class = "java.util.Date"/>
<!DOCTYPE html>
<html>
<head>
  <title>경매 상세정보</title>
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
	  h2{
	  	font-family: 'NanumSquareNeoBold';
	  }
</style>

</head>

<body>

 	<!-- navigation bar -->
	<%@include file="/WEB-INF/jsp/navbar.jsp"%>
<div align="center">
<h2>경매 상세 페이지</h2>
<br>
<img border="0" style="width:200px; height:250px;" src="<c:url value="/image/" />${auction.imageUrl}" /><br>
<div class="container d-flex justify-content-center align-items-center">
  <div class="form-group col row justify-content-center h-100 align-items-center col-sm-4">
<div class="container row justify-content-center h-250 align-items-center">

<!-- D-day -->
<fmt:parseNumber value="${toDay.time/(1000*60*60*24)}" integerOnly="true" var="nowDate"/> 
<fmt:parseNumber value="${auction.deadLine.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
<c:choose> 
				<c:when test = "${strDate-nowDate < 0 and item.status == 2}">
				<text style="font-size:30px; text-align: center; color:#E02020;"> <br>경매 마감 </text>
				</c:when>
				<c:when test = "${strDate-nowDate == 0 or strDate-nowDate < 0 and item.status != 2 }">
					 <c:if test= "${userid == 'admin'}" >
						  	<text style="font-size:30px; text-align: center; color:#E02020;"> <br>경매 마감(:마감 필요) </text>
					</c:if>
					 <c:if test= "${userid != 'admin'}" >
						  	<text style="font-size:30px; text-align: center; color:#E02020;"> <br>경매 마감 </text>
					</c:if>
				</c:when>
				<c:when test = "${strDate-nowDate > 0}">
	            <text style="font-size:30px; text-align: center; color:#E02020;"> <br>D - ${strDate-nowDate } </text>
	            </c:when>
	    
	         </c:choose>

<table class="table table-hover" align="center">
    <tbody >
    <tr>
        <th class="col-sm-5">책 이름</th>
        <td class="bid_td2">${auction.title}</td>
      </tr>
      <tr>
        <th class="col-sm-5">저자</th>
        <td class="bid_td2">${auction.author}</td>
      </tr>
      <tr>
        <th class="col-sm-5">출판사</th>
        <td class="bid_td2">${auction.publisher}</td>
      </tr>
      <tr>
        <th class="col-sm-5">마감기한</th>
        <fmt:formatDate value="${auction.deadLine}" pattern="yyyy-MM-dd EEE" var="formattedDate" />
		<td class="bid_td2">${formattedDate}</td>
      </tr>
      <tr>
        <th class="col-sm-5">시작가</th>
        <td class="bid_td2">${auction.startPrice}</td>
      </tr>
      <tr>
        <th class="col-sm-5">최근입찰가</th>
        <td class="bid_td2">${auction.currPrice}</td>
      </tr>
    </tbody>
  </table>

<c:choose>
<c:when test = "${strDate-nowDate > 0}">
	<c:if test="${islogin == 1}"> 
	<form method="get" action="/auction/apply/${auctionId}"> 
	<button class="btn btn-outline-secondary btn-sm" type="submit">입찰</button><br><br>
	</form>
	</c:if>
	<c:if test="${islogin == 0}"> 
	<form method="get" action="/account/login"> 
	<button class="btn btn-outline-secondary btn-sm" onclick="alert('로그인 한 사용자만 열람할 수 있습니다.\n로그인창으로 이동하시겠습니까?');" type="submit">입찰</button><br><br>
	</form>
	</c:if>
	
</c:when>
<c:when test = "${strDate-nowDate < 0 or strDate-nowDate == 0 and userid == 'admin'}">
	<form method="get" action="/auction/finishAuctioBid/${auctionId}">
		<button class="btn btn-outline-secondary btn-sm" type="submit">마감</button><br><br>
	</form>
</c:when>
</c:choose>

<form  method="post" action="/auction/list">
	 <button class="btn btn-outline-secondary btn-sm" type="submit">경매 리스트 보기</button>
 </form>
 </div>
 <form method="get" action="/auction/update/${auctionId}">
	<c:if test="${userid == 'admin'}"> 
		<button class="btn btn-outline-secondary btn-sm" type="submit">수정</button><br><br>
	</c:if>
</form>

 <form id="deleteForm" method="get" action="/auction/delete/${auctionId}">
    <c:if test="${userid == 'admin'}"> 
        <button id="deleteButton" class="btn btn-outline-secondary btn-sm" type="submit">삭제</button><br><br>
    </c:if>
</form>
</div>
</div>

</div>
<script>
    document.getElementById('deleteButton').addEventListener('click', function(event) {
        event.preventDefault(); // 폼 제출을 막음
        if (confirm('삭제 하시겠습니까?')) {
            document.getElementById('deleteForm').submit(); // 폼 제출
        }
        
    });
</script>
</body>
<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
	
</html>