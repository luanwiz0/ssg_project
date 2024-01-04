<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
  <title>중고책 등록하기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.2/css/bootstrap.min.css">
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
	<div class="form-group col row justify-content-center h-100 align-items-center">
		  <form class="d-flex text-muted" action="/usedBook/search" method="post" role="search">
		 	<input class="form-control me-2" type="search" placeholder="책 제목을 검색하세요" aria-label="Search"
		  	value="${book.title}" name="title" />
		  	<input type="submit" value="검색" />
		  </form>
	</div>
	</div>
	

<div class="container">
  <h2>중고책 등록하기</h2><hr><br>
  <form class="form-horizontal" method="post" action="/usedBook/add.do">
  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="hidden" name="bookId" value="${book.bookId}"/>
  <%--   
    <div class="row mb-3">
      <label class="col-form-label col-sm-0" for="title">책 이름:</label>
      <div class="col-sm-5">
        <input type="text" class="form-control" id="title" name="title" value="${book.title}">
      </div>
    </div>
    <div class="row mb-3">
      <label class="col-form-label col-sm-0" for="author">저자:</label>
      <div class="col-sm-5">      
         <input type="text" class="form-control" value="${book.author}" name="author"/>
      </div>
    </div>
     <div class="row mb-3">
      <label class="col-form-label col-sm-0" for="publisher">출판사:</label>
      <div class="col-sm-5">      
        <input type="text" class="form-control" value="${book.publisher}" name=publisher/>
      </div>
    </div>
    <div class="row mb-3">
      <label class="col-form-label col-sm-0" for="category">카테고리:</label>
      <div class="col-sm-5">      
        <input type="text" class="form-control" value="${book.category}" name=category/>
      </div>
    </div>
     <div class="row mb-3">
      <label class="col-form-label col-sm-0" for="bookStatus">책의 상태:</label>
      <div class="checkbox">
          <label><input type="radio" name="bookStatus" value="상 ">상</label>
          <label><input type="radio" name="bookStatus" value="중 ">중</label>
          <label><input type="radio" name="bookStatus" value="하 ">하</label>
        </div>
    </div>
    <div class="row mb-3">
      <label class="col-form-label col-sm-0" for="price">원가:</label>
      <div class="col-sm-5">     
       <input type="text" class="form-control" value="${book.price}" name=price/>
      </div>
    </div>
     <div class="row mb-3">
      <label class="col-form-label col-sm-0" for="discountPrice">희망 판매가격:</label>
      <div class="col-sm-5">          
        <input type="text" class="form-control" id="discountPrice" name="discountPrice" required="required">
      </div>
    </div>
    <div class="row mb-3">
      <label class="col-form-label col-sm-2" for="sellStatus">판매상태:</label>
     	<div class="checkbox">
          <label><input type="radio" name="sellStatus" value="판매중 ">판매중</label>
          <label><input type="radio" name="sellStatus" value="거래완료 ">거래완료</label>
        </div>
    </div> --%>
    
    <div class="container">
	 <div class="mb-3">
		  <label for="title" class="form-label">책 이름</label>
		  <input type="text" class="form-control col-sm-5" id="title" value="${book.title}">
		</div>
		 <div class="mb-3">
		  <label for="author" class="form-label">저자</label>
		  <input type="text" class="form-control col-sm-5" id="author" value="${book.author}">
		</div>
		 <div class="mb-3">
		  <label for="publisher" class="form-label">출판사</label>
		  <input type="text" class="form-control col-sm-5" id="publisher" value="${book.publisher}">
		</div>
		 <div class="mb-3">
		  <label for="category" class="form-label">카테고리</label>
		  <input type="text" class="form-control col-sm-5" id="category" value="${book.category}">
		</div>
		 <div class="mb-3">
		  <label for="bookStatus" class="form-label">책의 상태</label>
		  	<div class="radio">
	          <label><input type="radio" id = "bookStatus" name="bookStatus" value="상">상</label>
          <label><input type="radio" id = "bookStatus" name="bookStatus" value="중" >중</label>
          <label><input type="radio" id = "bookStatus" name="bookStatus" value="하" 	>하</label>
	        </div>
		</div>
		 <div class="mb-3">
		  <label for="price" class="form-label">원가</label>
		  <input type="text" class="form-control col-sm-5" id="price" value="${book.price}">
		</div>
		 <div class="mb-3">
		  <label for="discountPrice" class="form-label">희망 판매가격</label>
		  <input type="text" class="form-control col-sm-5" name="discountPrice" id="discountPrice" required="required">
		</div>
		<div class="mb-3">
		  <label for="sellStatus" class="form-label">판매상태</label>
		  	<div class="radio">
	          <label><input type="radio" name="sellStatus" value="판매중 ">판매중</label>
	          <label><input type="radio" name="sellStatus" value="거래완료 ">거래완료</label>
	        </div>
		</div>
		
		<% String usedId = session.getId(); %>
		<div class="mb-3">
		  <label for="userId" class="form-label">판매자 ID</label>
		  <input type="text" class="form-control col-sm-5" id="userId" value="${userId}">
		</div>
	
	   <div class="form-inline">
	    <div class="row mb-3">        
	      <div class="col-sm-offset-2 row-sm-10">
	      
      	<input type="hidden" name="bookId" value="${book.bookId}"/>
      	<input type="hidden" name="discountPrice" value="${discountPrice}"/>
      	<input type="hidden" name="userId" value="${user.userId}"/>
      	<input type="hidden" name="bookStatus" value="${bookStatus}"/>
      	<input type="hidden" name="sellStatus" value="${sellStatus}"/>
      	
      	&nbsp;&nbsp;&nbsp;
      	<button type="submit" class="btn btn-outline-secondary btn-sm" 
      	style="font-size: small">저장하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
      </div>
    </div>
    
            
      <div class="col-sm-offset-2 row-sm-10">
        <button type="button" class="btn btn-outline-secondary btn-sm" 
        style="font-size: small"
        onclick="location.href='<c:url value='/usedBook/list'/>'">돌아가기</button>
      </div>
     
    </div>
    
  </form>
</div>

</body>


	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
	
</html>