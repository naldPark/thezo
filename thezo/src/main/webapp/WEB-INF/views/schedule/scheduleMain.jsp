<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>일정관리</title>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    
    <section>
    	<div class="outer">
			<%-- -- 일정관리 네비바 ------------------------------%>
            <jsp:include page="scheduleMenubar.jsp"/>

	    	<div id="main">
                <div class="w3-container">
                    <button id="openNav" class="w3-button w3-xlarge" onclick="w3_open()">&#9776;</button>
                    <div class="w3-container">
                        <%-- 캘린더 영역 --------------------------------------- --%>
                        <jsp:include page="fullcalendar.jsp"/>
                    </div>
                </div>
            </div>
        </div>
            <script>
            	
                function w3_open() {
                    document.getElementById("main").style.marginLeft = "200px";
                    document.getElementById("mySidebar").style.width = "200px";
                    document.getElementById("mySidebar").style.display = "block";
                    document.getElementById("openNav").style.display = 'none';
                }
                function w3_close() {
                    document.getElementById("main").style.marginLeft = "0%";
                    document.getElementById("calendar").width = "100%";
                    document.getElementById("mySidebar").style.display = "none";
                    document.getElementById("openNav").style.display = "inline-block";
                }
            </script>
	    
	    
   </section>
   
   


</body>
</html>