<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#nav{width: 200px; height: 800px; margin: 0; float: left; background-color:rgb(236, 236, 236); box-sizing: border-box;}
	#nav button{margin: 10px;}
	#nav ul{list-style-type: none; padding-left: 20px;}
	.subject{font-size: x-large; text-align: center;}
	.slide_menu>a{margin: 20px;color:black}
	.slide_menu>a:hover{color: rgb(243,156,18);}
	.fa-reply{color: black;}
	.fa-reply:hover{color:rgb(243,156,18);}
	.btn>b{font-size: 18px; margin: 10px;}
	#note-list{color:rgb(243,156,18);}
</style>
</head>
<body>
	<div id="nav">
		<br>
		<div class="subject">
			<i class='fas fa-pencil-alt' style='font-size:20px'></i>
			<b>노트관리</b>
			<a class="back" href="main.sc" data-toggle="tooltip" title="일정관리로 돌아가기"><i class='fas fa-reply' style='font-size:15px'></i></a>
		</div>
		<script>
			$(document).ready(function(){
				$('[data-toggle="tooltip"]').tooltip();   
			});
		</script>
		
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
		
		<button class="btn down_menu" onclick="slideDown_menu();" style="font-size: 20px; margin: 3px; padding: 3px;">
			<i class='fas fa-caret-down'></i>
			<b>메뉴 바로가기</b>	
		</button> 
		<button class="btn up_menu" onclick="slideUp_menu();" style="font-size: 20px; margin: 3px; padding: 3px;" hidden>
			<i class='fas fa-caret-right'></i>
			<b>메뉴 바로가기</b>
		</button> 
		
		
		
		<div class="slide_menu">
			<a href="list.note" id="note-list"><b>노트 목록</b></a>
			<br>
			<a href="">업무 보고</a>
			<br>
			<a href="myList.rez">자원 예약</a>
		</div>
		<hr>
		
		
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
</body>
</html>