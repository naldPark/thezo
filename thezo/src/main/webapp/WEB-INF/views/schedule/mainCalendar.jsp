<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 풀캘린더  -->
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/main.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendar = document.getElementById('mainCalendar');
	    var mainCalendar = new FullCalendar.Calendar(calendar, {
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
	            month: '2-digit',
         	},
         	aspectRatio: 2,
         	initialView: 'dayGridMonth',
	        lazyFetching : 'false',
	        themeSystem: 'bootstrap', // 테마 설정
	        stickyFooterScrollbar: false,
			expandRows: false,
			fixedWeekCount: false,
			contentHeight: 'auto',
			showNonCurrentDates: false,
	        eventSources:[
        		{
				events: [ // ajax로 일정 불러오기
					$.ajax({
						url :'list.sc',
						data : {scType:"회사", memNo:${ loginUser.memNo }},
						cache: false,
						success:function(list){
							var scList = Object.values(JSON.parse(list));
							scList[i].color = '#378006';
							mainCalendar.addEvent(scList[i]);
							console.log(scList);
						},error: function(){
							console.log("일정 조회용 ajax 통신 실패");
						}
					})
				]
	        }],
			eventDisplay: 'background'
		});
	    
	    $(function(){
			$("#mainCalendar .btn").addClass("btn-sm");
			$("#mainCalendar .btn").removeClass("btn-primary");
			$("#mainCalendar .fc-list-day-text").hide();
			$("#mainCalendar .fc-toolbar-title").
			/* $(".fc-daygrid-day-events").remove();

			$.each($(".fc-daygrid-day-number"), function(index, value){
				var replace = $(this).text().replace("일", "");
				$(this).text(replace);
			}) */
		});
	    mainCalendar.setOption('height', 290);
	    mainCalendar.setOption('contentHeight', 50);
	    mainCalendar.render();
	});
</script>
<style>
	#mainCalendar .fc-toolbar-title{font-size:16px; font-family: 'Noto Sans KR', sans-serif;}
	#mainCalendar .fc-list-event-time{width:60px; height:60px;}
	#mainCalendar td{white-space: normal;}
	#mainCalendar .fc-list-day-cushion{display:none;}
	#mainCalendar .fc-list-event-time{font-size:13px;}
	#mainCalendar .fc-list-event-title{font-size:14px;}
	#mainCalendar{width:230px; height:280px;}
	
	/* 날짜 셀 */
	#mainCalendar .fc-daygrid-day-number{font-size: 13px; text-align: center;}
	
	/* 툴바 */
	#mainCalendar .fc-header-toolbar{margin:0px;}
	
	/* 요일 셀 */
	#mainCalendar .fc-col-header-cell-cushion{font-size:12px;}
	#mainClaendar .fc-col-header-cell{background: rgb(20,70,104);}
	.fc-daygrid-day-events{display:none;}
</style>
</head>
<body>
	<div id="mainCalendar"></div>
</body>
</html>