<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>thezo</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="resources/css/apprAmail.css">
	<style>
    /* *{border:1px solid red} */
	</style>
</head>
<body>

<nav class="w3-sidebar w3-white" style="width:200px;"><br>
  <div class="w3-bar-block">
    <br><br><br><br>
    <a type="button" href="enrollForm.mail" class="btn btn-primary">메일쓰기</a>
    <button type="button" class="btn btn-primary">내게쓰기</button>
    <br><br>
    <a href="new.appr" class="w3-bar-item w3-button w3-padding"><i class="fas fa-envelope"></i> 받은편지함</a>
    <a href="new.appr" class="w3-bar-item w3-button w3-padding"><i class="fas fa-paper-plane"></i> 보낸편지함</a>
    <a href="new.appr" class="w3-bar-item w3-button w3-padding"><i class="fas fa-inbox"></i> 임시보관함</a>
    <a href="new.appr" class="w3-bar-item w3-button w3-padding"><i class="fas fa-ban"></i> 스팸메일함</a>
    <a href="new.appr" class="w3-bar-item w3-button w3-padding"><i class="fas fa-trash-alt"></i> 휴지통</a>
    <a class="w3-bar-item w3-button w3-padding" onclick="extend('receiveDocu')"><i class="far fa-caret-square-down"></i>  개인보관함</a>
    <div id="receiveDocu" class="w3-bar-block w3-hide w3-white w3-show">
      <a href="#" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"> </i> &nbsp;&nbsp;개인보관1</a>
      <a href="#" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"> </i> &nbsp;&nbsp;개인보관2</a>
    </div>
  
    <hr>
    <small>전체 10GB중 7GB 사용 했습니다.</small><br><br>
    <div class="progress" style="width:80%">
      <div class="progress-bar" style="width:70%">70%</div>
    </div>
  </div>
</nav>


<script>
  function extend(type) {
    
    var x = document.getElementById(type);
    if (x.className.indexOf("w3-show") == -1) {
      x.className += " w3-show";
      x.previousElementSibling.className += " w3-blue-grey";
    } else { 
      x.className = x.className.replace(" w3-show", "");
      x.previousElementSibling.className = 
      x.previousElementSibling.className.replace(" w3-blue-grey", "");
    }
  }
 
  </script>
</body>
</html>