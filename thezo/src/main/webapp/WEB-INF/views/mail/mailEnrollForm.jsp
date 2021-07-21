<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="resources/summernote-0.8.18-dist/summernote-lite.min.css" rel="stylesheet">
<script src="resources/summernote-0.8.18-dist/summernote-lite.js"></script>
<script src="resources/summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script>
<script>
  jQuery.noConflict();
  (function( $ ) {
    $(document).ready(function() {
            $('#summernote').summernote({
              toolbar: [
                ['fontname', ['fontname']],
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['insert',['picture','link']],
              ],
              lang: 'ko-KR',
              placeholder: '내용을 입력해주세요',
              height: 500,
              disabledResizeEditor:true,            
              fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
              fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],	 
              focus: true
            });
          });
  })( jQuery );
  </script>
  <style>
    .note-modal-content, .note-modal-content:before, .note-modal-content:after{box-sizing: unset!important;}
    .note-modal-footer,.note-modal-footer:before, .note-modal-footer:after{box-sizing: unset!important;}
    .input-group-text{width:80px}
      /* *{border:1px solid red} */
    
  </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <section>
        <div class="outer">    
          <p class="pageTitle">  e-mail <b> 전자메일</b></p>
            <jsp:include page="mailSidebar.jsp"/>
            <div class="mailOuter row">
              <div class="card" style="margin-bottom: 5rem; width:100%">
                <div class="card-body">
                  <form action="" method="post" enctype="Multipart/form-data" id="form">
                    <h3 style="margin-bottom: 25px;">메일쓰기</h3>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-0">제목</span>
                      </div>
                      <input type="text" placeholder="제목을 입력해주세요" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-0">받는사람</span>
                      </div>
                      <input type="text" class="form-control" value="">
                    </div>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-0">수신참조</span>
                      </div>
                      <input type="text" class="form-control" value="">
                    </div>
                  
                    <div class="form-group">
                        <textarea class="form-control" id="summernote" maxlength="140" rows="7" autocomplete="off"></textarea>
                    </div><br>
                    <div class="filebox justify-content-center">
                      <input class="upload-name" value="" disabled="disabled"> 
                      <label for="rwFilename" style="font-size: 11pt;">파일 첨부하기</label> 
                      <input type="file" id="rwFilename" name="rwFilename" class="upload-hidden" onchange="checkSize(this)"> 
                    </div>
                      <br>
                    <div class="row justify-content-center">
                      <button type="button" id="submitBtn" class="btn btn-primary">발송하기</button>
                      <button type="button" onclick="location.href=''" class="btn btn-secondary">취소</button>
                    </div>

                  </form>
                </div>
              </div>
             
            </div>
    	</div>
    </section>

<script>
     $(document).on('click','#submitBtn',function(){
          if(confirm("정말로 제출하시겠습니까?\n기안 후엔 수정이 불가능합니다.")){
            $("#form").submit();
          }					
        });

              // 파일첨부 시작
      $(document).ready(function(){
        var fileTarget = $('.filebox .upload-hidden'); fileTarget.on('change', function(){
            if(window.FileReader){
              var filename = $(this)[0].files[0].name; 
            } else { 
              var filename = $(this).val().split('/').pop().split('\\').pop(); 
            } 
            $(this).siblings('.upload-name').val(filename); 
          }); 
       });

        function checkSize(input) {
        	
        	pathpoint = input.value.lastIndexOf('.');
        	filepoint = input.value.substring(pathpoint+1,input.length);
        	filetype = filepoint.toLowerCase();

        	
          if (input.files && input.files[0].size > (20 * 1024 * 1024)) {
              alert("파일 사이즈가 20mb 를 넘습니다.");
              input.value = null; 
            }
          } //파일첨부 끝
</script>
    



</body>
</html>