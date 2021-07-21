<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>일정관리</title>
<style>
	#nav{
		width: 200px;
		height: 800px; 
		margin: 0;
		float: left;
		background-color:rgb(236, 236, 236);
		box-sizing: border-box;
	}
	#nav button{
        margin: 10px;
    }

    #nav a{
        margin: 20px;
        color: black;
    }

	#nav li{
		list-style-type: none;
	}
</style>
</head>
<body>

    <jsp:include page="../common/header.jsp"/>
   
    
    <section>
    
	    <div class="outer">
			 <!-- 일정관리 네비바 -->
			 <div id="nav">
				<b style="margin-left: 30px; font-size: 25px;">일정관리</b> 
                <br>
                <button class="btn btn-primary" style="width: 180px;" align="center">일정 추가</button>
				<hr>

				<button class="btn" function="click();">▼</button><b>오늘 일정</b>
                <ul id="todaySchedule">
					
					<!-- 오늘일정 수만큼 li태그가 반복되는 반복문 -->
					<li><input type="checkbox">Conference</li>
					<li><input type="checkbox">Meeting</li>
					<li><input type="checkbox">Lunch</li>

				</ul>

                <hr>

				<button class="btn" function="click();">▼</button> <b>메뉴 바로가기</b>	
				<label for="">
					<a href="list.nt" id="note-list">노트 목록</a>
				</label>
				<br>
				<label for="">
					<a href="" id="note-list">업무 보고</a>
				</label>
				<br>
				<label for="">
					<a href="myList.rez" id="note-list">자원 예약</a>
				</label>

				<hr>

				<div class="table-bordered" id="do-navbar" style="width:200px; margin-top: 10px; padding: 5px;">
					<b>필터</b>
					<br>
					<!-- 일정 카테고리 선택하는 부분 /색깔도 줄 수 있을까?..-->
					<input type="checkbox"> 전체 <br>
					<input type="checkbox"> 개인 <input type="color"><br> 
					<input type="checkbox"> 팀 <br>
					<input type="checkbox"> 회사 <br>
					<input type="checkbox"> 비품 <br>
					<input type="checkbox"> 회의실 <br>
					
				</div>
            </div>
	    	
	        <%-- 네비바 끝 ------------------------------------------------------------------------------- --%>
	        
	        
	   		<%-- 캘린더 영역 ------------------------------------------------------------------------------- --%>
			<jsp:include page="fullcalendar.jsp"/>
	        
	        <%-- 일정추가 (모달창) -------------------------------------------------------------------------------%>
	        <form action="일정추가url">
				<!-- The Modal -->
				<div class="modal" id="scAdd">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h4 class="modal-title">일정 추가</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      <!-- Modal body -->
				      <div class="modal-body">
					    <table class="" align="center">
					        <tr>
					            <th width="120px">일정 제목</th>
					            <td colspan="2"><input type="text" name="scheduleTitle" style="width: 380px;" placeholder="일정 제목을 입력해주세요"></td>
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
					            <td><input type="date" name="startDate"></td>
					            <td><input type="text" name="startTime"></td>
					            <td rowspan="2"><input type="checkbox">시간설정</td> <!-- 시간설정 체크 해제시 시간 input 사라지게 / 기본값: 체크설정-->
					        </tr>
					        <tr>
					            <th>종료일</th>
					            <td><input type="date" name="endDate"></td>
					            <td><input type="text" name="endTime"></td>
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
	        
	    </div>
	    
   </section>


</body>
</html>