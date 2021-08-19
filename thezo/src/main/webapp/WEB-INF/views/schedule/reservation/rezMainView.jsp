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
			editable: false,
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
			//dayHeaderFormat: {day : 'numeric'},
			
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
				});
				console.log(arg.resource._resource.title)
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
	  	
		// 자원(resources) 조회
		$.ajax({
			url :'select.re?caNo=' + ${ param.caNo },
			cache: false,
			success:function(list){
				var resourceList = Object.values(JSON.parse(list));
				for(var i=0; i<resourceList.length; i++){
					switch(resourceList[i].resourceNo){
						case 1: resourceList[i].eventBackgroundColor = '#00BFFF';
								break;
						case 2: resourceList[i].eventBackgroundColor = '#FF8E99';
								break;
						case 3: resourceList[i].eventBackgroundColor = '#FFAF0A';
								break;
						case 4: resourceList[i].eventBackgroundColor = '#6ED746';
								break;
						case 5: resourceList[i].eventBackgroundColor = '#50BEBE';
								break;
						case 6: resourceList[i].eventBackgroundColor = '#8C8CFF';
								break;						
						case 7: resourceList[i].eventBackgroundColor = '#FFB399'; 
								break;
						case 8: resourceList[i].eventBackgroundColor = '#FDD296'; 
								break;
						case 9: resourceList[i].eventBackgroundColor = '#69A8AA'; 
								break;
					}
					calendar.addResource({
						id: resourceList[i].resourceNo,
						title: resourceList[i].resourceName,
						category: resourceList[i].category,
						eventColor: resourceList[i].eventBackgroundColor
					});
				}
			},error: function(){
				console.log("자원 조회용 ajax 통신 실패");
			}
		});
		
		// 자원예약(reservation) 조회
		$.ajax({
			url :'select.rez',
			cache: false,
			success:function(list){
				var rezList = Object.values(JSON.parse(list));
				//console.log(rezList);
				for(var i=0; i<rezList.length; i++){
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