<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무 보고 수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>
	.report-area{width: 80%; margin:0 auto; text-align: center; border: 1px solid black; padding: 30px;}
	table th{height:50px;}
</style>
</head>
<body>
	<form action="update.bizRep" style="font-family:'Noto Sans KR', sans-serif;" method="post" enctype="multipart/form-data">
		<input type="hidden" name="scNo" value="${ sc.scNo }">
		<br>
		<div class="report-area w3-panel w3-border w3-round text-left">
		    <!-- 보고서 영역 -->
			<h4 class="modal-title">업무 보고 수정</h4>
			<hr>
			<table id="repInfo" align="center" class="text-left">
		 		<tr> 
					<th width='100px'>제목</th> 
					<td width='250px'><input class="w3-input w3-border w3-round" name="reportTitle" type="text" value="${ sc.reportTitle }"></td> 
			    </tr>
			    <tr>
			    	<th>최종 작성자</th>
			    	<td><input class="w3-input w3-border w3-round w3-light-grey" type="text" value="${ sc.reportWriter }" readonly></td>
			    	<input type="hidden" name="reportWriter" value="${ loginUser.memNo }">
			    </tr>
			    <tr> 
	 	 				<th>내용</th> 
			 	  	<td>
			 	  		<textarea class="w3-border w3-round" name="reportContent" cols="45" rows="10" style="resize: none;" required>${ sc.reportContent }</textarea>
			 	  	</td> 
			    </tr> 
			    <tr> 
			 	  	<th><label for="upfile">첨부파일</label></th>
					<td>
						<input type="file" id="upfile" class="form-control-file border" name="reupfile">
							<b>현재 업로드된 파일</b> <br>
						<a href="${ sc.originName }" download="${ sc.changeName }" id="file1">${ sc.originName }</a>
						<input type="hidden" name="originName" id="originName">
						<input type="hidden" name="changeName" id="changeName">
					</td>
			    </tr> 
			</table>
			<br>
			<div class="button-area" align="center">
				<button class="btn btn-secondary" onclick="window.close();">취소</button>
				<button class="btn btn-primary" type="submit">저장</button>
			</div>
		</div>
	</form>
</body>
</html>