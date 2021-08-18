<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<title>노트 작성</title>
<style>
    div{box-sizing: border-box;}
    .insert-area{width: 100%; height:1000px; float:left;}
    .note-area{width: 100%; margin:0 auto; margin-left:50px; border:black 1px solid; padding: 30px;}
    .button-area{text-align: center;}
    .backNt{color:rgb(110, 110, 110); margin: 10px; padding: 10px;}
    .noteTitle{font-weight: bold; font-size: large;}
</style>
<script>
	function w3_open() {
	    document.getElementById("main").style.marginLeft = "200px";
	    document.getElementById("mySidebar").style.width = "200px";
	    document.getElementById("mySidebar").style.display = "block";
	    document.getElementById("openNav").style.display = 'none';
	}
	function w3_close() {
	    document.getElementById("main").style.marginLeft = "0%";
	    document.getElementById("mySidebar").style.display = "none";
	    document.getElementById("openNav").style.display = "inline-block";
	}
</script>	
</head>
<body>

    <jsp:include page="../../common/header.jsp"/>
    <section>
        <div class="outer">
            <jsp:include page="noteMenubar.jsp"/>
            <br>
            <div class="insert-area">
	            <div id="main">
					<button id="openNav" class="w3-button w3-xlarge" onclick="w3_open()">&#9776;</button>
	                <br>
	                &nbsp; &nbsp; &nbsp;
	                <a href="list.note?memNo=${ loginUser.memNo }" class="backNt"><i class='far fa-arrow-alt-circle-left' style='font-size:20px'></i> 노트목록으로 돌아가기 </a>
	                <br><br>
	                <div class="note-area w3-panel w3-border w3-round">
	                    <br>
	                    <form class="w3-container" action="insert.note">
	
	                        <input type="hidden" name="noteWriter" value="${ loginUser.memNo }">
	                        <input class="noteTitle w3-input w3-animate-input" name="noteTitle" style="width:70%" type="text" placeholder="제목 없음">
	                        <br>
	                        <textarea class="w3-input w3-border w3-animate-input" name="noteContent" style="width:100%; height: 400px; resize: none;" placeholder="내용을 입력하세요"></textarea>
	                        <br>
	                       	* 관련일정을 선택하세요 <br>
	                        <select class="w3-select" name="noteSc" style="font-size:15px;">
	                        	<option value="" selected>선택안함</option>
	                        	<c:forEach var="sc" items="${ scList }">
	                            	<option value="${ sc.scNo }">
	                            		${ sc.start } &nbsp; ~ &nbsp; ${ sc.end } &nbsp;
	                            		${ sc.title }
	                            	</option>
	                            </c:forEach>
	                        </select>
							
							
	                        <br><br><br>
	                        <div class="button-area">
	                            <button type="reset" onclick="back();" class="btn btn-secondary">취소</button>
	                            <button type="submit" class="btn btn-primary">등록</button>
	
	                            <script>
	                                function back(){
	                                    location.href = "javascript:history.back();";
	                                }
	                            </script>
	                        </div>
	                        <br>
	                    </form>
	                </div>
	            </div>
			</div>
        </div>
    </section>
</body>
</html>