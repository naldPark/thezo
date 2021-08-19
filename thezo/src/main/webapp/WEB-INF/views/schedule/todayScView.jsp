<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 풀캘린더  -->
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/main.js'></script>
<!-- 한국어설정 -->
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/locales/ko.js'></script>

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
	        	year: 'numeric',
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
						data : {scType:"all", memNo:${ loginUser.memNo }},
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
	    todayScCalendar.setOption('height', 280);
	    todayScCalendar.render();
	});
</script>
<style>
	/* title */
	#todayScCalendar .fc-toolbar-title{font-size:15px; font-family: 'Noto Sans KR', sans-serif;}
	
	#todayScCalendar .fc-list-event-time{width:60px; height:60px;}
	#todayScCalendar td{white-space: normal;}
	#todayScCalendar .fc-list-day-cushion{display:none;}
	#todayScCalendar .fc-list-event-time{font-size:13px;}
	#todayScCalendar .fc-list-event-title{font-size:14px;}
</style>
</head>
<body>
<div id="todayScCalendar"></div>
<script>
	$(function(){
		$("#todayScCalendar .btn").addClass("btn-sm");
		$("#todayScCalendar .btn").removeClass("btn-primary");
		$("#todayScCalendar .fc-list-day-text").hide(); 
	})
</script>
</body>
</html>