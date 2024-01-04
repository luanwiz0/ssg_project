<%@page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

<form action="/account/login.do" method="post">
<h2 align="center">로그인</h2>
<section class="container mt-3" style="max-width: 560px;">
			<form action="/account/login.do" method="post">
				<div class="form-group">
					<label for="userId">아이디</label> 
					<!-- 수정 : required="required"추가 -->
					<input type="text" name="userId" class="form-control col-sm-10" placeholder="아이디" required="required">
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label> 
					<!-- 수정 : required="required"추가 -->
					<input type="password" name="password" class="form-control col-sm-10" placeholder="비밀번호" required="required">
				</div>
				<div class="form-group">
				<button type="submit" class="btn btn-secondary">로그인</button> 
						<a href="<c:url value='/account/register' />" class="btn btn-secondary">회원가입 </a>
				</div>
			</form>
		</section>
</form>
<div style=" text-align: center;">
	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>