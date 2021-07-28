<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="resources/summernote-0.8.18-dist/summernote-lite.min.css" rel="stylesheet">
<script src="resources/summernote-0.8.18-dist/summernote-lite.js"></script>
<script src="resources/summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script>

<script>
  jQuery.noConflict();
  (function( $ ) {
    $(document).ready(function() {
            $('#summernote').summernote({
           	  // 에디터 높이
          	  height: 500,
          	  // 에디터 한글 설정
          	  lang: "ko-KR",
          	  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
          	  focus : true,
          	  disabledResizeEditor:true,
          	  toolbar: [
          		    // 글꼴 설정
          		    ['fontname', ['fontname']],
          		    // 글자 크기 설정
          		    ['fontsize', ['fontsize']],
          		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
          		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
          		    // 글자색
          		    ['color', ['forecolor','color']],
          		    // 표만들기
          		    ['table', ['table']],
          		    // 글머리 기호, 번호매기기, 문단정렬
          		    ['para', ['ul', 'ol', 'paragraph']],
          		    // 그림첨부, 링크만들기, 동영상첨부
          		    ['insert',['picture','link']],
          		    // 코드보기, 확대해서보기, 도움말
          		  ],
          		  // 추가한 글꼴
          		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
          		 // 추가한 폰트사이즈
          		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
          	
            });
          });
  })( jQuery );
 </script>
<style>


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
	<section>
	<div class="outer">

		<div class="innerOuter">
			<h2>
				<b>사내게시판</b>
				
	
			</h2>
			<br> <br>

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
                        <th><textarea class="form-control" name="summernote" id="summernote"></textarea></th>
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
				<br> <br>

			</form>

		</div>

	</div>
	</section>


</body>
</html>