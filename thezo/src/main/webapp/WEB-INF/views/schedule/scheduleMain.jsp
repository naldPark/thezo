<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>일정관리</title>
<style>
	#nav{
		width: 200px;
		height: 800px; 
		margin: 0;
		float: left;
		background-color:rgb(236, 236, 236);
		box-sizing: border-box;
	}
	#nav button{
        margin: 10px;
    }

    #nav a{
        margin: 20px;
        color: black;
    }

	#nav li{
		list-style-type: none;
	}
</style>
</head>
<body>

    <jsp:include page="../common/header.jsp"/>
   
    
    <section>
    
	    <div class="outer">
			 <!-- 일정관리 네비바 -->
			 <div id="nav">
				<b style="margin-left: 30px; font-size: 25px;">일정관리</b> 
                <br>
                <button class="btn btn-primary" style="width: 180px;" align="center">일정 추가</button>
				<hr>

				<button class="btn down_sc" onclick="slideDown_sc();">▼</button>
				<button class="btn up_sc" onclick="slideUp_sc();" hidden>▲</button>
				<b>오늘 일정</b>
				
				<div class="slide_sc">
	                <ul id="todaySchedule">
						
						<!-- 오늘일정 수만큼 li태그가 반복되는 반복문 -->
						<li><input type="checkbox">Conference</li>
						<li><input type="checkbox">Meeting</li>
						<li><input type="checkbox">Lunch</li>
	
					</ul>
				</div>
                <hr>

				<button class="btn down_menu" onclick="slideDown_menu();">▼</button> 
				<button class="btn up_menu" onclick="slideUp_menu();" hidden>▲</button> 
				<b>메뉴 바로가기</b>	
				
				
				<div class="slide_menu">
					<a href="list.nt" id="note-list">노트 목록</a>
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
	    	
	        <%-- 네비바 끝 ------------------------------------------------------------------------------- --%>
	        
	        
	   		<%-- 캘린더 영역 ------------------------------------------------------------------------------- --%>
			<jsp:include page="fullcalendar.jsp"/>
	        
	    </div>
	    
   </section>
   
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