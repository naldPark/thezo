<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>Insert title here</title>
</head>
<body>
	<%-- 좀더 빠르게 찾기 위해서!!! scope영역까지 지정!   --%>
	<%-- JSTL 구문은 !!!! 무조건 ! 스크립틀릿 주석문으로 처리할것 !!! 아니면 !!! 백빵 오류나요!!!  --%>
	<c:choose>
		<c:when test="${empty sessionScope.loginUser}">
			<jsp:forward page="WEB-INF/views/common/login.jsp"/>				
		</c:when>
		<c:when test="${sessionScope.loginUser.userId eq 'admin'}">
			<jsp:forward page="WEB-INF/views/common/adminMain.jsp"/>						
		</c:when>
		<c:otherwise>
			<jsp:forward page="WEB-INF/views/main.jsp"/>
		</c:otherwise>
	</c:choose>
</body>
</html>