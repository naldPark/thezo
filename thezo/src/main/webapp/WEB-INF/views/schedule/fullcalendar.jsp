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
    		$('div.modal').modal();
    		
    	},
    	
      	headerToolbar: { // 헤더설정
			left: 'prevYear,prev,next,nextYear today',
			center: 'title',
			right: 'dayGridMonth,dayGridWeek,dayGridDay'
        },
        
        initialDate: '2021-07-13', // ?
        navLinks: true, // can click day/week names to navigate views
        editable: true,
        dayMaxEvents: true, // allow "more" link when too many events
        locale: 'ko', // 한국어 설정
        themeSystem: 'bootstrap', // 테마 설정
        events: [
          {
            title: 'All Day Event',
            start: '2021-07-01'
          },
          {
            title: 'Long Event',
            start: '2021-07-07',
            end: '2021-07-10'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2021-07-11T16:00:00'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2021-07-16T16:00:00'
          },
          {
            title: 'Conference',
            start: '2021-07-11',
            end: '2021-07-13'
          },
          {
            title: 'Meeting',
            start: '2021-07-12T10:30:00',
            end: '2021-07-12T12:30:00'
          },
          {
            title: 'Lunch',
            start: '2021-07-12T12:00:00'
          },
          {
            title: 'Meeting',
            start: '2021-07-12T14:30:00'
          },
          {
            title: 'Happy Hour',
            start: '2021-07-12T17:30:00'
          },
          {
            title: 'Dinner',
            start: '2021-07-12T20:00:00'
          },
          {
            title: 'Birthday Party',
            start: '2021-07-13T07:00:00'
          },
          {
            title: 'Click for Google',
            url: 'http://google.com/',
            start: '2021-07-28'
          }
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
    	width: 80%;
    	padding:50px;
    	padding-top: 0;
    }
</style>
</head>
<body>
	<br>
	<div id="calendar"></div>
	
	<%-- 일정추가 모달창 ----------------------------------------------------------------------------%>
	<form action="insert.sc">
		<!-- The Modal -->
		<input type="hidden" value="${ loginUser.userId }"> <!-- 현재 로그인한 유저 아이디 전달 -->
		<div class="modal" id="insertSc">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">일정 추가</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
			    <table align="center">
			        <tr>
			            <th width="120px">일정 제목</th>
			            <td colspan="2"><input type="text" name="scTitle" style="width: 380px;" placeholder="일정 제목을 입력해주세요"></td>
			            <td>
			                <select name="scType" id="scType">
			                    <option value="personal">개인</option>
			                    <option value="dep">부서</option>
			                    <option value="com">회사</option>
			                </select>
			            </td>
			        </tr>
			        
			        <tr>
			            <th>시작일</th>
			            <td><input type="date" name="startDate" id="startDate"></td>
			            <td><input type="time" name="startTime" id="startDate"></td>
			            <td rowspan="2"><input type="checkbox" id="timeCheck" name="allDay" checked>시간설정</td> 
			            <!-- 시간설정 체크 해제시 시간 input 사라지게 / 기본값: 체크설정-->
			        </tr>
			        
			        <script>
			        	// 시간설정 -> 기본을 체크로 두고, 체크해제시 시간설정 input을 hidden처리하고 입력받지않는다.
			        	// 시간 input의 value값을 지우는 설정도 해야될듯 안그러면 값입력하고 hidden 처리시 값이 넘어오니까
			        	
			        	// => 체크해제시 하루종일 Y로.. 되게 ..ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
			        	$(function(){
			        		 $("#timeCheck").change(function(){
		        		        if($("#timeCheck").is(":checked")){
		        		        	$('#startTime').show();
				        			$('#endTime').show();
		        		        }
		        		        else{
		        		            $('#startTime').val('');
				        			$('#endTime').val('');
				        			$('#startTime').hide();
				        			$('#endTime').hide();
		        		        }
			        		});
	        		    });
			        </script>
			        <tr>
			            <th>종료일</th>
			            <td><input type="date" name="endDate" id="endDate"></td>
			            <td><input type="time" name="endTime" id="endDate"></td>
			        </tr>
			        <tr>
			            <th>내용</th>
			            <td colspan="2"><textarea name="sheduleContent" id="" cols="50" rows="10" style="resize: none;"></textarea></td>
			        </tr>
			
			    </table>
			    
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer center">
			      <div class="button-area">
				        <button class="btn btn-secondary" data-dismiss="modal">취소</button>
				        <button class="btn btn-primary" type="submit">저장</button>
				  </div>
		      </div>
		
		    </div>
		  </div>
		</div>
	</form>
</body>
</html>