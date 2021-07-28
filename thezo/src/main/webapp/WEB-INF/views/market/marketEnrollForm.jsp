<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include summernote css/js-->

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
    #marketUpdate>table{width:80%;}
    #marketUpdate>table *{ margin:5px;}
    .innerOuter{
            width: 1000px;
            margin:auto;
            padding:5% 5%;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<section>
	<!-- api 적용문제 해결하기 -->
		

<div class="outer">

    <div class="innerOuter">
        <h2><b>더조마켓</b></h2>
        <br><br>
        <div id="thumbnail"align="center">
            <img  id="titleImg"src="${ b.titleImg }" width="250" height="250"><br>
        </div>
        <br>


        <form id="marketUpdate" method="post" action="" enctype="">
            <table id="marketUpdate" align="center">
                <tr>
                    <th><label for="title">품명</label></th>
                    <td><input type="text" id="title" class="form-control" name="product" required><br></td>
                </tr>
                <tr>
                    <th><label for="price">가격</label></th>
                    <td><input type="text" id="title" class="form-control" name="price" required><br></td>
                </tr>
                <tr><!--에디터 api 적용하자-->
                    <th><label for="content">내용</label></th>
                    <th><div id="summernote"></div><br></th>
                </tr>
                <tr>
                    <th>사진첨부</th>
                    <td>
                        <div id="imgs"align="center">
                            <img id="contentImg1" width="200" height="200">
                            <img id="contentImg2" width="200" height="200">
                            <img id="contentImg3" width="200" height="200">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th><label for="upfile"></label></th>
                    <td>
                        <div id="file-area">
                            <input type="file" id="upfile" class="form-control-file border" name="file1"  onchange="loadImg(this, 1);" required>
                            <input type="file" id="upfile" class="form-control-file border" name="file2" onchange="loadImg(this, 2);">
                            <input type="file" id="upfile" class="form-control-file border" name="file3" onchange="loadImg(this, 3);">
                            <input type="file" id="upfile" class="form-control-file border" name="file4" onchange="loadImg(this, 4);">
                        </div>
                    </td>
                    
                </tr>
            </table>
            <br><br>

            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
                <button type="submit" class="btn btn-secondary">등록</button>
                <button type="reset" class="btn btn-secondary">취소</button>
            </div><br><br>

        </form>    

        <script>
        
            $(function(){
                $("#file-area").hide();
                    
                 $("#titleImg").click(function(){
                    $("#file1").click();
                })
                $("#contentImg1").click(function(){
                    $("#file2").click();
                })
                $("#contentImg2").click(function(){
                    $("#file3").click();
                })
                 $("#contentImg3").click(function(){
                    $("#file4").click();
                })
            })
            

            function loadImg(inputFile, num){
                    // inputFile : 현재 변화가 생긴 input type="file" 요소객체
                    // num : 몇번째 input요소인지 확인 후 해당 그영역에 미리보기하기위해서

                    //console.log(inputFile.files.length);
                
                if(inputFile.files.length == 1){ 
                        // 선택된 파일이 존재할 경우 
                        // => 선택된 파일을 읽어들여서 그 영역에 맞는 곳에 미리보기
                        
                        // 파일을 읽어들일 FileReader 객체 생성
                    var reader = new FileReader();
                        
                        // 파일을 읽어들이는 메소드 => 해당 파일을 읽어들이는 순간 해당 그 파일만의 고유한 url 부여됨
                    reader.readAsDataURL(inputFile.files[0]);
                        
                        // 파일 읽기가 다 완료되었을 때 실행할 함수를 정의
                    reader.onload = function(e){
                            // 각 영역에 맞춰서 이미지 미리보기
                        switch(num){
                        case 1: $("#titleImg").attr("src", e.target.result); break;
                        case 2: $("#contentImg1").attr("src", e.target.result); break;
                        case 3: $("#contentImg2").attr("src", e.target.result); break;
                        case 4: $("#contentImg3").attr("src", e.target.result); break;
                        }
                    }
                        
                }else{ // 선택된 파일이 사라졌을 경우 => 미리보기 사라지게
                    switch(num){
                    case 1: $("#titleImg").attr("src", null); break;
                    case 2: $("#contentImg1").attr("src", null); break;
                    case 3: $("#contentImg2").attr("src", null); break;
                    case 4: $("#contentImg3").attr("src", null); break;
                    }
                }
                    
                }
            </script>



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
	</section>

</body>
</html>