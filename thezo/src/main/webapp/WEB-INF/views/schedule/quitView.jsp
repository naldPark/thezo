<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${!empty alertMsg }">
		<script>	
			alert("${alertMsg}");
			self.close();
		</script>
        <!-- 뭔가가 담겨있는 경우 -->	
		<c:remove var="alertMsg" scope="session"/>	
	</c:if>
</body>
</html>