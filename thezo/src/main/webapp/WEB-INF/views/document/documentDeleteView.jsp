<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal" id="deleteDoc">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
	                <b class="modal-title">삭제 확인</b>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                	선택한 게시글을 삭제하시겠습니까? <br>
                	<b>*선택한 글이 삭제되고, 복구할 수 없습니다.</b>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                	<form action="delete.doc">
                		<!-- 글번호 -->
	                    <div class="button-area">
	                        <button type="submit" class="btn btn-danger">삭제</button>
	                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	                    </div>
                    </form>
                </div>
        
            </div>
        </div>
    </div>
</body>
</html>