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
				<b>자원예약</b>
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
				<a class="w3-bar-item w3-button" id="myRezMenu" href="myList.rez?memNo=${ loginUser.memNo }">나의 예약 목록</a>
				<c:forEach var="c" items="${ caList }">
					<a class="w3-bar-item w3-button" id="${ c.categoryNo }" href="main.rez?caNo=${ c.categoryNo }">${ c.categoryName }</a>
				</c:forEach>
			</div>
			
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
			<!-- 사용자 == 관리자일때 !!-->
			<c:if test="${ loginUser.status == 'A' }">
				<button class="btn btn-primary" style="width: 180px;" align="center" onclick="manage();">
					자원 관리하기
				</button>
			</c:if>
			
			<script>
				function manage(){
					var option = "width = 600, height = 350, top = 100, left = 200, location = no";
					window.open("manage.rez", "자원예약 상세조회", option);
				}
			</script>
			
			
			<script>
				$(function(){
					var caNo = '${ caNo }';
					$.each($(".rezMenu a"), function(index, value){
						if(caNo == value.href.split('caNo=')[1]){
							$(this).css('color', 'rgb(243,156,18)');
							$(this).css('font-weight', 'bold');
						}
						
						if(caNo == ''){
							// 예약목록
							$("#myRezMenu").css('color', 'rgb(243,156,18)');
							$("#myRezMenu").css('font-weight', 'bold');
						}
					})
				})

			</script>
			
			<hr>
		</div>
		
		
		
	</div>
	  <jsp:include page="rezInsertView.jsp"/>
</body>
</html>