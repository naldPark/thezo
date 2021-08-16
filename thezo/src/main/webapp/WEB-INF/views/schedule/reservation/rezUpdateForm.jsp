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
<body>
	<div class="detail-area w3-panel w3-border w3-round">
		<button type="button" class="close" onclick="window.close();">&times;</button>
		<h4 class="text-left">자원예약 수정</h4>
		<table class="text-left">
			<tr>
				<th width="150px">자원 이름</th>
				<td>
					<select name="resourceName" id="resourceName">
						<c:forEach var="r" items="${ reList }">
							<option value="${ r.resourceNo }">${ r.resourceName }</option>
						</c:forEach>
					</select>
				</td>
			</tr>

			<tr>
				<th>예약 날짜</th>
				<td><input type="date" name="rezDate" id="rezDate" value="${rez.rezDate}"></td>
			</tr>
			<tr>
				<th>예약 시간</th>
				<td>
					<input type="time" name="startTime" id="startTime" step="900" value="${rez.startTime}"> 
					~ <input type="time" name="endTime" id="endTime" step="900" value="${rez.endTime}">
				</td>
			</tr>
			<tr>
				<th>사용 용도</th>
				<td><textarea name="useFor" cols="40" rows="5" style="resize:none">${rez.useFor}</textarea></td>
			</tr>
			
		</table>
	</div>
	
	<script>
		$(function(){
			$("select[name=resourceName] option[value=${rez.resourceNo}]").attr("selected", true);
		})
	</script>
</body>
</html>