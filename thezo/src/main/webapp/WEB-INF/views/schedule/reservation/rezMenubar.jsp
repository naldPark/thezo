<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			<button class="btn btn-primary" style="width: 180px;" align="center" data-toggle="modal" data-target="#insertSc">
				자원예약하기
			</button>
			<script>
				$(document).ready(function(){
				  $('[data-toggle="tooltip"]').tooltip();   
				});
			</script>
			<hr>
			<div class="rezMenu">
				<a class="w3-bar-item w3-button" href="myList.rez"><b>나의 예약 목록</b></a>
				<a class="w3-bar-item w3-button" href="con.rez">회의실</a>
				<a class="w3-bar-item w3-button" href="sup.rez">비품</a>
				<a class="w3-bar-item w3-button" href="car.rez">차량</a>
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