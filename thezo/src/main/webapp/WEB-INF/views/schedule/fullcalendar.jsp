<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
    <!-- 풀캘린더  -->
	<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/main.css' rel='stylesheet' />
	<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/main.js'></script>
	<!-- 한국어설정 -->
	<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/locales/ko.js'></script>
	 
<script>
	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    
	    var calendar = new FullCalendar.Calendar(calendarEl, {
    	
	    	dateClick: function() { 
	    		// 날짜셀 클릭했을 시 이벤트 설정하면됨! 
	    		// => 일정추가 모달창 뜨게 설정
	    		$('#insertSc').modal();
	    	},
	    	
	      	headerToolbar: { // 헤더설정
				left: 'prevYear,prev,next,nextYear today',
				center: 'title',
				right: 'dayGridMonth,dayGridWeek,dayGridDay'
	        },
	        
	        initialDate: '2021-07-13', // 초기날짜
	        navLinks: true, // can click day/week names to navigate views
	        editable: true,
	        dayMaxEvents: true, // allow "more" link when too many events
	        locale: 'ko', // 한국어 설정
	        themeSystem: 'bootstrap', // 테마 설정
	        events: [ // ajax로 일정 불러오기
	        	$.ajax({
	        		url :'scList.sc',
					success:function(list){
						var scList = Object.values(JSON.parse(list));
						//console.log(scList);
						//calendar.addEvent({title:"test", start: "2021-07-01"});
						for(var i=0; i<scList.length; i++){
							calendar.addEvent(scList[i]);
						}
					},error: function(){
						console.log("일정 조회용 ajax 통신 실패");
					}
	        	})
	        ], 
	        eventClick: function() { 
	        	// 이벤트 클릭했을 시 기능 설정
	        	// 일정 내용과 보고서가 보여져야 함!!
	       		alert("이벤트 클릭함!!");
	        }
		});
	    
	    calendar.render();
});

</script>
<style>
	#calendar{
    	width: 900px;
    	padding: 20px;
    }
</style>
</head>
<body>
	<div id="calendar"></div>
	<!-- 일정추가 모달창 -->
	<jsp:include page="scheduleInsertView.jsp"/>
	<jsp:include page="scheduleDetailView.jsp"/>
</body>
</html>