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
</style>
<script>
	$(function(){
		// 오늘 날짜 구하기
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1;
		var yyyy = today.getFullYear();
	 	var week = new Array('일', '월', '화', '수', '목', '금', '토');
	    var day = week[today.getDay()];
		if (dd < 10) {
		  dd = '0' + dd;
		}
		if (mm < 10) {
		  mm = '0' + mm;
		}
		var today = mm + '/' + dd + '(' + day + ')'; 
		$("#todayDate").text(today);
		
		var td = yyyy + '-' + mm + '-' + dd;
		// 오늘 일정 구하기
		$.ajax({
			url: 'list.sc',
			data: {scType:""},
			cache: false,
			success: function(data){
				var scList = Object.values(JSON.parse(list));
				for(var i=0; i<scList.length; i++){
					calendar.addEvent(scList[i]); // DB에 있는 이벤트 캘린더에 추가
					var value = "";
					console.log(scList[i]);
					/*
					if(scList[i].start = td || scList[i].end = td){
						 value += "<li>"
									+ scList[i].title
								+ "</li>";
					}
				}*/
				$("#todaySchedule").html(value);
			},error: function(){
				console.log("오늘일정 표시용 ajax 통신 실패");
			}
		})
		console.log(yyyy + '-' + mm + '-' + dd);
	})
</script>
</head>
<body>
	<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" id="mySidebar" style="display:none">
		<button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>

		<div id="nav">
			<br>
			
			<div class="subject">
				<i class='far fa-calendar-alt' style='font-size:20px'></i>
				<b>일정관리</b>
			</div>
			
			<button class="btn btn-primary" style="width: 180px;" align="center" data-toggle="modal" data-target="#insertSc">
				일정 추가
			</button>
			<hr>
			<button class="w3-button w3-block w3-left-align" onclick="todaySc()">
				<i class="fa fa-caret-down"></i> 오늘 일정 &nbsp; <b><span id="todayDate"></span></b>
			</button>
			<div id="todaySc" class="w3-hide w3-white w3-card">
				<br>
				<ul id="todaySchedule">
					<!-- 오늘일정 수만큼 li태그가 반복되는 반복문 -->
					<li>Conference</li>
					<li>Meeting</li>
					<li>Lunch</li>
				</ul>
				<br>
			</div>

			<script>
				function todaySc() {
					var x = document.getElementById("todaySc");
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
			<button class="w3-button w3-block w3-left-align" onclick="menu()">
				<i class="fa fa-caret-down"></i> 메뉴 바로가기 
			</button>
			<div id="menu" class="w3-hide w3-white w3-card">
				<a class="w3-bar-item w3-button" href="list.note?memNo=${ loginUser.memNo }" id="note-list">노트 목록</a>
				
				<a class="w3-bar-item w3-button" href="" id="note-list">업무 보고</a>
					
				<a class="w3-bar-item w3-button" href="myList.rez" id="note-list">자원 예약</a>
			</div>

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
			
			<div class="table-bordered" id="do-navbar" style="width:200px; margin-top: 10px; padding: 5px;">
			<b>필터</b>
			<br> <!-- 걍 a링크로 ! -->
				<input type="checkbox" value="all" checked> 전체 일정 <br>
				<input type="checkbox" > 개인 일정 <br> 
				<input type="checkbox" value="부서"> 내 부서 일정 <br>
				<input type="checkbox" value="회사"> 회사 일정<br>
				<input type="checkbox"> 비품 <br>
				<input type="checkbox"> 회의실 <br>
			</div>
		</div>
		
	</div>
	  
	

	

	
</body>
</html>