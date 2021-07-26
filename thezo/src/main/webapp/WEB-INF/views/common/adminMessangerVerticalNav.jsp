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
	.vertical-nav{width: 175px; height: 230px; border-radius: 2px; background-color: rgb(20,70,104);}
	.vertical-nav>p{color: white; font-size: 36px; font-weight: bold; text-align: center; padding: 10px 0px;}
	.menubox{width: 165px; height: 135px; margin: auto; padding: 25px 15px; border-radius: 1px; background-color: white;}
	.menubox>a{color: gray; font-size: 17px; font-weight: bold; line-height: 45px; text-decoration: none; display: inline-block}
	.menubox>a:hover{color: orangered; font-size: 18px; letter-spacing: -0.3px; text-decoration: none;}	
	.menubox a:nth-child(${requestScope.subPage}){color: orange; font-weight: bold;}
</style>
</head>
<body>
	<div class="vertical-nav">
		<p>메신저</p>
		<div class="menubox">
			<a href="list.adms">- 쪽지 신고처리</a>
			<a href="list.adnf">- 알림등록 및 기록</a>
		</div>
	</div>
</body>
</html>