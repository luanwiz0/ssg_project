<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id = "toDay" class = "java.util.Date"/>
<!DOCTYPE html>
<html>
<head>
<title>경매 목록보기</title>
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
	  	text-align: center;
	  	}
  </style>
  
</head>
<body>

 	<!-- navigation bar -->
	<%@include file="/WEB-INF/jsp/navbar.jsp"%>
	
<h2 style="font-family: 'NanumSquareNeoBold';">전체 경매 목록</h2>
<%if (session.getAttribute("userId") != null) {
   if (session.getAttribute("userId").equals("admin")) { %>   
  	<form method="get" action="/auction/add">
  	<div align="center">
		<button  class="btn btn-outline-secondary btn-sm" type="submit" >등록하기</button>
		</div>
	</form>
<%   } } %>

<div align="center">

  <div class="list">
    <br><h3><p class="div1" ></p><br></h3>
    <fmt:parseNumber value="${toDay.time/(1000*60*60*24)}" integerOnly="true" var="nowDate"/>    
	<table class="list">
		<c:set var="i" value="0"/> <!-- 줄바꿈을 위한 장치 1 -->
		<c:forEach var="item" items="${list}">
		
			<fmt:parseNumber value="${item.deadLine.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
			
			<c:if test= "${i % 5 == 0 }" > <!-- 줄바꿈을 위한 장치2  -->
			<tr> 
			</c:if>
			
			<!-- td에 링크 걸기. -->
			<td class="list_img" onClick="location.href='<c:url value='/auction/info/${item.auctionId}'/>'" style="cursor:pointer;">
			<img border="0" style="width:120px; height:170px;" src="<c:url value="/image/" />${item.imageUrl}" />	<br> 
			
			<p>
	         
	         <c:choose> 
                <c:when test = "${strDate-nowDate <= 0}">
               		 <c:if test= "${item.status == 2}" >
                              <text style="font-size:12px; text-align: center; color:#E02020;"> 경매 마감 </text>
                    </c:if>
                     <c:if test= "${userid eq 'admin' and item.status != 2}" >
                              <text style="font-size:12px; text-align: center; color:#E02020;"> 경매 마감(:마감 필요) </text>
                    </c:if>
                      <c:if test= "${userid ne 'admin' and item.status != 2}" >
                              <text style="font-size:12px; text-align: center; color:#E02020;"> 경매 마감 </text>
                    </c:if>
                   
                </c:when>
                <c:when test = "${strDate-nowDate > 0}">
                <text style="font-size:12px; text-align: center; color:#E02020;"> D - ${strDate-nowDate } </text>
                </c:when>

             </c:choose>
	         
	            <br>
	            <text style="font-size:15px; align: center;  font-weight:700;">${item.title }</text><br>
	            <text style="font-size:12px; text-align: center;">${item.author } | ${item.publisher}</text><br>
	            <text style="font-size:15px; text-align: center; color:#E02020;">${item.currPrice } 원</text> </p>
	        </td>
	        
	        <c:if test= "${i % 5 == 4 }" > <!-- 줄바꿈을 위한 장치3  -->
			</tr> 
			</c:if>
			<c:set var ="i" value="${i+1 }" /> <!-- 줄바꿈을 위한 장치 4 -->
			
		</c:forEach>
    </table>
</div>
</div>
</body>

	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%> 
</html>