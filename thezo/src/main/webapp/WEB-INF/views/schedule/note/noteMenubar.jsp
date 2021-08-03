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
	hr {
	    margin-top: 1rem;
	    margin-bottom: 1rem;
	    border: 0;
	    border-top: 1px solid rgba(0,0,0,.1);
	}
</style>
</head>
<body>
	<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" id="mySidebar" style="display:none">
		<button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>

		<div id="nav">
			<br>
			
			<div class="subject">
				<i class='fas fa-pencil-alt' style='font-size:20px'></i>
				<b>노트관리</b>
				<a class="back" href="main.sc" data-toggle="tooltip" title="일정관리로 돌아가기"><i class='fas fa-reply' style='font-size:15px'></i></a>
			</div>
			
			<a href="insertForm.note" class="btn btn-primary" style="width: 180px; margin:10px;">
			노트 작성
			</a>
			<hr>
			
			<button class="btn down_sc" onclick="slideDown_sc();" style="font-size: 20px; margin: 3px; padding: 3px;">
				<i class='fas fa-caret-down'></i><b>오늘 일정</b>
			</button>
			<button class="btn up_sc" onclick="slideUp_sc();" style="font-size: 20px; margin: 3px; padding: 3px;" hidden>
				<i class='fas fa-caret-right'></i><b>오늘 일정</b>
			</button>
			
			
			<div class="slide_sc">
				 <ul id="todaySchedule">
					<!-- 오늘일정 수만큼 li태그가 반복되는 반복문 -->
					<li><input type="checkbox">Conference</li>
					<li><input type="checkbox">Meeting</li>
					<li><input type="checkbox">Lunch</li>
			
				</ul>
			</div>
			
			<hr>
			<button class="w3-button w3-block w3-left-align" onclick="myAccFunc()">
				메뉴 바로가기 <i class="fa fa-caret-down"></i>
			</button>
			<div id="demoAcc" class="w3-hide w3-white w3-card">
				<a class="w3-bar-item w3-button" href="list.note?memNo=${ loginUser.memNo }" id="note-list">노트 목록</a>
				
				<a class="w3-bar-item w3-button" href="" id="note-list">업무 보고</a>
					
				<a class="w3-bar-item w3-button" href="myList.rez" id="note-list">자원 예약</a>
			</div>

			<script>
				function myAccFunc() {
					var x = document.getElementById("demoAcc");
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

		</div>
	</div>
</body>
</html>