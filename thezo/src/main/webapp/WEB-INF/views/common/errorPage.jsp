<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous"> 
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>
<style>
	body,h1 {font-family: "Raleway", Arial, sans-serif}
	h1 {letter-spacing: 6px}
	.w3-row-padding img {margin-bottom: 12px}
	.w3-half{ 
		display: flex; height: 400px;}
	.far{font-size: 35pt; color: rgb(20,70,104)}
</style>
	<body>
		<div class="w3-content mt-5" style="max-width:1000px;">
			<div class="w3-panel w3-center w3-opacity "
				style="padding:38px 16px; border: 0.5px solid lightgrey;margin: 50px">
				<h1 class="w3-xlarge">Ooooops !</h1>
				<h1>Something wrong here ....</h1>
				<br>
				<div class="w3-panel w3-light-grey">
					<p class="w3-large"
						style="font-size: 18pt!important;font-family: font-family: 'Noto Sans KR', sans-serif;">
						<i class="far fa-sad-tear" style="font-size: 20pt; color: rgb(104, 103, 103)"></i>
						${errorMsg}
					</p>
				</div>

				<div class="w3-row-padding" style="margin-bottom:78px">
					<div class="w3-half">
						<img src="resources/images/error.gif" style="width:70%">
					</div>
					<div class="w3-half">
						<div style="margin: auto 0; font-size: 17pt">
							<i class="far fa-dizzy"></i>&nbsp;
							<i class="far fa-tired"></i>&nbsp;
							<i class="far fa-meh-rolling-eyes"></i>&nbsp;
							<i class="far fa-sad-tear"></i>&nbsp;
							<i class="far fa-sad-cry"></i><br><br>
							<span style="font-family: 'Gamja Flower', cursive; font-size:30pt">ㅇㅊㅊ...!! <br> 에러가
								발생했습니다....</span> <br><br>
						</div>
					</div>
					<a class="w3-border w3-border-purple w3-btn w3-round-xxlarge" style="border:0.5px solid rgb(20,70,104)" href="main">메인으로 가기</a>
				</div>
			</div>
		</div>
	</body>
</html>
	