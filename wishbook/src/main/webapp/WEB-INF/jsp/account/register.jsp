<%@page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
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
<h2 align="center">회원가입</h2><hr style=" width : 70%;"><br>
  <section class="container mt-3" style="max-width: 560px;">
    <div class="form-group">
   		<form action="/account/idCheck" method="post">
		<label for="userId">ID</label> 
		<input type="text" name="userId" value="${userId}" class="form-control" placeholder="ID" required="required"><br>
		<div align="right"><button type="submit" class="btn btn-secondary btn-sm" style="background-color:dimgray; color:white; border:none;">중복 확인</button></div></form>
	</div> 
<script>
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    }) 
</script>
	<form action="/account/register.do" method="post">
	<input type="hidden" name="userId" value="${userId}"/>
    <div class="form-group">
		<label for="password">비밀번호</label> 
		<input type="password" name="password" class="form-control" placeholder="비밀번호" required="required">
	</div>
     <div class="form-group">
		<label for="confirmPassword">비밀번호 확인</label> 
		<input type="password" name="confirmPassword" class="form-control" placeholder="비밀번호 확인" required="required">
	</div>
    <div class="form-group">
		<label for="name">이름</label> 
		<input type="text" name="name" class="form-control" placeholder="이름" required="required">
	</div>
    <div class="form-group">
		<label for="email">이메일</label> 
		<input type="email" name="email" class="form-control" placeholder="wishbook@gmail.com" required="required">
	</div>
    <div class="form-group">
		<label for="address">주소</label> 
		<input type="text" name="address" class="form-control" placeholder="주소" required="required">
	</div>
    <div class="form-group">
		<label for="phone">연락처</label> 
		<input type="text" name="phone" class="form-control" placeholder="010-0000-0000" required="required">
	</div>
    <div class="form-group">
      <label for="favoriteCategory">선호 장르</label>
     	 <select name="favoriteCategory" class="form-control">
		  <option value="문학">문학</option>
		  <option value="비문학">비문학</option>
		  <option value="언어">언어</option>
		  <option value="예술">예술</option>
		  <option value="종교">종교</option>
		  <option value="종교">철학</option>
	  </select>
    </div><br>
    <div class="form-group" align="center">        
        <button type="submit" class="btn btn-default" style="background-color:dimgray; color:white; border:none;">회원가입</button>
    </div>
  </form>
  </section><br><br><br>
</div>
<div style=" text-align: center;">
	<!-- footer bar -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>

</html>