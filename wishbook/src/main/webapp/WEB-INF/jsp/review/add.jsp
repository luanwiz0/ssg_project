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
	  h2{
	  	font-family: 'NanumSquareNeoBold';
	  }
</style>
<title>wishBook</title>
</head>
<body>
 	<!-- navigation bar -->
	<%@include file="/WEB-INF/jsp/navbar.jsp"%>
	<div align="center">
<h2>리뷰 작성</h2>
<form method="post" action="/review/add">
    <input type="hidden" name="bookId" value="${r.bookId}" />
    <textarea name="content" class="form-control col-sm-5" rows="5"></textarea>
    <div><br></div>
    <!-- review 객체의 필드들을 추가 -->
    <input type="hidden" name="reviewId" value="${r.reviewId}" />
    <input type="hidden" name="userId" value="${r.userId}" />
          	<button type="submit" class="btn btn-secondary">작성하기</button>
      	<div><br><br><br><br><br><br><br><br><br><br><br><br><br></div>
</form>
	</div>
</body>

	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
	
</html>