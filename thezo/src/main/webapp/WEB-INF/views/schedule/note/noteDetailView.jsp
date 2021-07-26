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
    .detail-area{width: 950px; height:1000px; float:left;}
    .note-area{width: 100%; margin:0 auto; margin-left:50px; border:black 1px solid; padding: 30px;}
    .button-area{text-align: center;}
    .backNt{color:rgb(110, 110, 110); margin: 10px; padding: 10px;}
    .noteTitle{font-weight: bold; font-size: large;}
</style>
</head>
<body>
	<!-- 메뉴바 -->
    <jsp:include page="../../common/header.jsp"/>
	<section>
	    <div class="outer">
	        <jsp:include page="noteMenubar.jsp"/>
	        
	        
	        <div class="detail-area">
                <br>
                &nbsp; &nbsp; &nbsp;
                <a href="list.note" class="backNt"><i class='far fa-arrow-alt-circle-left' style='font-size:20px'></i> 노트목록으로 돌아가기 </a>
                <br><br>
                <div class="note-area w3-panel w3-border w3-round">
                    <br>
                    <form class="w3-container" action="update.note" method="POST">

                        <input type="hidden" value="${ loginUser.userId }">
                        <input class="noteTitle w3-input w3-animate-input" name="noteTitle" style="width:70%" type="text" value="7월 12일에 진행한 회의 보고서 작성하기!!!">
                        <br>
<textarea class="w3-input w3-border w3-animate-input" name="noteContent" style="width:100%; height: 400px; resize: none;" placeholder="내용을 입력하세요">노트내용 드루와 
theZo프로젝트 보고서 작성
- 노트 기능 
- 이거면 되나 
- ㅠㅠㅠ</textarea>
                        <br>
                        <hr>
                        <br>
                        <b>관련일정</b> <a href="관련일정url"> >>바로가기 </a>
                        <p class="noteSc">2021/07/12 theZo 프로젝트 회의</p>

                        <br>
                        <div class="button-area">
                            <button type="submit" class="btn btn-primary">저장</button>
                            <button class="btn btn-danger" data-toggle="modal" data-target="#delete">삭제</button>
                        </div>
                        <br>
                    </form>
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
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <div class="button-area">
                        <a href="delete.note" class="btn btn-danger">삭제</a>
                        <button class="btn btn-secondary"data-dismiss="modal">취소</button>
                    </div>
                </div>
        
            </div>
        </div>
    </div>

    
    
</body>
</html>