<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
  <title>중고책 상세정보</title>
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
	  div{
	  	align: center;
	  }
</style>

</head>

<body>

	 <!-- navigation bar -->
	<%@include file="/WEB-INF/jsp/navbar.jsp"%>
	
	<!-- 전체를 감싸는 div -->
 <div class="container ">
	<div> <!-- div 1번 -->	
	 <div style="text-align:center"><h2>중고책 상세정보</h2></div><br>
	 
	  <div> 
		  <img border="0" style="width:250px; height:300px;" src="<c:url value="/image/" />${book.imageUrl}" />
		  <br><br>
		  <input type="hidden" name="usedBookId" value="${usedBook.usedBookId}"/>
	  </div> 
	  
	  
  	<div> <!-- div 2번(버튼들을 감싸는 div) -->
	  
	  <c:choose>
	  
	  <c:when test="${bool eq 1}">
	 	
		  	<form method="get" action="/usedBook/update/${usedBookId}">
		  	<input type="hidden" name="usedBookId" value="${usedBook.usedBookId}"/>
		    	<div class="form-group">        
		      	<div class="col-sm-offset-2 col-sm-10">
		        	<button type="submit" class="btn btn-outline-secondary btn-sm" onclick="alert('수정 하시겠습니까?');">수정</button>
		      	</div>
		    	</div>
		    </form>
	    
		    <form method="get" action="/usedBook/delete/${usedBookId}">
		    	<div class="form-group">        
		      	<div class="col-sm-offset-2 col-sm-10">
		        	<button type="submit" class="btn btn-outline-secondary btn-sm" onclick="alert('삭제 하시겠습니까?');">삭제</button>
		      	</div>
		      	</div>
		    </form>
		    
	   </c:when>
	    
	  
	   <c:when test="${bool eq 0}">
	  		<%-- <br>
		     <form method="get" action="/order/payment">
		     <input type="hidden" name="imageUrl" value="${book.imageUrl}"/>
		     <input type="hidden" name="title" value="${usedBook.title}"/>
		     <input type="hidden" name="quantity" value="1"/>
		     <input type="hidden" name="price" value="${usedBook.discountPrice}"/>
		    	<div class="form-group">        
		      	<div class="col-sm-offset-2 col-sm-10">
		        	<button type="submit" class="btn btn-secondary btn-sm" onclick="alert('구매 하시겠습니까?');">구매</button>
		      	</div>
		      	</div>
		    </form>
		     --%>
		    
		    <form action="/cart/add" method="post">
			    <input type="hidden" name="bookId" value="${book.bookId}"/>
			    <input type="hidden" name="quantity" value="1"/>
			    <input type="hidden" name="price" value="${usedBook.discountPrice}"/>
			    <input type="hidden" name="kind" value="중고책" />
			    <input type="hidden" name="groupId" value="0" />
			    <input type="hidden" name="usedBookId" value="${usedBook.usedBookId}"/>
			    <div class="form-group">        
				    <div class="col-sm-offset-2 col-sm-10">
			    		<button type="submit" class="btn btn-outline-secondary btn-sm" 
			    		onclick="alert('해당 상품이 장바구니로 이동됩니다.');">구매하기</button>
			    	</div>
			    </div>
	    	</form>
		    
		 </c:when>
	   </c:choose>
    </div>
 
 	<div> <!-- table을 감싸는 div -->
	   <br>
	  <table class="table table-hover col-sm-12" align="center">
	    <thead>
	        <td>책 이름</th>
	        <td>${usedBook.title}</td>
	      </tr>
	      <tr>
	        <td>저자</th>
	        <td>${usedBook.author}</td>
	      </tr>
	      <tr>
	        <td>출판사</th>
	        <td>${usedBook.publisher}</td>
	      </tr>
	      <tr>
	        <td>카테고리</th>
	        <td>${usedBook.category}</td>
	      </tr>
	      <tr>
	        <td>책 상태</th>
	        <td>${usedBook.bookStatus}</td>
	      </tr>
	      <tr>
	        <td>원가</th>
	        <td>${usedBook.price}</td>
	      </tr>
	      <tr>
	        <td>판매가</th>
	        <td>${usedBook.discountPrice}</td>
	      </tr>
	  	  <tr>
	        <td>판매상태</th>
	        <td>${usedBook.sellStatus}</td>
	      </tr>
	      <tr>
	        <td>판매자 ID</th>
	        <td>${usedBook.userId}</td>
	      </tr>
	    </tbody>
	  </table>
  	</div>  
  
</div>
</div>
</body>

	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>

</html>