<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
  <h2>중고책 수정하기</h2><hr><br>
  
  <form class="form-horizontal" method="post" action="/usedBook/update.do">
  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="hidden" name="usedBookId" value="${usedBook.usedBookId}"/>
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">책 이름:</label>
      <div class="col-sm-5">
        <input type="text" class="form-control" id="title" name="title" value="${usedBook.title}" disabled>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="author">저자:</label>
      <div class="col-sm-5">      
         <input type="text" class="form-control" value="${usedBook.author}" name="author" disabled/>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="publisher">출판사:</label>
      <div class="col-sm-5">      
        <input type="text" class="form-control" value="${usedBook.publisher}" name=publisher disabled/>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="bookStatus">책의 상태:</label>
      <div class="radio">
          <label><input type="radio" id = "bookStatus" name="bookStatus" value="상" ${usedBook.bookStatus == '상' ? 'checked="checked"' : '' }>상</label>
          <label><input type="radio" id = "bookStatus" name="bookStatus" value="중" ${usedBook.bookStatus == '중' ? 'checked="checked"' : '' }>중</label>
          <label><input type="radio" id = "bookStatus" name="bookStatus" value="하" ${usedBook.bookStatus == '하' ? 'checked="checked"' : '' }>하</label>
        </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="price">원가:</label>
      <div class="col-sm-5">     
       <input type="text" class="form-control" value="${usedBook.price}" name=price disabled/>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="discountPrice">희망 판매가격:</label>
      <div class="col-sm-5">          
        <input type="text" class="form-control" id="discountPrice" name="discountPrice">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="sellStatus">판매상태:</label>
     	<div class="radio">
          <label><input type="radio" name="sellStatus" value="판매중" ${usedBook.sellStatus == '판매중' ? 'checked="checked"' : '' }>판매중</label>
          <label><input type="radio" name="sellStatus" value="거래완료" ${usedBook.sellStatus == '거래완료' ? 'checked="checked"' : '' }>거래완료</label>
        </div>
    </div>
	
	    <div class="form-inline">
		    <div class="form-group">        
		      <div class="col-sm-offset-2 col-sm-10">
		      	<input type="hidden" name="bookId" value="${usedBook.bookId}"/>
		      	<input type="hidden" name="usedBookId" value="${usedBook.usedBookId}"/>
		        <button name="save" type="submit" class="btn btn-outline-secondary btn-sm">저장하기</button>
		      </div>
		    </div>
	    	<div class="form-group">        
		      <div class="col-sm-offset-2 col-sm-10">
		        <button type="button" class="btn btn-outline-secondary btn-sm" 
		        onclick="location.href='<c:url value='/usedBook/list'/>'">돌아가기</button>
		      </div>
		     </div>
		 </div>
	  
  </form>
</div>


</body>

	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
	
</html>