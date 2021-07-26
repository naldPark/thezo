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
	.notification-innerline button{ width: 66px; height: 28px; color: white; font-size: 12px; font-weight: bold; margin-top: 10px; margin-left: 50% ; border: none; border-radius: 3px; transform: translate(-50%); background-color: rgb(52,152,219);}
	.notification-innerline button:hover{ border: 1px solid rgb(243,156,18); color: rgb(243,156,18);}
	/*  ↑  건들지 않아도됨 */
	
	/* 구현할 영역!! */
	.notification-mainbox{width: 300px; max-height: 610px; margin: auto; font-family:'Noto Sans KR', sans-serif; background-color: white; overflow: auto;}
	.notification-mainbox::-webkit-scrollbar {width: 10px;}
	.notification-mainbox::-webkit-scrollbar-thumb {border: 2px solid transparent; border-radius: 5px; background-clip: padding-box; background-color: rgb(241,197,7);}
	.notification-mainbox::-webkit-scrollbar-track {border-radius: 5px; box-shadow: inset 0px 0px 5px white; background-color: lightgrey;}
	.notification-outerbox{width: 100%; margin-bottom: 5px; border: 2px solid white;}
	.nf-header{width: 100%; height: 50px; line-height: 50px; background-color: rgb(247,191,101);}
	.nf-header>i{color: white; font-size: 30px; margin-left: 20px;}
	.nf-header>span{font-size: 24px; font-weight:bolder; padding-left: 40px;}	
	.nf-body{padding: 10px;}
	.nf-body pre{margin: 0px; font-family:'Noto Sans KR', sans-serif;}
</style>

</head>
<body>
	<div class="notification-mainbox">
		<!-- 동적으로 값들이 생성되야 한다.  -->

		<!-- 여기가 알림 div들이 생기는 곳이다.  반복문 돌리는데 일단 하나를 만들자 -->
		<div class="notification-outerbox">
			<div class="nf-header">
				<i class="fas fa-lightbulb"></i>
				<span> 개발부서 알림 </span>
			</div>
			<div class="nf-body">
				<p>일정 : <span> 2021- 07- 04 ~ 2021- 07- 04</span></p>
				<pre>i회의실에서 
22시에 회의 있습니다.</pre>
			</div>
		</div>
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