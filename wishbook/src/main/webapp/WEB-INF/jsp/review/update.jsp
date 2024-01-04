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
<h2>리뷰 수정</h2>
<form method="post" action="/review/update/${review.reviewId}">
    <textarea name="content" class="form-control col-sm-5" rows="5">${review.content}</textarea>
    <div><br></div>
    <div class="col-sm-offset-2 col-sm-10">
        	<button type="submit" class="btn btn-secondary">수정하기</button>
      	</div>
      	<div><br><br><br><br><br><br><br><br><br><br><br><br><br></div>
</form>
</div>
</body>

	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
	
</html>