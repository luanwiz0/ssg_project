<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>책 상세정보</title>
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
 	form
	{display:inline}
	
</style>

</head>


<body>

 	<!-- navigation bar -->
	<%@include file="/WEB-INF/jsp/navbar.jsp"%>


<div class="container">
<div class="row">
<h2 style="align:center">책 상세 페이지</h2>&nbsp;&nbsp;&nbsp;&nbsp;
	    	 <%if (session.getAttribute("userId") != null) {
			if (session.getAttribute("userId").equals("admin")) { %>
  	 <form method="get" action="/book/update/${bookId}">
    	<div class="form-group">        
        	<button type="submit" class="btn btn-outline-secondary btn-sm">수정</button>&nbsp;&nbsp;
      	</div>
     </form>
    <form method="get" action="/book/delete/${bookId}">
      <div class="form-group">
     	<button type="submit" style="float:right" class="btn btn-outline-secondary btn-sm"
        onclick="location.href='<c:url value='/book/list'/>'">삭제</button>
      </div>
      </form>
       <%} } %>	
       </div>
	  	 
     
     <div align="center">	
  <div class="row justify-content-center h-190 align-items-center"> 
  <table class="table table-hover  align=center">
    <thead>
 		<img border="0" style="width:250px; height:300px;" src="<c:url value="/image/" />${book.imageUrl}" />
 		<br><br>
        
       
        </thead>
	<tr>
        <th>책 이름</th>
        <td>${book.title}</td>
      </tr>
      <tr>
        <th>저자</th>
        <td>${book.author}</td>
      </tr>
      <tr>
        <th>출판사</th>
        <td>${book.publisher}</td>
      </tr>
      <tr>
        <th>카테고리</th>
        <td>${book.category}</td>
      </tr>
      <tr>
        <th>책 설명</th>
        <td>${book.description}</td>
      </tr>
      <tr>
        <th>가격</th>
        <td>${book.price}</td>
      </tr>
    </tbody>
  	</table>
  	<c:if test="${islogin != 1}">
        <div align="center">
        
		
       <div class="row justify-content-center">
  <div class="col">

      <div class="d-flex">
        <input type="number" id="amount" name="amount" min="1" value="1" class="form-control me-2" style="width: 100px;">
        &nbsp;개 &nbsp;&nbsp;&nbsp;
          <form method="get" action="/account/login"> 
          <button type="submit" onclick="alert('로그인 한 사용자만 열람할 수 있습니다.\n로그인창으로 이동하시겠습니까?');" class="btn btn-secondary btn-sm"style="width: 80pt;height:28pt; background-color:dimgray; color: white;">구매하기</button>
        </form>
      </div>
  </div>
</div>
        </div>
        <br>
        </c:if>
  	<c:if test="${islogin == 1}">
  <div align="center">
    <div class="row justify-content-center">
      <div class="col">
        <form action="/cart/add" method="post">
          <div class="d-flex">
            <input type="number" id="amount" name="amount" min="1" value="1" class="form-control me-2" style="width: 100px;">
            &nbsp;개 &nbsp;&nbsp;&nbsp;
            <input type="hidden" name="bookId" value="${book.bookId}" />
            <input type="hidden" name="quantity" id="quantityInput" value="${amount}" />
            <input type="hidden" name="price" value="${book.price}" />
            <input type="hidden" name="groupId" value="0" />
            <input type="hidden" name="kind" value="책" />
            <button type="submit" onclick="alert('해당 책이 장바구니로 이동되었습니다. 결제를 하시려면 장바구니로 이동해주세요.');" style="width: 80pt;height:28pt; background-color:dimgray; color: white;" class="btn btn-outline-secondary btn-sm">구매하기</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <br>
</c:if>
  </div>  
  </div>
  
<div><br><br></div>
   
   <h2>책 리뷰</h2>
   
   
   <table class="table table-hover">
    <thead>
      <tr>
        <th class="col-sm-1">리뷰ID</th>
        <th class="col-sm-2" >리뷰 작성자</th>
        <th>내용</th>
        <th class="col-sm-1">&nbsp;</th>
      </tr>
    </thead>
  
      <tbody>
			<c:forEach var="r" items="${rlist}">
		      <tr>
	
		        <td>
		        	${r.reviewId}
		        </td>
		        <td>${r.userId}</td>
		        <td>${r.content}</td>
		     
		    <td>
	
		    
		   <c:if test="${r.check == 1}">
		    <form method="get" action="/review/update/${r.reviewId}">
				 <%--   	<input type="hidden" name="bookId" value="${r.bookId}"/>
				    <input type="hidden" name="reviewId" value="${r.reviewId}"/> --%>
				    <div class="form-group">        
					    <div class="col-sm-offset-2 ">
				    		<button type="submit" class="btn btn-outline-secondary btn-sm">수정</button>
				    	</div>
				    </div>
		    </form>
		    <form method="get" action="/review/delete/${r.reviewId}">
				     <input type="hidden" name="reviewId" value="${r.reviewId}"/>
				    <div class="form-group">        
					    <div class="col-sm-offset-2 ">
				    		<button type="submit" class="btn btn-outline-secondary btn-sm">삭제</button>
				    	</div>
				    </div>
		    </form>
		    </td>
		    </c:if>
	    
	     </c:forEach>
	  
    </tbody>
  </table>
 <c:if test="${rCount == 0}">
		     <div align="center">
		     <br>
		     	<text>현재 작성된 리뷰가 없습니다.</text>
		     </div>
   </c:if>
   <div><br><br><br></div>
	
   </div> 
   <script>
  var amountInput = document.getElementById("amount");
  var quantityInput = document.getElementById("quantityInput");
  amountInput.addEventListener("input", function() {
    quantityInput.value = this.value;
  });
</script>
  </body>
  
 	 <!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</html>