<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>책 전체목록</title>
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
	
<div align="center">
<div class="container">

	<div class="row inline">
	  	<h2>&nbsp;&nbsp;&nbsp;&nbsp;내가 주문한 책 목록</h2>&nbsp;&nbsp;
	  	

      
  <table class="table table-hover">
    <thead>
      <tr>
      	<th>&nbsp;</th>
        <th class="col-sm-3">책 이름</th>
        <th>수량</th>
        <th class="col-sm-2">가격</th>
        <th class="col-sm-1">&nbsp;</th>
      </tr>
    </thead>
  
      <tbody>
			<c:forEach var="l" items="${userBookList}">
	      <tr>
	      	<input type="hidden" name="bookId" value="${l.bookId}" />
	      	<td>
	      		<img border="0" style="width:100px; height:150px;" src="<c:url value="/image/" />${l.imageUrl}" />
	        <td>
	        	<a href="#none" onclick="location.href='<c:url value='/book/info/${l.bookId}'/>'"> ${l.title}</a>
	        </td>
	        <td>${l.quantity}</td>
	        <td>${l.totalPrice}</td>
	     
	    <td>
	    <form method="get" action="/review/add/${l.bookId}">
			   <%--  <input type="hidden" name="bookId" value="${l.bookId}"/>
			    <input type="hidden" name="quantity" value="1"/>
			    <input type="hidden" name="price" value="${l.price}"/>
			    <input type="hidden" name="kind" value="책" />
			    <input type="hidden" name="groupId" value="0" /> --%>
			    <div class="form-group">        
				    <div class="col-sm-offset-2 ">
			    		<button type="submit" class="btn btn-outline-secondary btn-sm">리뷰작성</button>
			    	</div>
			    </div>
	    </form>
	    </td>	
	    
	     </c:forEach>
	  
    </tbody>
  </table>
 </div>
</div>
<input class="btn btn-outline-secondary btn-sm" style="width: 130pt;height:25pt; background-color:dimgray; color: white;"type="button" value = "회원정보로 돌아가기" onclick="location.href='<c:url value='/account/userInfo'/>'">
<div><br></div>
</div>
</body>

	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>

</html>