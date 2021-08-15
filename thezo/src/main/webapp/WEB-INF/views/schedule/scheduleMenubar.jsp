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
	.scColorBox{width:15px; height: 15px; border-radius:5px; display: inline-block;}
	#todayCalendar{width:200px; height:200px;}
</style>
<script>
	$(function(){
		$("#todayScCalendar .fc-toolbar-title").css('font-size', '15px');
		$("#todayScCalendar .fc-header-toolbar").css('margin', '0');
		$("#todayScCalendar .btn").addClass("btn-sm");
	})
</script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
	    var tdCalendar = document.getElementById('todayScCalendar');
	    var todayScCalendar = new FullCalendar.Calendar(tdCalendar, {
    	
	    	eventClick: function(info) {
	        	// 이벤트 클릭했을 시 기능 설정
	        	// 일정 내용과 보고서가 보여져야 함!!
	        	var scNo = info.event._def.extendedProps.scNo;
	        	var option = "width = 680, height = 700, top = 100, left = 200, location = no";
				window.open("detail.sc?scNo=" + scNo, "일정상세정보", option);
	        },
	    	
	      	headerToolbar: { // 헤더설정
				left: 'prev',
				center: 'title',
				right: 'next'
	        },
	        titleFormat: {
	            month: 'long',
	            day: 'numeric'
	         },
	        lazyFetching : 'false',
	        initialView: 'listDay',
	        locale: 'ko', // 한국어 설정
	        themeSystem: 'bootstrap', // 테마 설정
	        eventSources:[
        		{
				events: [ // ajax로 일정 불러오기
					$.ajax({
						url :'list.sc',
						data : {scType:"all", memNo:${loginUser.memNo}},
						cache: false,
						success:function(list){
							var scList = Object.values(JSON.parse(list));
							for(var i=0; i<scList.length; i++){
								if(scList[i].scType == '개인'){
									scList[i].color = '#148CFF';
								}else if(scList[i].scType == '회사'){
									scList[i].color = '#378006';
								}else{
									scList[i].color = '#7B68EE';
								}
								todayScCalendar.addEvent(scList[i]);
							}
						},error: function(){
							console.log("일정 조회용 ajax 통신 실패");
						}
					})
				]
	        }]
		});
	    
	    todayScCalendar.render();
	});
	
</script>
<style>
	#todayScCalendar{width:200px;}
	.fc-list-event{font-size:10px;}
</style>
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
			
			
			<%-- 오늘 일정 뜨게 하는 영역 -----------------------------------------------------------------%>
			<div style="margin-left:30px;">
				<b>오늘 일정 &nbsp;
				<span id="todayDate"></span></b>
			</div>
			<!-- <ul id="todaySchedule" style="list-style-type: square; margin-left:5px;"></ul> -->
			<div id="todayScCalendar"></div>
			
			<hr>
			<button class="w3-button w3-block w3-left-align" onclick="menu();">
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
			
			<div class="table-bordered" id="scFilter" style="width:200px; margin-top: 10px; padding: 5px;">
				<b>필터</b>
				<!-- <br>
				<input type="checkbox" id="전체" value="전체" checked>
				<label for="개인">전체</label> -->
				<br>
				<input type="checkbox" id="개인" value="개인" checked> 
				<label for="개인">개인 일정 <div class="scColorBox" style="background-color: #148CFF;"></div></label>
				<br> 
				<input type="checkbox" id="부서" value="부서" checked> 
				<label for="부서">내 부서 일정 <div class="scColorBox" style="background-color: #7B68EE;"></div></label>
				<br>
				<input type="checkbox" id="회사" value="회사" checked> 
				<label for="회사">회사 일정 <div class="scColorBox" style="background-color: #378006;"></div></label>
				<br>
				<!-- 
				<input type="checkbox" checked> 비품 <br>
				<input type="checkbox" checked> 회의실 <br>
				 -->
			</div>
			
			<script>
				var scChk = $("#scFilter input[type=checkbox]");
				var scTypeString = "개인부서회사";
			</script>
			
		</div>
		
	</div>
	  
	

	

	
</body>
</html>