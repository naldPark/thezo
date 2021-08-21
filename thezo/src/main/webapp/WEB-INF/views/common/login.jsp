<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!-- @Author Jaewon.s (기초 뼈대만)-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheZo Login</title>
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
           <br> <label>Id</label>
            
          </div>
          <div class="user-box">
            <input type="password" name="memPwd" value="pass01" required>
           <br> <label>Password</label>
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