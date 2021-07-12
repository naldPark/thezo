<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>Insert title here</title>
<style>
	.notification-innerline button{ width: 66px; height: 28px; color: white; font-size: 12px; font-weight: bold; margin-top: 10px; margin-left: 50% ; border: none; border-radius: 3px; transform: translate(-50%); background-color: rgb(52,152,219);}
	.notification-innerline button:hover{ border: 1px solid rgb(243,156,18); color: rgb(243,156,18);}
	/*  ↑  건들지 않아도됨 */

	/* 구현할 영역!! */
	.notification-mainbox{
		width: 300px;
		height: 640px;
		margin: auto;
		background-color: white;
	}

</style>

</head>
<body>
	<div class="notification-mainbox">
		<!-- 동적으로 값들이 생성되야 한다.  -->
	</div>
	<button type="button" onclick="testClose(this);">알림 확인</button>



	<!-- ajax scrpit 영역 -->
	<script>
		// 나중에 ! ajax 처리하고 실행한 스크립트
		function testClose(btnel){
			var el = $(btnel).parent().parent();
			console.log(el);
			el.css("display","none");

		}

	</script>

</body>
</html>