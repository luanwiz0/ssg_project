<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<title>독서모임 수정</title>
<style>
	*{ font-family: 'NanumSquareNeoBold'; }
</style>
</head>
<body>
<!-- navigation bar -->
<%@include file="/WEB-INF/jsp/navbar.jsp"%>
<div class="container" style=" text-align: center;">
<div class="form-group col row justify-content-center h-100 align-items-center">
<form:form modelAttribute="bookClubInfo" action="/bookClub/update" method="POST">
<table class="table table-bordered"  align="center" style="width:600px; text-align: center;">
	<tr><th colspan = "2">독서모임 정보</th></tr>
	<tr>
		<td>이름</td>
		<td>
			<form:input type="text" path="clubName" />
			<form:input type="hidden" path="clubId" />
		</td>
	</tr>
	<tr>
		<td>소개</td>
		<td>
			<form:input type="text" path="description" /> 
		</td>
	</tr>
	<tr>
		<td>최대 인원</td>
		<td>
			<form:input type="number" path="maxNum" />
		</td>
	</tr>
	<tr>
		<td>모임 요일</td>
		<td>
			<form:select path="dayVal">
				<form:options items="${bookClubInfo.dayStr}" />	
			</form:select> 
		</td>
	</tr>
	<tr>
		<td>시작 시간</td>
		<td>
			<form:input type="number" path="startTime" />
		</td>
	</tr>
	<tr>
		<td>진행 시간</td>
		<td>
			<form:input type="number" path="hour" />
		</td>
	</tr>
	<tr>
		<td>모임 장소</td>
		<td>
			<form:input type="text" path="address" />
		</td>
	</tr>
	<tr>
		<td>책</td>
		<td>
			<!-- 나중에 책 이름으로 검색해서 가져오는 걸로 변경할 수 있으면 변경 -->
			<form:input type="number" path="bookId" />
		</td>
	</tr>
</table>	
<input type="submit" value="확인">
</form:form>
</div>
</div>
<br><br><br>
<!-- footer bar -->
<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>