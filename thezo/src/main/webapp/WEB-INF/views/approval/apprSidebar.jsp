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
	</style>
</head>
<body>

<nav class="w3-sidebar w3-light-grey" style=" width:200px;" id="mySidebar"><br>
  <div class="w3-bar-block">
    <a href="../main/mainPage.jsp" class="w3-bar-item w3-button w3-padding"><i class="fas fa-folder"></i> &nbsp; 결제 HOME</a><br>
    <a href="new.appr" class="w3-bar-item w3-button w3-padding"><i class="far fa-minus-square"></i>  신규작성</a>
    <a class="w3-bar-item w3-button w3-padding" onclick="extend('sendDocu')"><i class="far fa-caret-square-down"></i>  결재상신함</a>
    <div id="sendDocu" class="w3-bar-block w3-hide w3-white w3-show">
      <a href="#" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"></i> &nbsp;&nbsp;상신문서</a>
      <a href="#" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"></i> &nbsp;&nbsp;완료문서</a>
      <a href="#" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"></i> &nbsp;&nbsp;임시저장</a>
    </div>
    <a class="w3-bar-item w3-button w3-padding" onclick="extend('receiveDocu')"><i class="far fa-caret-square-down"></i>  결재수신함</a>
    <div id="receiveDocu" class="w3-bar-block w3-hide w3-white w3-show">
      <a href="#" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"> </i> &nbsp;&nbsp;결재대기</a>
      <a href="#" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"> </i> &nbsp;&nbsp;결재내역</a>
      <a href="#" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"> </i> &nbsp;&nbsp;수신참조</a>
    </div>
    <a class="w3-bar-item w3-button w3-padding" onclick="extend('personalDocu')"><i class="far fa-caret-square-down"></i>  개인보관함</a>
    <div id="personalDocu" class="w3-bar-block w3-hide w3-white w3-show">
      <a href="#" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"></i> &nbsp;&nbsp;뭘넣을까</a>
      <a href="#" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"></i> &nbsp;&nbsp;뭘넣을까</a>
      <a href="#" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"></i> &nbsp;&nbsp;뭘넣을까</a>
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