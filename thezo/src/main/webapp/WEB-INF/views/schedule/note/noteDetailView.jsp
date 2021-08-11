<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>노트 상세</title>
<style>
    div{box-sizing: border-box;}
    .detail-area{width: 100%; height:1000px; float:left;}
    .note-area{width: 100%; margin:0 auto; margin-left:50px; border:black 1px solid; padding: 30px;}
    .button-area{text-align: center;}
    .backNt{color:rgb(110, 110, 110); margin: 10px; padding: 10px;}
    .noteTitle{font-weight: bold; font-size: large;}
    .sc-area{font-size:18px;}
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
	<!-- 메뉴바 -->
    <jsp:include page="../../common/header.jsp"/>
	<section>
	    <div class="outer">
	        <jsp:include page="noteMenubar.jsp"/>
	        <div class="detail-area">
	        	<div id="main">
                	<button id="openNav" class="w3-button w3-xlarge" onclick="w3_open()">&#9776;</button>
	                <br>
	                &nbsp; &nbsp; &nbsp;
	                <a href="list.note?memNo=${ loginUser.memNo }" class="backNt"><i class='far fa-arrow-alt-circle-left' style='font-size:20px'></i> 노트목록으로 돌아가기 </a>
	                <br><br>
	                <div class="note-area w3-panel w3-border w3-round">
	                    <br>
	                    <form class="w3-container" action="update.note" method="POST">
	
	                        <input type="hidden" name="noteWriter" value="${ loginUser.memNo }">
	                        <input type="hidden" name="noteNo" value="${ nt.noteNo }">
	                        <input class="noteTitle w3-input w3-animate-input" name="noteTitle" style="width:70%" type="text" value="${ nt.noteTitle }">
	                        <br>
							<textarea class="w3-input w3-border w3-animate-input" name="noteContent" style="width:100%; height: 400px; resize: none;" placeholder="내용을 입력하세요">${ nt.noteContent }</textarea>
	                        <br><hr><br>
	                        
	                        
	                        <div class="sc-area">
	                        	<b>관련일정 상세보기</b>
		                        <br>
		                        <c:choose>
		                        	<c:when test="${ !empty nt.noteSc }">
		                        		<a id="noteSc" onclick="noteSc();" class="noteSc" style="cursor:pointer;">
		                        			<b>${ sc.start } &nbsp; ~ &nbsp; ${ sc.end } &nbsp; ${ sc.title }</b>
		                        		</a>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<b>선택안함</b>
		                        	</c:otherwise>
		                        </c:choose>
	                        </div>
	                        
	                        
	                        
	                        <script>
	                        	function noteSc(){
	                        		var option = "width = 700, height = 700, top = 100, left = 200, location = no";
			        				window.open("detail.sc?scNo=" + '${ nt.scNo }', "일정상세정보", option);
	                        	}
	                        </script>
	                        
	
	                        <br>
	                        <div class="button-area">
	                            <button type="submit" class="btn btn-primary">저장</button>
	                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delete">삭제</button>
	                        </div>
	                        <br>
	                    </form>
	                </div>
                </div>
            </div>
	    </div>
	</section>
    <!-- 삭제 확인 모달창 -->
    <div class="modal" id="delete">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <b class="modal-title">삭제 확인</b>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                   	해당 노트를 삭제하시겠습니까? <br>
                    <b>* 해당 노트가 삭제되고 복구가 불가능합니다.</b>
                </div>
                
        		<form action="delete.note">
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                    <div class="button-area">
	                    	<input type="hidden" name="noteNo" value="${ nt.noteNo }">
	                    	<input type="hidden" name="memNo" value="${ loginUser.memNo }">
	                        <button type="submit" class="btn btn-danger">삭제</button>
	                        <button class="btn btn-secondary"data-dismiss="modal">취소</button>
	                    </div>
	                </div>
        		</form>
        		
            </div>
        </div>
    </div>

    
    
</body>
</html>