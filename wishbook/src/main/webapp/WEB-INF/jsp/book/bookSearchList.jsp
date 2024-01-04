<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <title>책 검색 목록</title>
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
  <div class="form-group col row justify-content-center h-100 align-items-center col-sm-4">
    <form class="d-flex text-muted" action="searchBookByKeyword">
      <div class="d-flex">
        <select name="searchn" class="form-select me-2">
          <option value="title">제목</option>
          <option value="author">작가</option>
        </select>
        <input class="form-control me-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search" name="search" />
        <input type="submit" value="검색" class="btn btn-secondary" />
      </div>
    </form>
  </div>

  
</div>	 
<div class="container">

	<div class="row inline">
	  	<h2>&nbsp;&nbsp;&nbsp;&nbsp;검색 결과</h2>&nbsp;&nbsp;
	  	
	  	 <%if (session.getAttribute("userId") != null) {
			if (session.getAttribute("userId").equals("admin")) { %>
		
	  	  <form method="get" action="/book/add">
	    	<div class="form-group">        
	      	<div class="col-sm-offset-5 col-sm-15">
	        	<button type="submit" class="btn btn-outline-secondary" style="font-size: small">등록</button>
	      	</div>
	      	
	      	</div>
	     </form>
	      <% } }%>
	     &nbsp;&nbsp;
	     <form  method="post" action="/book/list">
		
		 <input type="submit" value="전체 목록으로" class="btn btn-outline-secondary" style="font-size: small"/>
	 </form>
     </div>

      
  <table class="table table-hover">
    <thead>
      <tr>
      	<th>&nbsp;</th>
        <th class="col-sm-2">책 이름</th>
        <th class="col-sm-1">저자</th>
        <th class="col-sm-1">출판사</th>
        <th class="col-sm-1">카테고리</th>
        <th>설명</th>
        <th class="col-sm-1">가격</th>
        <th class="col-sm-1">&nbsp;</th>
      </tr>
    </thead>
  
      <tbody>
      <%-- <c:if test="${count == 0}">
			<tr>
				<td>현재 판매중인 책이 없습니다.</td>
			</tr>
		</c:if> --%>
		<%-- <c:if test="${count > 0}"> --%>
			<c:forEach var="l" items="${list}">
	      <tr>
	      	<%-- <td>
	      		<c:out value="${start}"/>
				<c:set var="start" value="${start+1}" />
			</td> --%>
	      	<input type="hidden" name="bookId" value="${l.bookId}" />
	      	<td>
	      		<img border="0" style="width:100px; height:150px;" src="<c:url value="/image/" />${l.imageUrl}" />
	        <td>
	        	<a href="#none" onclick="location.href='<c:url value='/book/info/${l.bookId}'/>'"> ${l.title}</a>
	        </td>
	        <td>${l.author}</td>
	        <td>${l.publisher}</td>
	        <td>${l.category}
	        <td>${l.description}</td>
	        <td>${l.price}</td>
	    
	    <%if (session.getAttribute("userId") != null) { %> 
	    <td>
	    <form action="/cart/add" method="post">
			    <input type="hidden" name="bookId" value="${l.bookId}"/>
			    <input type="hidden" name="quantity" value="1"/>
			    <input type="hidden" name="price" value="${l.price}"/>
			    <input type="hidden" name="kind" value="책" />
			    <input type="hidden" name="groupId" value="0" />
			    <div class="form-group">        
				    <div class="col-sm-offset-2 ">
			    		<button type="submit" class="btn btn-outline-secondary btn-sm" 
			    		onclick="alert('해당 상품이 장바구니로 이동됩니다.');">구매</button>
			    	</div>
			    </div>
	    </form>
	    </td>	
	    <%} else{ %>
	    <td>
	   		<div class="form-group">        
				<div class="col-sm-offset-2 ">
			    	<button type="submit" class="btn btn-outline-secondary btn-sm" 
			    	style="width: 60pt;" onclick="location.href='<c:url value='/account/login'/>'
        			alert('로그인 한 사용자만 열람할 수 있습니다.\n로그인창으로 이동하시겠습니까?');">구매하기</button>
			    </div>
			   </div>
		</td>
		<%} %>
	     </c:forEach>
	  
    </tbody>
  </table>
</div>
</div>
</body>

	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
	

</html>