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
	<!-- 나중에 include는 지울 예정입니다. 단지 오류페이지로 넘어왔을떄 페이지 이동을 편하게 하고자 넣었습니다. -->
    <jsp:include page="header.jsp"/>

	<section>
		<div class="outer">
		    <div align="center">	
		        <img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-512.png" width="300">
		        <br><br>
		        <h1 style="font-weight:bold">${ errorMsg }</h1>
		    </div>
		</div>
	</section>

</body>
</html>