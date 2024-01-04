<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 네비게이션 바 -->
<!-- 원하는 곳에 include 해서 쓰세요 -->

<!-- bootstrap css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
  
  <style>
	  *{
	  	font-family: 'NanumSquareNeoBold';
	  }
  </style>

   <nav class="navbar navbar-expand-lg navbar-light bg-body-secondary">
  <div class="container-fluid">
    <a class="navbar-brand" href='<c:url value="/" />'><img src="../../image/logo.png" style="width:120px; height:70px;"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link text-muted" href="/usedBook/list">중고거래</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-muted" href="/auction/list">경매</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-muted" href="/bookClub/list">독서모임</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-muted" href="/groupPurchase/list">공동구매</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="/book/list" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           	책구매
          </a>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
            <li><a class="dropdown-item" href="/book/list">전체목록</a></li>
            <li><a class="dropdown-item" href="/book/categoryList/문학">문학</a></li>
            <li><a class="dropdown-item" href="/book/categoryList/비문학">비문학</a></li>
            <li><a class="dropdown-item" href="/book/categoryList/철학">철학</a></li>
            <li><a class="dropdown-item" href="/book/categoryList/종교">종교</a></li>
            <li><a class="dropdown-item" href="/book/categoryList/예술">예술</a></li>
            <li><a class="dropdown-item" href="/book/categoryList/언어">언어</a></li>  
          </ul>
        </li>
      </ul>
	
    </div>
    <!-- book과 연결후 확인해보아야 함 -->
      <form class="d-flex text-muted" action="/book/searchBookByKeyword" method="post" role="search">
             <input class="form-control me-2" type="search" placeholder="책 제목을 검색하세요" aria-label="Search"
              value="${book.title}" name="search" />
              <input type="hidden" name="searchn" value="title" />
              <button type="submit" style="width: 50pt;" class="btn btn-outline-secondary btn-sm-2" >검색</button>
      </form>
	  
		 <!-- 1. 관리자 일때 (userId == "admin") -->
		<%if (session.getAttribute("userId") != null) {
		   if (session.getAttribute("userId").equals("admin")) { %>   
		   <div class="d-flex justify-content-end">
		    	<a class="nav-link" href="/account/userList/">회원목록 확인</a>
		    	<a class="nav-link" href="/account/logout.do">로그아웃</a>
      	  </div>
		<%   } else { %>
		<!-- 2. 로그인 한 사용자 일때 -->
		  <div class="d-flex justify-content-end">
		    	<a class="nav-link" href="/account/logout.do">로그아웃</a>
		    	<a class="nav-link" href="/account/userInfo">회원정보</a>
     	  </div>
		<%   } } else { %>
		<!-- 3. 로그인 하지않은 사용자 일때 -->
		  <div class="d-flex justify-content-end">
	    	<a class="nav-link" href="/account/login">로그인</a>
	    	<a class="nav-link" href="/account/register">회원가입</a>
      	 </div>
		<%   } %>
      
  </div>
</nav>