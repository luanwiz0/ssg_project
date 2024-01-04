<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html> 
<head>
  <title>중고책 등록하기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
  
  <script>
	function getselect() {
		//카테고리 value 값 가져오기
		var bookCategory  = document.getElementById("category");
		var category = (bookCategory.options[category.selectedIndex].value);
	}
</script>
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
  <h2>책 등록하기</h2><hr><br>
  <form class="form-horizontal" action="/book/add" enctype="multipart/form-data" method="post">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="hidden" name="bookId" value="${book.bookId}"/>
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">책 이름:</label>
      <div class="col-sm-5">
        <input type="text" class="form-control" id="title" name="title">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="author">저자:</label>
      <div class="col-sm-5">      
         <input type="text" class="form-control" name="author"/>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="publisher">출판사:</label>
      <div class="col-sm-5">      
        <input type="text" class="form-control" name="publisher"/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="price">가격:</label>
      <div class="col-sm-5">      
        <input type="number" class="form-control" name="price"/>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="category">카테고리:</label>
      <div class="checkbox">
          <label><input type="radio" name="category" value="문학"> 문학</label>
          <label><input type="radio" name="category" value="비문학"> 비문학</label>
          <label><input type="radio" name="category" value="철학"> 철학</label>
          <label><input type="radio" name="category" value="종교"> 종교</label>
          <label><input type="radio" name="category" value="언어"> 언어</label>
          <label><input type="radio" name="category" value="예술"> 예술</label>
        </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="description">책 설명:</label>
      <div class="col-sm-5">      
        <input type="text" class="form-control" name="description"/>
      </div>
    </div> <div class="form-group">
      <label class="control-label col-sm-2" for="imageUrl">이미지:</label>
      <div class="col-sm-5">      
        <input type="file" class="form-control" name="imageUrl" required/>
      </div>
    </div>
   		<div class="col-sm-offset-2 col-sm-10">
        	<button type="submit" class="btn btn-secondary">등록하기</button>
      	</div>
      	
    </form>
    </div>
</body>

	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</html>