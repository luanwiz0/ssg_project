<%@page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
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
<div class="container d-flex justify-content-center align-items-center">
  <div class="form-group col row justify-content-center h-150 align-items-center col-sm-4">
<div align="center">
	<text style="font-size:30px; text-align: center; color:#E02020;"> 입찰이 완료되었습니다.</text><br><br><br>
	<h4>입찰자 정보</h4><br><br>
	
	<table class="table table-hover" align="center">
	<tr>
		<th class="col-sm-5">입찰자 ID </th>
		<td class="bid_td2">${auction.userId} </td> </tr> 
	<tr>	
		<th class="col-sm-5">입찰 책 </th>
		<td class="bid_td2">${auction.title} </td>
	</tr>
	<tr>
		<th class="col-sm-5">입찰 가격 </th>
		<td class="bid_td2">${auction.currPrice} </td>
	</tr>
	</table>
	
	 <form  method="post" action="/auction/completeAuctionBid/${auctionId}">
	 <button class="btn btn-outline-secondary" type="submit">해당 경매로 이동</button>
	 </form>
</div>
</div>
</div>
</div>
<br><br><br><br><br><br>

</body>

	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</html>