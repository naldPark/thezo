<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#nav button{margin: 10px;}
	#nav ul{list-style-type: none; padding-left: 20px;}
	.subject{font-size: x-large;text-align: center;}
	.slide_menu>a{margin: 20px; color:black}
	.slide_menu>a:hover{color: rgb(243,156,18);}
	.btn>b{font-size: 18px; margin: 10px;}
	.fa-reply{color: black;}
	.fa-reply:hover{color:rgb(243,156,18);}
	a>b{color:rgb(243,156,18);}
	
	#rezMenu{margin: 0px;}
</style>
<script>
	$(function(){
		$("#todayScCalendar .fc-toolbar-title").css('font-size', '15px');
		$("#todayScCalendar .fc-header-toolbar").css('margin', '0');
		$("#todayScCalendar .btn").addClass("btn-sm");
	})
</script>

<style>
	#todayScCalendar{width:200px; display:inline-block;}
	.fc-list-event{font-size:10px;}
</style>
</head>
<body>
	<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" id="mySidebar">
		<div id="nav">
			<br>
			
			<div class="subject">
				<i class='far fa-calendar-alt' style='font-size:20px'></i>
				<b>자원예약</b><a class="back" href="main.sc" data-toggle="tooltip" title="일정관리로 돌아가기"><i class='fas fa-reply' style='font-size:15px;'></i></a>
			</div>
			
			<button class="btn btn-primary" style="width: 180px;" align="center" data-toggle="modal" data-target="#insertRez">
				자원예약하기
			</button>
			<script>
				$(document).ready(function(){
					$('[data-toggle="tooltip"]').tooltip();   
				});
			</script>
			<hr>
			<div class="rezMenu">
				<a class="w3-bar-item w3-button" id="myList" href="myList.rez"><b>나의 예약 목록</b></a>
				<c:forEach var="c" items="${ caList }">
					<a class="w3-bar-item w3-button" id="${ c.categoryNo }" href="main.rez?caNo=${ c.categoryNo }">${ c.categoryName }</a>
				</c:forEach>
			</div>
			
			<%-- 일정 관련 메뉴 ------------------------------------------------------ --%>
			<hr>
			<button class="w3-button w3-block w3-left-align" onclick="menu();">
				<i class="fa fa-caret-down"></i> 메뉴 바로가기 
			</button>
			
			<div id="menu" class="w3-hide w3-white w3-card">
				<a class="w3-bar-item w3-button" href="list.note?memNo=${ loginUser.memNo }" id="note-list">노트 목록</a>
				
				<a class="w3-bar-item w3-button" href="" id="note-list">업무 보고</a>
					
				<a class="w3-bar-item w3-button" href="myList.rez" id="note-list">자원 예약</a>
			</div>
			<hr>
			<!-- 사용자 == 관리자일때 !!-->
			<button class="btn btn-primary" style="width: 180px;" align="center">자원 관리하기</button>
			<script>
				$(function(){
					$.each($("#rezMenu>a"), function(index, value){
						console.log($(this).href);
						console.log(index);
						if($(this).id() == caNo){
							$(this).css('color', 'rgb(243,156,18)');
							$(this).css('font-weight', 'bold');
						}else{
							$("#myList").css('color', 'rgb(243,156,18)');
							$("#myList").css('font-weight', 'bold');
						}
					})
				})
				
				function menu() {
					var x = document.getElementById("menu");
					if (x.className.indexOf("w3-show") == -1) {
						x.className += " w3-show";
						x.previousElementSibling.className += " w3-gray";
					} else { 
						x.className = x.className.replace("w3-show", "");
						x.previousElementSibling.className = 
						x.previousElementSibling.className.replace("w3-gray", "");
					}
				}

			</script>

			<hr>
			
			
		</div>
		
	</div>
	  
	
	

	

	
</body>
</html>