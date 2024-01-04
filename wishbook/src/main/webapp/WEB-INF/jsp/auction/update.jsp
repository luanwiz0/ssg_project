<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
  <title>경매 수정하기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
  <script>
    // 내일 이후의 날짜를 비활성화하는 함수
    function setMinDate() {
        var today = new Date();
        today.setDate(today.getDate() + 1); // 현재 날짜에 1을 더하여 내일로 설정
        var year = today.getFullYear();
        var month = String(today.getMonth() + 1).padStart(2, '0');
        var day = String(today.getDate()).padStart(2, '0');
        var minDate = year + '-' + month + '-' + day;
        document.getElementById("deadLine").min = minDate;
    }
</script>
 <style>
	  *{
	  	font-family: 'NanumSquareNeoBold';
	  }
</style>

</head>
<body onload="setMinDate()">

 	<!-- navigation bar -->
	<%@include file="/WEB-INF/jsp/navbar.jsp"%>
	
<div class="container">
  <h2>경매 상품 수정</h2><br>
  
  <img border="0" style="width:240px; height:300px;" src="<c:url value="${auction.imageUrl}"/>" />
  
  <div class="form-horizontal">
    
    <div class="form-group form-horizontal">
      <label class="control-label col-sm-5" for="author">제목:</label>
      <div class="col-sm-3">      
      	 <input type="hidden" value="${book.title}" name="title" />
         <input type="text" class="form-control" value="${auction.title}" name="title" disabled/>
      </div>
    </div>
    
    <div class="form-group form-horizontal">
      <label class="control-label col-sm-5" for="author">작가:</label>
      <div class="col-sm-3">      
      	 <input type="hidden" value="${book.author}" name="author" />
         <input type="text" class="form-control" value="${auction.author}" name="author" disabled/>
      </div>
    </div>
    
    <form method="post">
    
     <div class="form-group">
      <label class="control-label col-sm-5" for="publisher">출판사:</label>
      <div class="col-sm-3">     
      	<input type="hidden" value="${book.publisher}" name="publisher" /> 
        <input type="text" class="form-control" value="${auction.publisher}" name=publisher disabled/>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-5" for="startPrice">시작가:</label>
      <div class="col-sm-3">      
        <input type="text" class="form-control number" value="${auction.startPrice}" class="form-control" name=startPrice disabled/>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-5" for="deadLine">마감기한:</label>
      <div class="col-sm-3">      
        <input type="date" class="form-control" id=deadLine name=deadLine required/>
      </div>
    </div>
    
 
    <div class="form-inline justify-content-center">
	    <div class="form-group">        
	      <div class="col-sm-offset-5 col-sm-15">
	      	<button type="submit" class="btn btn-secondary">수정</button>
	      </div>
	    </div>
	     &nbsp;&nbsp;
	     <div class="form-group">        
	      <div class="col-sm-offset-5 col-sm-15">
			<button type="button" class="btn btn-secondary"
			onclick="location.href='<c:url value='/auction/list'/>'">취소</button>
	      </div>
	      </div>
	      </div>
	    
	 </form>
    </div>
	    
	
</div>      

<br><br>

</body>

	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
	
</html>