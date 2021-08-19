<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!-- @Author Jaewon.s (기초 뼈대만)-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheZo Login</title>
<style>
    .outer{width: 320px; height: 620px;margin: auto;}
    #biglogo-area{display: flex; justify-content: center; padding-top: 68px;}
    #biglogo-area>img{width: 92%; margin-left: 18px;}
    .middle-area{text-align: center; padding-top: 12px;}
    .middle-area>span:nth-child(1){ color: black; font-size: 36px; font-weight: bold; transform: translateY(-10px);}
    .middle-area>span:nth-child(2)>img{width: 50px; transform: translateY(10px);}
    #form-area>table{width: 280px; margin: auto; margin-top: 5px; }
    #form-area div{border: 1px solid rgb(200,200,200); border-radius: 5px; margin: 5px; width: 275px; height: 42px; display: block;  overflow: hidden;}
    #form-area span{width: 55px ; height: 100%; display: inline-block; background-color: rgb(237,237,237) ;}
    #form-area span>img{ width: 45px; height: 42px; margin-left: 5px; margin-top: 1px;}
    input:focus{outline: none;}
    input{height:30px}
    #form-area input{border: none; height: 42px; transform: translateY(-16px); width: 210px;}
    #form-area button{width: 100%; height: 36px; color: white;  font-size: 16px; font-weight: 400; border: none; border-radius: 4px; margin-top: 15px; background-color:rgb(44,62,80) ;}
    /* 임시로 만들어 놓은 페이지 입니다. 
        해당 영역 구현하시는 분이라면!!! 여기 싹다 지우고 편하게 작성하시면 됩니다!!! 

        단지 처음 ! main페이지 가기전에 로그인 조건검사용으로 넣어둔 페이지입니다!! 
    */
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="resources/css/login.css">

</head>
<c:if test="${!empty alertMsg }">
	<script>	
		alert("${alertMsg}");
	</script>
       <!-- 뭔가가 담겨있는 경우 -->	
	<c:remove var="alertMsg" scope="session"/>	
</c:if>


<body>

    <div class="login-box">
        <h2><img src="resources\images/logo.png" style="width:50px; margin-right: 20px;">Login</h2>
        <form action="login.me" method="POST" id="submitLogin">
          <div class="user-box">
            <input type="text" name="memId" value="" required>
            <label>Id</label>
          </div>
          <div class="user-box">
            <input type="password" name="memPwd" value="" required>
            <label>Password</label>
          </div>
          <a href="#" id="loginBtn">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            로그인
          </a>
        </form>
      </div>

      <script>
          $("#loginBtn").click(function(){
          $("#submitLogin").submit();
          })
      </script>
</body>
</html>