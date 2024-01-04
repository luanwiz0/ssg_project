<%@page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style>
	button {
		background-color:lightgray; 
		color:black; 
		border:none;
		border-radius: 5px;
	}
	table {
		width: 300px;
		height: 400px;
		border: 1px solid gray;
	}
	  *{
	  	font-family: 'NanumSquareNeoBold';
	  }

</style>
</head>
<body class="p-3 m-0 border-0 bd-example m-0 border-0">

 	<!-- navigation bar -->
	<%@include file="/WEB-INF/jsp/navbar.jsp"%>
	
<!-- 버튼 위치 조절 -->
<div style="position: absolute; left: 20%; top: 30%;">
<button class="btn btn-outline-secondary btn-sm" style="font-size: small" type="button" style="font-size:18px; background-color:lightgray; color:black; border:none; width: 115pt;height:38pt;" onclick="location.href='/account/userInfo'">&nbsp;&nbsp;&nbsp;&nbsp;회원정보&nbsp;&nbsp;&nbsp;&nbsp;</button><br><br>
<button class="btn btn-outline-secondary btn-sm" style="font-size: small" type="button" style="font-size:18px; background-color:lightgray; color:black; border:none; width: 115pt;height:38pt;" onclick="location.href='/book/bookOrderList'">도서 구매목록</button><br><br>
<button class="btn btn-outline-secondary btn-sm" style="font-size: small" type="button" style="font-size:18px; background-color:lightgray; color:black; border:none; width: 115pt;height:38pt;" onclick="location.href='/usedBook/orderList'">중고거래 내역</button><br><br>
<button class="btn btn-outline-secondary btn-sm" style="font-size: small" type="button" style="font-size:18px; background-color:lightgray; color:black; border:none; width: 115pt;height:38pt;" onclick="location.href='/groupPurchase/userGroupPurchaseList'">공동구매 내역</button><br><br>
<button class="btn btn-outline-secondary btn-sm" style="font-size: small" type="button" style="font-size:18px; background-color:lightgray; color:black; border:none; width: 115pt;height:38pt;" onclick="location.href='/cart/list'">&nbsp;&nbsp;&nbsp;&nbsp;장바구니&nbsp;&nbsp;&nbsp;&nbsp;</button><br><br>
<button class="btn btn-outline-secondary btn-sm" style="font-size: small" type="button" style="font-size:18px; background-color:lightgray; color:black; border:none; width: 115pt;height:38pt;" onclick="location.href='/order/list'">전체 구매목록</button>
</div>
 
<h2 align="center">회원정보</h2><br>	
<table class="table table-bordered"  align="center"style="width: 500px; height: 400px; text-align: center;">

	<tr scope="col">
	  <td class="col-sm-1">ID</td>
	  <td class="col-sm-1">${account.userId}</td>
	</tr>
	<tr scope="col">
	  <td class="col-sm-1">회원등급</td>
	  <td class="col-sm-1">
	  ${gradeName} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <button type="submit" onclick="location.href='/account/grade'" style="background-color:dimgray; color: white; border-radius: 5px;">등급 기준</button></td>
	</tr>
	<tr scope="col">
	  <td class="col-sm-1">포인트</td>
	  <td class="col-sm-1">${account.point}</td>
	</tr>
	<tr scope="col">
	  <td class="col-sm-1">누적금액</td>
	  <td class="col-sm-1">${account.purchaseAmount}</td>
	</tr>
	<form action="/account/userInfo" method="post">
	<tr scope="col">
	  <td class="col-sm-1">비밀번호</td>
	  <td class="col-sm-1"><input type="password" name="password" size="20"  placeholder="비밀번호" required="required"/></td>
	</tr>
	<tr scope="col">
	  <td class="col-sm-1">비밀번호 확인</td>
	  <td class="col-sm-1"><input type="password" name="confirmPassword" size="20"  placeholder="비밀번호 확인" required="required"/></td>
	</tr>
	<tr scope="col">
	  <td class="col-sm-1">이름</td>
	  <td class="col-sm-1"><input type="text" value="${account.name}" name="name" size="20"/></td>
	</tr>
	<tr scope="col">
	  <td class="col-sm-1">이메일</td>
	  <td class="col-sm-1"><input type="email" value="${account.email}" name="email" size="20"/></td>
	</tr>
	<tr scope="col">
	  <td class="col-sm-1">주소</td>
	  <td class="col-sm-1"><input type="text" value="${account.address}" name="address" size="20"/></td>
	</tr>
	<tr scope="col">
	  <td class="col-sm-1">연락처</td>
	  <td class="col-sm-1"><input type="text" value="${account.phone}" name="phone" size="20"/></td>
	</tr>	
	<tr scope="col">
	  <td class="col-sm-1">선호 장르</td>
	  <td class="col-sm-1"><select id="favoriteCategory" name="favoriteCategory" style="width: 225px">
		  <option value="문학" ${account.favoriteCategory == '문학' ? 'selected="selected"' : '' } >문학</option>
		  <option value="비문학" ${account.favoriteCategory == '비문학' ? 'selected="selected"' : '' }>비문학</option>
		  <option value="언어" ${account.favoriteCategory == '언어' ? 'selected="selected"' : '' }>언어</option>
		  <option value="예술" ${account.favoriteCategory == '예술' ? 'selected="selected"' : '' }>예술</option>
		  <option value="종교" ${account.favoriteCategory == '종교' ? 'selected="selected"' : '' }>종교</option>
		  <option value="철학" ${account.favoriteCategory == '철학' ? 'selected="selected"' : '' }>철학</option>
	  </select></td>
	</tr>
</table>
<div align="center">
<input type="hidden" name="userId" value="${account.userId}"/>
<button class="btn-sm" type="submit" align="center" style="width: 60pt;height:25pt; background-color:dimgray; color: white;">수정</button>
</div>
</form><br><br>
<div style=" text-align: center;">
<!-- footer bar -->
<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>