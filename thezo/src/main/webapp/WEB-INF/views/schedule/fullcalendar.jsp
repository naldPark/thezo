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
    	
	    	dateClick: function(date) { 
	    		// 날짜셀 클릭했을 시 이벤트 설정하면됨! 
	    		// => 일정추가 모달창 뜨게 설정
	    		//console.log(date.dateStr);
	    		$('#startDate').val(date.dateStr);
	    		$('#endDate').val(date.dateStr);
	    		$('#insertSc').modal();
	    	},
	    	
	      	headerToolbar: { // 헤더설정
				left: 'prevYear,prev,next,nextYear today',
				center: 'title',
				right: 'dayGridMonth,dayGridWeek,dayGridDay'
	        },
	        navLinks: true, // can click day/week names to navigate views
	       	editable: true, // 편집가능
	        dayMaxEvents: true, // allow "more" link when too many events
	        locale: 'ko', // 한국어 설정
	        themeSystem: 'bootstrap', // 테마 설정
	        events: [ // ajax로 일정 불러오기
				$.ajax({
					url :'list.sc',
					success:function(list){
						var scList = Object.values(JSON.parse(list));
						console.log(scList);
						//calendar.addEvent({title:"test", start: "2021-07-01"});
						for(var i=0; i<scList.length; i++){
							calendar.addEvent(scList[i]); // DB에 있는 이벤트 캘린더에 추가
						}
					},error: function(){
						console.log("일정 조회용 ajax 통신 실패");
					}
				})
	        ], 
			
	        eventClick: function(info) {
	        	// 이벤트 클릭했을 시 기능 설정
	        	// 일정 내용과 보고서가 보여져야 함!!
	        	//console.log(info.event.start);
				//console.log(info.event.extendedProps.allday);
				
	        	// 시간 형식 바꾸기
	        	var start = newDateFormat(info.event.start);
				if(info.event.end != null){
					var end = newDateFormat(info.event.end);
				}
				var allday = info.event.extendedProps.allday;
				
				//console.log(new Date(end-start));
				
				
				
				if(allday = 'Y'){
					// 일정이 1일 하루 종일이라면
					// => 시작일 출력, 끝나는 날(년월일시)출력 X (시작일 년월일만 출력)
					start = start.substring(0, 10);
					end = "";
				//}else if(allday = 'Y' &&){
					// 일정이 며칠동안의 하루종일이라면 ?
					// => 시간출력x, 끝나는 일 출력
					//start = start.substring(0, 10);
				//	end = end.substring(0, 10);
				}else{
					// 일정이 하루종일이 아니라면
					// 시작, 끝 년월일시 모두 출력
					end = " ~ " + end;
				}
				
				// 등록된 보고서가 없을 때 !! 
				// => 1. 등록 버튼 출력 2. 보고서 영역 비워주기
				$("#repInsertBtn").removeAttr("hidden");
				$("#repInfo").html("");
				
	        	//console.log(info.event.extendedProps);
	        	
	        	$("#scNo").val(info.event.extendedProps.scNo);
	        	
	        	$("#scInfo").html("<tr>"
	        						+ "<th width='120px'>일정 제목</th>"
	        						+ "<td width='300px'>" + info.event.title + "</td>"
	        					+ "<tr>"
		        				+ "<tr>"
	        						+ "<th>일정 시간</th>"
	        						+ "<td>" + start + end + "</td>"
	        					+ "<tr>"
        						+ "<tr>"
    								+ "<th>작성자</th>"
    								+ "<td>" + info.event.extendedProps.scWriter + "</td>"
    							+ "<tr>"
		    					+ "<tr>"
									+ "<th>내용</th>"
									+ "<td>" + info.event.extendedProps.scContent + "</td>"
								+ "<tr>"
	        					);
	        	
	        	if(info.event.extendedProps.reportTitle != undefined){
	        		// 등록된 보고서가 있다면
		        	// => 보고서 출력
	        		$("#repInfo").html("<tr>"
			    						+ "<th width='120px'>제목</th>"
			    						+ "<td width='250px'>" + info.event.extendedProps.reportTitle + "</td>"
			    					 + "</tr>"
			    					 + "<tr>"
			    					 	+"<th>보고서 작성자</th>"
			    					 	+"<td>" + info.event.extendedProps.reportWriter + "</td>"
			    					 + "<tr>"
			    					 	+ "<th>등록일</th>"
			    					 	+"<td>" + info.event.extendedProps.createDate + "</td>"
			    					 + "</tr>"
			    					 + "<tr>"
			    					 	+"<th>내용</th>"
			    					 	+"<td>" + info.event.extendedProps.reportContent + "</td>"
			    					 + "</tr>"
			    					 + "<tr>"
			    					 	+"<th>첨부파일</th>"
			    					 	+"<td>" + info.event.extendedProps.originName + "</td>"
			    					 + "</tr>"
    				);
	        		$("#repInsertBtn").attr("hidden", true);
	        	}
	        	
	        	$("#detailSc").modal();
	        },
	        eventMouseEnter: function(info) {
				//info.el.style.borderColor = '#378006';
			}
	        //eventColor: '#378006'
		});
	    
	    calendar.render();
	});
	
	function newDateFormat(date){
		// Tue Aug 10 2021 00:00:00 GMT+0900 (한국 표준시)
		// => yyyy-MM-dd hh:mm
		date.setHours(date.getHours() + 9);
		return date.toISOString().replace('T', ' ').substring(0, 16);
	}
		
</script>

<style>
	#calendar{
    	width: 100%;
    	padding: 20px;
    }
	.fc-event{
	    cursor: pointer;
		
	}
	.fc-event:hover{
		opacity: 0.7;
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