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
	#nav{
	    width: 200px;
        height: 1000px; 
	    margin: 0;
	    float: left;
        background-color:rgb(219, 219, 219);
        box-sizing: border-box;
	}
	
	#nav button{
        margin: 10px;
    }

    #nav a{
        margin: 20px;
        color: black;
    }
    
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
            <div id="nav">
                <br>
                <button class="btn btn-primary" style="width: 180px;" align="center">예약하기</button>
                <a href="myList.rez">나의 예약 목록</a> <br>
                <b><a href="con.rez">회의실</a></b> <br>
                <a href="sup.rez">비품</a> <br>
                <a href="car.rez">차량</a> <br>

                <hr>

                <button class="btn btn-primary" style="width: 180px;" align="center">자원 관리하기</button>
            </div>
	                <%--
	                	관리자가 자원을 추가, 관리할 수 있도록 해놓았는데,
	                	그럼 메뉴바에서도 카테고리가 동적으로 추가되고, 삭제되어야 함.
	                	=> 새로 추가된 자원 분류에 대해서도 매핑값을 각각 주어야 한다.
	                	=> 이걸 동적으로 가능할까?..
	                 --%>
	    	<%-- 여기까지 예약관리 네비바 --------------------------------------------------- --%>
	    	
	    	<div id="calendar"></div>
	    	
	    	
	    </div>
    </section>
</body>
</html>