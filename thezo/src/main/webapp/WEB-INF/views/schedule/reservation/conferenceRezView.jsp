<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원예약</title>
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/fullcalendar-scheduler/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/fullcalendar-scheduler/main.js'></script>

<!-- 한국어설정 -->
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/locales/ko.js'></script>
<script>
	
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
	
		var calendar = new FullCalendar.Calendar(calendarEl, {
			schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	
			initialView: 'resourceTimeGridDay',
			editable: true,
			selectable: true,
			dayMaxEvents: true, // allow "more" link when too many events
			dayMinWidth: 200,
			themeSystem: 'bootstrap', // 테마 설정
			locale: 'ko', // 한국어 설정
			headerToolbar: {
				left: 'prev,next today',
				center: 'title',
				right: 'resourceTimeGridDay,resourceTimeGridWeek,dayGridMonth'
			},
			// uncomment this line to hide the all-day slot
			allDaySlot: false,

			eventOverlap: function(stillEvent, movingEvent) { // 예약이 겹치지 않도록
				return stillEvent.allDay && movingEvent.allDay;
			},

			// 클릭 이벤트 (일정추가)
			select: function(arg) { // date를 드래그하여 일정추가
				var rezDate = arg.start.getFullYear() 
							+ "-" + (arg.start.getMonth() >= 10 ? arg.start.getMonth() + 1 : '0' + (arg.start.getMonth() + 1)) 
							+ "-" + (arg.start.getDate() >= 10 ? arg.start.getDate() : '0' + arg.start.getDate()); 
				var startTime = (arg.start.getHours() >= 10 ? arg.start.getHours() : '0' + arg.start.getHours())
								+ ':'
								+ (arg.start.getMinutes() >= 10 ? arg.start.getMinutes() : '0' + arg.start.getMinutes());
				var endTime = (arg.end.getHours() >= 10 ? arg.end.getHours() : '0' + arg.end.getHours())
								+ ':'
								+ (arg.end.getMinutes() >= 10 ? arg.end.getMinutes() : '0' + arg.end.getMinutes());
				//console.log(rezDate);
				//console.log(startTime);
				$('#rezDate').val(rezDate);
				$('#startTime').val(startTime);
				$('#endTime').val(endTime);
				
				$('#resourceName option').each(function(){
					if($(this).text() == arg.resource._resource.title){
						$(this).attr("selected", true);
					}
				})
				$('#insertRez').modal();
			},
			  
			dateClick: function(arg) { // date 클릭
				$('#rezDate').val(arg.dateStr.substring(0,10));
				$('#insertRez').modal();
			},
			  
			eventClick: function(arg){
				var rezNo = arg.event._def.publicId;
				var option = "width = 700, height = 350, top = 100, left = 200, location = no";
				window.open("detail.rez?rezNo=" + rezNo, "자원예약 상세조회", option);
			}
		  
		});
	  
		$.ajax({
			url :'select.re',
			cache: false,
			success:function(list){
				var resourceList = Object.values(JSON.parse(list));
				//console.log(resourceList);
				for(var i=0; i<resourceList.length; i++){
					//resourceList[i].color = '#148CFF';
					calendar.addResource({
						id: resourceList[i].resourceNo,
						title: resourceList[i].resourceName,
						category: resourceList[i].category
					});
					//console.log(resourceList[i]);
				}
			},error: function(){
				console.log("자원예약 조회용 ajax 통신 실패");
			}
		});
		  
		$.ajax({
			url :'select.rez',
			cache: false,
			success:function(list){
				var rezList = Object.values(JSON.parse(list));
				//console.log(rezList);
				for(var i=0; i<rezList.length; i++){
					//resourceList[i].color = '#148CFF';
					calendar.addEvent({
						id: rezList[i].rezNo,
						resourceId: rezList[i].resourceNo,
						title: rezList[i].rezWriter + (rezList[i].useFor == undefined ? "" : ' - ' + rezList[i].useFor),
						start: rezList[i].rezDate + 'T' + rezList[i].startTime,
						end: rezList[i].rezDate + 'T' +rezList[i].endTime,
					});
				}
			},error: function(){
				console.log("자원예약 조회용 ajax 통신 실패");
			}
		})
		  
		calendar.render();
	});
	
</script>
<style>
	#calendar {width: 80%; margin-left: 250px;}
	.fc-event{cursor: pointer;}
	.fc-event:hover{opacity: 0.7;}
</style>
</head>
<body>
	<!-- 메뉴바 -->
    <jsp:include page="../../common/header.jsp"/>
    <section>
	    <div class="outer">
	    	<!-- 예약관리 네비바 -->
            <jsp:include page="rezMenubar.jsp"/>
	    	<br>
	    	<div id='calendar'></div>
	    	<br><br>
	    	
	    </div>
    </section>
    
    <jsp:include page="rezInsertView.jsp"/>
</body>
</html>