<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="toDay" class="java.util.Date"/>
<!DOCTYPE html>
<html>

<head>
  <title>입찰하기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
</head>
 <!-- <script type="text/javascript">
    document.getElementById("btn").addEventListener("click", function() {
      var currPrice = document.getElementById("currPrice").value;
      var auctionId = document.getElementById("auctionId").value;
      var confirmation = confirm(currPrice + "원을 입찰 하시겠습니까?");
      if (confirmation) {
        document.getElementById("postForm").submit();
      }
    });
  </script> -->
<body>
  <!-- navigation bar -->
  <%@include file="/WEB-INF/jsp/navbar.jsp"%>

  <form id="postForm" method="post" action="/auction/apply/${auctionId}">
    <div align="center">
    	
      <div class="mb-3 col-sm-3">
        <label for="exampleFormControlInput1" class="form-label">현재가 </label>
        <br>
        <input type="hidden" id="auctionId" name="auctionId" value="${auctionId}">
        <text style="font-size: 30px">${auction.currPrice} 원</text>
      </div>
      <div class="mb-3 col-sm-3">
        <label for="exampleFormControlInput1" class="form-label">입찰가격</label>
        <input type="number" class="form-control" id="exampleFormControlInput1" min="${auction.currPrice + 1}"
          id="currPrice" name="currPrice" required placeholder="희망하는 입찰가격을 입력하세요">
      </div>
 

      <button id="applyBtn" class="btn1 btn btn-outline-secondary btn-sm"  type="submit" onclick="alert('입찰되었습니다')">입찰하기</button>
      <button class="btn2 btn btn-outline-secondary btn-sm" type="button" onclick="location.href='<c:url value='/auction/list'/>'">취소</button>
     <!--  <button class="btn2 btn btn-outline-secondary btn-sm" type="button">취소</button> -->
     <div><br><text style="font-size:30px; text-align: center; color:#E02020;">신중하게 입찰해주세요</text></div>
    </div>
  </form>

  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

  <!-- footer bar -->
  <%@include file="/WEB-INF/jsp/footer.jsp"%>

 <!-- <script>
    document.getElementById('applyBtn').addEventListener('click', function(event) {
        event.preventDefault(); // 폼 제출을 막음
        if (confirm('입찰 하시겠습니까?')) {
            document.getElementById('deleteForm').submit(); // 폼 제출
        }
        
    });
</script> -->
</body>

</html>