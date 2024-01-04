<%@page contentType="text/html; charset=utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>경매 마감</title>

<style>
	  *{
	  	font-family: 'NanumSquareNeoBold';
	  }
</style>

</head>
<body>

 	<!-- navigation bar -->
	<%@include file="/WEB-INF/jsp/navbar.jsp"%>

<div align = "center">
	<c:if test="${auction.title != null}">
		<text style="font-size:30px; text-align: center; color:#E02020;"> "${auction.title}" 경매가 마감되었습니다.</text>
	</c:if>
	<c:if test="${auction.title == null}">
		<text style="font-size:30px; text-align: center; color:#E02020;">  경매가 마감되었습니다.</text>
	</c:if>
	<br><br><br>
	<h5>입찰자 정보</h5><br>
	<c:if test="${auction.currPrice ne auction.startPrice}" >
		<table class="bid">
		 <tr>
			<td class="bid_td">낙찰자 ID&nbsp;&nbsp;&nbsp;</td>
			
			<td class="bid_td2">
			<input type="text" class="form-control col-sm-10" value="${auction.userId }" name=publisher disabled/> </td> 
		</tr> 
		<tr>	
			<td class="bid_td">경매 아이템&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td class="bid_td2">
			<input type="text" class="form-control col-sm-10" value="${auction.title } " name=publisher disabled/></td>
		</tr>
		<tr>
			<td class="bid_td">낙찰 가격</td>
			<td class="bid_td2">
			<input type="text" class="form-control col-sm-10" value="${auction.currPrice } " name=publisher disabled/></td>
		</tr>
		</table>
		<br><br>
		<text style="font-size:15px; text-align: center; color:#E02020;"> 해당 회원은 장바구니 목록에서 경매가로 책을 구매할 수 있습니다. </text>
		<br><br>
	</c:if>
	<c:if test="${auction.currPrice eq auction.startPrice}" >
	<h3>입찰자가 아무도 없습니다.</h3>
	</c:if>
	
 	<input class="btn btn-outline-secondary" type="button" value = "경매 목록으로 돌아가기" onclick="location.href='<c:url value='/auction/list'/>'">
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</div>
</body>

	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</html>