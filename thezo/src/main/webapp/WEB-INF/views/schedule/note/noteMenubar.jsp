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
			</div>
			
			<a href="insertForm.note?memNo=${ loginUser.memNo }" class="btn btn-primary" style="width: 180px; margin:10px;">
				노트 작성
			</a>
			<hr>
			
			<%-- 오늘 일정 뜨게 하는 영역 -----------------------------------------------------------------%>
			<div style="margin-left:30px;">
				<b>오늘 일정 &nbsp;
				<span id="todayDate"></span></b>
			</div>
			<div id="todayScCalendar">
				<jsp:include page="../todayScView.jsp"/>
			</div>		
				
			<hr>
			
			<%-- 일정관리 관련 메뉴들 ----------------------------------------------- --%>
			<hr>
			<button class="w3-button w3-block w3-left-align" onclick="menu();">
				<i class="fa fa-caret-down"></i> 메뉴 바로가기 
			</button>
			<div id="menu" class="w3-hide w3-white w3-card">
				<a class="w3-bar-item w3-button" href="main.sc">일정 관리</a>
			
				<a class="w3-bar-item w3-button" href="list.note?memNo=${ loginUser.memNo }">노트 목록</a>
					
				<a class="w3-bar-item w3-button" href="myList.rez?memNo=${ loginUser.memNo }">자원 예약</a>
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

		</div>
	</div>
</body>
</html>