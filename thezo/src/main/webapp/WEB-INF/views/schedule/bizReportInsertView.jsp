<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무 보고 등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="insert.bizRep" method="post" enctype="multipart/form-data" style="font-family:'Noto Sans KR', sans-serif;">
		<input type="hidden" name="scNo" value="${ scNo }">
		<input type="hidden" name="memNo" value="${ loginUser.memNo }"> <!-- 현재 로그인한 유저 아이디 전달 -->
		<br>
        <h4 class="modal-title">업무 보고 하기</h4>
		<hr>
	    <table id="repInfo" align="center">
	 		<tr> 
				<th width='120px'>제목</th> 
				<td width='250px'><input type="text" name="reportTitle" placeholder="제목을 입력해주세요"></td> 
		    </tr> 
		    <tr> 
		 	  	<th>보고서 작성자</th> 
		 	  	<td><input type="text" name="reportWriter" value="${ loginUser.memId }" readonly></td> 
		    <tr> 
 	 			<th>내용</th> 
		 	  	<td>
		 	  		<textarea name="reportContent" cols="45" rows="10" placeholder="내용을 입력해주세요" style="resize:none;"></textarea>
		 	  	</td> 
		    </tr> 
		    <tr> 
		 	  	<th>첨부파일</th> 
		 	  	<td><input type="file" name="upfile"></td>
		    </tr> 
		</table>
	    <hr>
		<div class="button-area" align="center">
			<button class="btn btn-secondary" onclick="window.close();">취소</button>
			<button class="btn btn-primary" type="submit">저장</button>
		</div>
	</form>
</body>
</html>