<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#nav{width: 200px; height: 700px; margin: 0; float: left; background-color:rgb(236, 236, 236); box-sizing: border-box;}
	#nav button{margin: 10px;}
	#nav ul{list-style-type: none; padding-left: 20px;}
	.subject{font-size: x-large;text-align: center;}
	.slide_menu>a{margin: 20px;color:black}
	.slide_menu>a:hover{color: rgb(243,156,18);}
	.btn>b{font-size: 18px; margin: 10px;}
</style>
</head>
<body>
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
		
		<button class="btn down_menu" onclick="slideDown_menu();" style="font-size: 20px; margin: 3px; padding: 3px;">
			<i class='fas fa-caret-down'></i>
			<b>메뉴 바로가기</b>	
		</button> 
		<button class="btn up_menu" onclick="slideUp_menu();" style="font-size: 20px; margin: 3px; padding: 3px;" hidden>
			<i class='fas fa-caret-right'></i>
			<b>메뉴 바로가기</b>
		</button> 
		
		
		<div class="slide_menu">
			<a href="list.note" id="note-list">노트 목록</a>
			<br>
			<a href="" id="note-list">업무 보고</a>
			<br>
			<a href="myList.rez" id="note-list">자원 예약</a>
		</div>
		<hr>
		
		<div class="table-bordered" id="do-navbar" style="width:200px; margin-top: 10px; padding: 5px;">
		<b>필터</b>
		<br>
		<!-- 일정 카테고리 선택하는 부분 /색깔도 줄 수 있을까?..-->
			<input type="checkbox"> 전체 <br>
			<input type="checkbox"> 개인 <input type="color"><br> 
			<input type="checkbox"> 팀 <br>
			<input type="checkbox"> 회사 <br>
			<input type="checkbox"> 비품 <br>
			<input type="checkbox"> 회의실 <br>
			
		</div>
	</div>
	<!-- 메뉴바 display 효과 -->
	<script>
		function slideDown_sc(){
			$(".slide_sc").hide();
			$(".down_sc").hide();
			$(".up_sc").removeAttr("hidden");
		}
		
		function slideUp_sc(){
			$(".slide_sc").show();
			$(".down_sc").show();
			$(".up_sc").attr("hidden", true);
		}
		
		function slideDown_menu(){
			$(".slide_menu").hide();
			$(".down_menu").hide();
			$(".up_menu").removeAttr("hidden");
		}
		
		function slideUp_menu(){
			$(".slide_menu").show();
			$(".down_menu").show();
			$(".up_menu").attr("hidden", true);
		}
	</script>
	<jsp:include page="scheduleInsertView.jsp"/>
</body>
</html>