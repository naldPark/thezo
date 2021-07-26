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
            			
	    	
	   		<%-- 캘린더 영역 --------------------------------------- --%>
			<jsp:include page="fullcalendar.jsp"/>
	        
	    </div>
	    
   </section>
   
   


</body>
</html>