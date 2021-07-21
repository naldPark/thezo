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

<nav class="w3-sidebar" style="width:160px;"><br>
  <div class="w3-bar-block">
    <a href="adminMain.appr" class="w3-bar-item w3-button w3-padding"><i class="fas fa-folder"></i> &nbsp; 결제 HOME</a>
    <a href="new.appr" class="w3-bar-item w3-button w3-padding"><i class="far fa-minus-square"></i>  신규양식</a>
    <a class="w3-bar-item w3-button w3-padding" onclick="extend('sendDocu')"><i class="far fa-caret-square-down"></i>  양식관리</a>
    <div id="sendDocu" class="w3-bar-block w3-hide w3-show">
      <a href="reportDocu.appr" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"></i> &nbsp;&nbsp;전체</a>
      <a href="reportFinDocu.appr" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"></i> &nbsp;&nbsp;사용중</a>
      <a href="tempDocu.appr" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"></i> &nbsp;&nbsp;미사용</a>
    </div>
    <a class="w3-bar-item w3-button w3-padding" onclick="extend('receiveDocu')"><i class="far fa-caret-square-down"></i>  문서관리</a>
    <div id="receiveDocu" class="w3-bar-block w3-hide w3-show">
      <a href="waiting.appr" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"> </i> &nbsp;&nbsp;전체</a>
      <a href="approved.appr" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"> </i> &nbsp;&nbsp;진행중</a>
      <a href="reference.appr" class="w3-bar-item w3-button ml-2"><i class="far fa-folder-open"> </i> &nbsp;&nbsp;완료</a>
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