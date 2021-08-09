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
	    var infoSet = new Set();
	    var infoArr = new Array();
	    function removeEvents(re){
    		infoArr.push(re);
    		//infoSet = new Set(infoArr);
    	}
	    //var infoArr = Array.from(infoSet);
	    
	   
	    // 일정 출력 필터
	    $(scChk).change(function(){
	    	var scTypeString = "";
	    	
			$.each(scChk, function (index, value) {
				if($(value).is(":checked")){
					scTypeString += $(value).val();
					//console.log(scTypeString);
				}else{
					scTypeString += "";
				}
			});
			
			// 만약 캘린더에 남은 일정이 없다면 (모두 지워졌다면)
			// 접근할 event가 없기 때문에 event를 저장해 두었던 infoArr에 접근하도록 한다
			if(calendar.getEvents().length === 0){
				$.each(infoArr, function(index, value){
					//console.log(value);			
					var scType = value._def.extendedProps.scType;
					if(scTypeString.includes(scType)){
						calendar.addEvent(value);
					}
				})
			}else{
				$.each(calendar.getEvents(), function(index, value){ // 캘린더에 출력된 이벤트에 접근
					//console.log(value);
					var scType = value._def.extendedProps.scType
					if(!scTypeString.includes(scType)){ 
						// 메뉴바에서의 scType이 체크 해제 되었다면,
						// 달력에서 출력되지 않게 한다.
						removeEvents(value); // 체크 해제 된 일정을 따로 저장하고 달력에서 지움
						value.remove();
					}else{
						// 메뉴바에서 scType이 체크 되었다면,
						// 달력에 다시 출력 한다.
						$.each(infoArr, function(index, value){
							var scType = value._def.extendedProps.scType;
							if(scTypeString.includes(scType)){
								calendar.addEvent(value);
							}
							//console.log(value);
						})
					}
				});
			}
			
			
			
		});
	    
	    var calendar = new FullCalendar.Calendar(calendarEl, {
    	
	    	dateClick: function(date) { 
	    		// 날짜셀 클릭했을 시 이벤트 설정하면됨! 
	    		// => 일정추가 모달창 뜨게 설정
	    		//console.log(date.dateStr);
	    		$('#startDate').val(date.dateStr);
	    		$('#endDate').val(date.dateStr);
	    		$('#insertSc').modal();
	    	},
	    	
	    	eventClick: function(info) {
	        	// 이벤트 클릭했을 시 기능 설정
	        	// 일정 내용과 보고서가 보여져야 함!!
	        	var scNo = info.event._def.extendedProps.scNo;
	        	var option = "width = 680, height = 700, top = 100, left = 200, location = no";
				window.open("detail.sc?scNo=" + scNo, "일정상세정보", option);
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
	        eventSources:[
        		{
        		id: 'es',
				events: [ // ajax로 일정 불러오기
					// 1. 개인 일정
					$.ajax({
						url :'list.sc',
						data : {scType:"개인", memNo:${loginUser.memNo}},
						cache: false,
						success:function(list){
							var scList = Object.values(JSON.parse(list));
							for(var i=0; i<scList.length; i++){
								scList[i].color = '#148CFF';
								if(scTypeString.includes('개인')){
									calendar.addEvent(scList[i]); // DB에 있는 이벤트 캘린더에 추가
								}
							}
						},error: function(){
							console.log("일정 조회용 ajax 통신 실패");
						}
					})
				],
        		 
     	        events: [
     	        	// 2. 회사 일정
     	        	$.ajax({
     	        		url :'list.sc',
	     				data : {scType: "회사", memNo:${loginUser.memNo}},
	     				cache: false,
	     				success:function(list){
	     					var scList = Object.values(JSON.parse(list));
	     					for(var i=0; i<scList.length; i++){
	     						scList[i].color = '#378006';
								if(scTypeString.includes('회사')){
	     							calendar.addEvent(scList[i]); // DB에 있는 이벤트 캘린더에 추가
								}
	     					}
	     				},error: function(){
	     					console.log("일정 조회용 ajax 통신 실패");
	     				}
     	        	})
     	        ], 
     	        events: [
     	        	// 3. 부서 일정
     	        	$.ajax({
     	        		url :'list.sc',
	     				data : {scType: "부서", memNo:${loginUser.memNo}},
	     				cache: false,
	     				success:function(list){
	     					var scList = Object.values(JSON.parse(list));
	     					for(var i=0; i<scList.length; i++){
	     						scList[i].color = '#7B68EE';
								if(scTypeString.includes('부서')){
	     							calendar.addEvent(scList[i]); // DB에 있는 이벤트 캘린더에 추가
								}
	     					}
	     				},error: function(){
	     					console.log("일정 조회용 ajax 통신 실패");
	     				}
     	        	})
     	        ],
	        }]
	        
	        
	        
		});
	    
	    calendar.render();
	});
	
	
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
</body>
</html>