<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	
   	 <section>
        <div class="outer">
	  	          해당 영역에서 자유롭게!!!!!!!!!!! <br>
	        <br>
	       	 화면 구현해주시면 됩니다!!!! <br> 
			시작할떄!!! div class ="outer"  <br>
			만 주시고 시작하시면 됩니다!!!  <br>
			   
			section태그 생성 후에 그안에 하위요소로 div(class="outer")주시고 
			이영역 안에서 자유롭게 만들어주시면됩니다!!!! 
			body태그안에서 작업한다 생각하시고 화면 구현하시면 됩니다!!! 
        </div>
    </section>
	
	
	<!-- Session영역의 로그인에 따라서 !!! 보여지는 메인페이지가 다르다. -->
	<!-- 다만 이번에는 semi때처럼 메인페이지에서는 조건문 처리를 할수밖에 없다. 
	다만 메인페이지 말고는! 모든 권한 처리는 interceptor이용해보자! -->
	
	<!-- 이부분은 얘기를 해봐야한다. 
		아예 main Page를 사용자단 관리자단 이렇게 2개로 분리를 해버릴것인지 혹은 
		하나의 main페이지로 갈것인지
		
		메인페이지를 분리를 하면 ! 영역이 나뉘기에 작업하는데 용이하며! 
		하나의 파일 (jsp)관리하는데 효율적이다. 
		<또한 interceptor를 이용하면 login후에 controller에서 DispatcherServlet 넘어갈떄 
		페이지를 다르게 넘길수 있다.>
		
		합친다면 소스코드가 너무 비대해질수는 있지만 (이게 배운 기존의 방식)
	 -->
</body>
</html>