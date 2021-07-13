<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

	<script>
	    document.getElementById("admin-header").style.display ="block"; 
        document.getElementById("admin-mode").style.color = "red";
	</script>

	<section>
		<div class="outer">
		
			관리자 쪽지 신고 페이지 
		
		</div>
	</section>
</body>
</html>