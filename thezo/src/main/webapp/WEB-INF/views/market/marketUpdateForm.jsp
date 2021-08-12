<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>d

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
    .innerOuter{
            width: 1000px;
            margin:auto;
            padding:5% 5%;
    }
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	<section>
		
    <div class="outer">

        <div class="innerOuter">
            <h2><b>더조마켓</b></h2>
            <br><br>
          
            <form id="marketUpdate" method="post" action="marketUpdate.bo" enctype="multipart/form-data">
                <input type="hidden" name="marketNo" value="${ mk.marketNo }">
            	<div id="thumbnail"align="center">
		        	<div class="image-container">
					    <img style="width: 300px;" id="preview-image" src="${ mk.productImg }">
				    	<input style="display: block;" type="file" id="input-image" name="reupfile">
					</div>
		        </div>
		        <br>
	            <script type="text/javascript">
			        $(function(){
			            
			            $("#input-image").hide();
			            $("#preview-image").click(function(){
			                $("#input-image").click();
			            })
			        });
		        
			        function readImage(input) {
			            // 인풋 태그에 파일이 있는 경우
			            if(input.files && input.files[0]) {
			                // 이미지 파일인지 검사 (생략)
			                // FileReader 인스턴스 생성
			                const reader = new FileReader()
			                // 이미지가 로드가 된 경우
			                reader.onload = e => {
			                    const previewImage = document.getElementById("preview-image")
			                    previewImage.src = e.target.result
			                }
			                // reader가 이미지 읽도록 하기
			                reader.readAsDataURL(input.files[0])
			            }
			        }
			        // input file에 change 이벤트 부여
			        const inputImage = document.getElementById("input-image")
			        inputImage.addEventListener("change", e => {
			            readImage(e.target)
			        })
		        </script>
	        
                <table id="marketUpdate" align="center">
                    <tr>
                        <th><label for="title">품명</label></th>
                        <td><input type="text" id="title" class="form-control" name="marketTitle" value="${ mk.marketTitle }" required><br></td>
                    </tr>
                    <tr>
                        <th><label for="price">가격</label></th>
                        <td><input type="text" id="price" class="form-control" name="price" value="${ mk.price }" required><br></td>
                    </tr>
                    <tr>
                        <th><label for="status">상태</label></th>
                        <td>
                            <div class="select">
                                <select class="custom-select" name="marketSection" value="${ mk.marketSection }" style="width: 200px;">
                                    <option value="writer">판매중</option>
                                    <option value="title">거래완료</option>
                                </select>
                            </div>
                            <br>    
                        </td>
                    </tr>
                    <tr><!--에디터 api 적용하자-->
                        <th><label for="content">내용</label></th>
                        <th><textarea class="form-control" name="marketContent" id="summernote">${ mk.marketContent }</textarea></th>
                    </tr>
                </table>
                 <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
                <button type="submit" class="btn btn-secondary">수정</button>
                <button type="reset" class="btn btn-secondary">취소</button>
            	</div><br><br>
			</form>	

            </div>
        

    </div>
	</section>
	
</body>
</html>