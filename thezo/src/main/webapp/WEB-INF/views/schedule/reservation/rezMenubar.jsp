<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#nav{width: 200px; height: 800px; margin: 0; float: left; background-color:rgb(236, 236, 236); box-sizing: border-box;}
	#nav button{margin: 10px;}
	#nav ul{list-style-type: none; padding-left: 20px;}
	.subject{font-size: x-large; text-align: center;}
	.fa-reply{color: black;}
	.fa-reply:hover{color:rgb(243,156,18);}
	#nav a{color: black; margin-left: 20px;}
	a>b{color:rgb(243,156,18);}
</style>
<body>
	<!-- 예약관리 네비바 -->
	<div id="nav">
		<br>
	    <div class="subject">
			<i class='fas fa-clock' style='font-size:20px'></i>
			<b>자원예약</b>
			<a class="back" href="main.sc" data-toggle="tooltip" title="일정관리로 돌아가기"><i class='fas fa-reply' style='font-size:15px'></i></a>
		</div>
		<script>
			$(document).ready(function(){
			  $('[data-toggle="tooltip"]').tooltip();   
			});
		</script>
		<button class="btn btn-primary" style="width: 180px;" align="center" data-toggle="modal" data-target="#insertRez">
			자원 예약
		</button>
		<hr>
		<a href="myList.rez"><b>나의 예약 목록</b></a> <br>
		<a href="con.rez">회의실</a> <br>
		<a href="sup.rez">비품</a> <br>
		<a href="car.rez">차량</a> <br>
		<c:set var="URI" value="${pageContext.request.requestURI}"/>
		<hr>
		<script>
			
		</script>
		<button class="btn btn-primary" style="width: 180px;" align="center">자원 관리하기</button>
	</div>
	<!-------------------------------네비바 끝-->
</body>
</html>