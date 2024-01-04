<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
  
  <style>
	  *{
	  	font-family: 'NanumSquareNeoBold';
	  }
  </style>
  
   <main>
   
   <!-- navigation bar -->
	<%@include file="/WEB-INF/jsp/navbar.jsp"%>
	<br><br><br>
  
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오늘의 책</h2></div>
  <div class="carousel-inner row justify-content-start">
    <div class="carousel-item active">
      <img class="d-block w-15" src="https://ifh.cc/g/7Hgkrd.jpg" alt="First slide">
    </div>
    <div class="carousel-item row justify-content-center">
      <img class="d-block w-15" src="https://ifh.cc/g/wmCyNW.jpg" alt="Second slide">
    </div>
    <div class="carousel-item row justify-content-end">
      <img class="d-block w-15" src="https://ifh.cc/g/grnBnW.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
  
    </main>
    
    <!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>