<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- @author Jaewon.s -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>Insert title here</title>
<style>
	.outer{height: 615px; padding-top: 35px; display: flex; justify-content: space-between;}
	.left-section{width: 175px;}
	.main-section{width: 975px;
		border: 1px solid black;
	}


</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<script>
		document.getElementById("admin-header").style.display ="block"; 
        document.getElementById("admin-mode").style.color = "red";
	</script>

	<section>
		<div class="outer" style="width: 1170px;">
			<div class="left-section">
				<jsp:include page="../common/adminMessangerVerticalNav.jsp"/>
			</div>
			<div class="main-section">
				<h2><b>&nbsp;알림 등록 및 기록</b></h2>
			</div>
		
		</div>
	</section>
</body>
</html>