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
	    views: {
	      resourceTimeGridTwoDay: {
	        type: 'resourceTimeGrid',
	        duration: { days: 2 },
	        buttonText: '2 days',
	      }
	    },
	
	    //// uncomment this line to hide the all-day slot
	    allDaySlot: false,
	
	    resources: [
	      { id: 'a', title: 'Room A' },
	      { id: 'b', title: 'Room B', eventColor: 'green' },
	      { id: 'c', title: 'Room C', eventColor: 'orange' },
	      { id: 'd', title: 'Room D', eventColor: 'red' }
	    ],
	    events: [
	      { id: '1', resourceId: 'a', start: '2021-08-12', end: '2021-08-12', title: 'event 1' },
	      { id: '2', resourceId: 'a', start: '2021-08-12T09:00:00', end: '2021-08-12T14:00:00', title: 'event 2' },
	      { id: '3', resourceId: 'b', start: '2021-08-12T12:00:00', end: '2021-08-12T06:00:00', title: 'event 3' },
	      { id: '4', resourceId: 'c', start: '2021-08-12T07:30:00', end: '2021-08-12T09:30:00', title: 'event 4' },
	      { id: '5', resourceId: 'd', start: '2021-08-12T10:00:00', end: '2021-08-12T15:00:00', title: 'event 5' }
	    ],
	
	    select: function(arg) {
	      console.log(
	        'select',
	        arg.startStr,
	        arg.endStr,
	        arg.resource ? arg.resource.id : '(no resource)'
	      );
	    },
	    dateClick: function(arg) {
	      console.log(
	        'dateClick',
	        arg.date,
	        arg.resource ? arg.resource.id : '(no resource)'
	      );
	    },
	    eventClick: function(arg){
			console.log('eventClick', arg)	    	
	    }
	  });
	
	  calendar.render();
	});
	
</script>
<script>
	$(function(){
		console.log(${resourceList})
	})
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
</body>
</html>