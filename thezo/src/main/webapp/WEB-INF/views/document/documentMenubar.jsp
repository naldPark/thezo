<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#nav{width: 200px; height: 800px; margin: 0; float: left; background-color:rgb(236, 236, 236);	box-sizing: border-box;}
	#nav button{margin: 10px;}
	#nav a{color: black;}
	#nav ul{list-style-type: none; padding-left: 20px;}
	.subject{font-size: x-large;text-align: center;}
	.chMenu{color: rgb(243,156,18);}
</style>
</head>
<body>
	<div id="nav">
		<br>
		<div class="subject">
			<i class='fas fa-archive' style='font-size:20px'></i>
			<b>문서양식</b> 
			
		</div>
		
		<hr>
		<ul align="left">
			<b><a href="list.doc"><li class="chMenu">공용 문서양식</li></a></b>
			
			<label for="depDoc">
				<li id="depDoc">부서별 문서양식</li>
			</label>
			<!-- 클릭 시 부서별 게시판 이름이 나오게 -->
	
			<!-- 홈페이지에서 생성하게 할 수 있을까?-->
			<!-- 각각 a링크를 주지말고 category=""의 조건을 줘서 조회되게 -->
			<ul>
				<a href=""><li>재무팀</li></a>
				<a href=""><li>영업팀</li></a>
				<a href=""><li>총무팀</li></a>
			</ul>
		</ul>

		<!-- 사용자가 관리자라면 -->
		<hr>
		<button class="btn btn-primary" style="width: 180px;" align="center">
			부서?카테고리? 추가
		</button>
	</div>
	
</body>
</html>