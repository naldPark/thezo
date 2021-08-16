<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>
	.detail-area{width:80%; margin:0 auto; text-align: center; padding: 30px; margin-top:30px;}
	body{font-family:'Noto Sans KR', sans-serif;}
</style>
</head>
<body>
	<div class="detail-area w3-panel w3-border w3-round">
		<input type="hidden" name="rezWriter" id="rezWriter" value="${ loginUser.memNo }">
		<button type="button" class="close" onclick="window.close();">&times;</button>
		<h4 class="text-left">예약상세정보</h4>
		
		<div class="re_table">
			<table class="text-left">
				<tr>
					<th width="120px">자원 이름</th>
					<td>${ rez.resourceName }</td>
				</tr>
				<tr>
					<th>예약 날짜</th>
					<td>${ rez.rezDate }</td>
				</tr>
				<tr>
					<th>예약 시간</th>
					<td>${ rez.startTime } ~ ${ rez.endTime }</td>
				</tr>
				<tr>
					<th>등록자</th>
					<td>${ rez.rezWriter } (${ rez.applyDate })</td>
				</tr>
				<tr>
					<th>사용 용도</th>
					<td>${ rez.useFor }</td>
				</tr>
			</table>
		</div>
		<br>
		<div class="button-area" align="center">
			<button class="btn btn-primary" onclick="update();">수정</button>
			<button href="delete.rez?rezNo=${ rez.rezNo }" class="btn btn-danger">삭제</button>
		</div>
	</div>
	
	<script>
		// 로그인한 사람과 예약 등록자 일치 검사
		function update(){
			if($("#rezWriter").val() != ${ rez.memNo }){
				alert("작성자만 수정할 수 있습니다.");
			}else{
				location.href="updateForm.rez?rezNo=${ rez.rezNo }"
			}
			
		}			
	</script>
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>