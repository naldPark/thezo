<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원예약</title>
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/main.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	initialView: 'timeGridWeek',
        initialDate: '2021-07-13',
        navLinks: true, // can click day/week names to navigate views
        editable: true,
        dayMaxEvents: true, // allow "more" link when too many events
        lang: 'ko', // 한국어 설정
        themeSystem: 'bootstrap',
    });
    
    calendar.render();
  });

</script>
<style>
    #calendar{
    	padding: 20px;
    }
</style>
</head>
<body>
	<!-- 메뉴바 -->
    <jsp:include page="../../common/header.jsp"/>
	
    <section>
	    <div class="outer">
	    	<!-- 예약관리 네비바 -->
            <jsp:include page="rezMenubar.jsp"/>
	                
	    	
	    	<div id="calendar"></div>
	    	
	    	
	    </div>
    </section>
</body>
</html>