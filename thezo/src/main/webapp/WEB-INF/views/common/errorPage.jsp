<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<style>
	#ErrorMessageArea{color: rgb(78, 78, 78); padding: 10px; border:1px solid lightgray; width: 70%}
</style>
<body>
<br>
	<section>
		<div class="outer" align="center" >
		    <div id="ErrorMessageArea">	
				<br><br>
		        <span style="font-size:80pt; "> <i class="fas fa-exclamation-triangle"> </i> Error</span>
		        <br><br>
		        <h2 style="font-weight:bold">${ errorMsg }</h2><br>
				<span>지속적인 에러가 발생하는 경우 관리자에게 문의 해 주시기 바랍니다</span>
				<br><br><br>
				<a class="btn btn-warning" href="main">메인으로 가기</a>
				<br><br><br>
		    </div>
		</div>
	</section>

</body>
</html>