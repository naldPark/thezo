<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<style>
#enrollForm>table {
	width: 80%;
}

#enrollForm>table * {
	margin: 5px;
}

.innerOuter {
	width: 1000px;
	margin: auto;
	padding: 5% 5%;
	background: white;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="outer">

		<div class="innerOuter">
			<h2>
				<b>사내게시판</b>
			</h2>
			<br>
			<br>

			<form id="enrollForm" method="post" action="" enctype="">
				<table align="center">
					<tr>
						<th><label for="title">제목</label></th>
						<td><input type="text" id="title" class="form-control"
							name="" required></td>
					</tr>
					<tr>
						<!--에디터 api 적용하자-->
						<th><label for="content">내용</label></th>
						<th><div id="summernote"></div></th>
					</tr>
					<tr>
						<th><label for="upfile">첨부파일</label></th>
						<td><input type="file" id="upfile"
							class="form-control-file border" name=""></td>
					</tr>
				</table>
				<br> <br>

				<div align="center">
					<!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
					<button type="submit" class="btn btn-secondary">등록</button>
					<button type="reset" class="btn btn-secondary">취소</button>
				</div>
				<br>
				<br>


				<script>
	                $(document).ready(function() {
	                        $('#summernote').summernote({
	                            lang: 'ko-KR',
	                            height: 300,
	                        });
	                        
	                });
	            </script>
		</div>

	</div>

</body>
</html>