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
              lang: 'ko-KR',
              placeholder: '내용을 입력해주세요',
              height: 500,
              minHeight: 500,
              focus: true
            });
          });
  })( jQuery );
  </script>
  <style>
    .note-modal-content, .note-modal-content:before, .note-modal-content:after{box-sizing: unset!important;}
    .note-modal-footer,.note-modal-footer:before, .note-modal-footer:after{box-sizing: unset!important;}
  </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <section>
        <div class="outer">    
            <jsp:include page="apprSidebar.jsp"/>
            <div class="sideOuter">
              <div class="card shadow" style="margin-bottom: 5rem;">
                <div class="card-body">
                  <form action="" method="post" enctype="Multipart/form-data" id="form">
                    <h3 style="margin-bottom: 25px;">결재 서류</h3>
                    <div class="form-group">
                      <strong>기안자 : </strong><input type="text" class="form-control" value="돌쇠" name="empNo" readonly>
                    </div>
                    <div class="row">
                      <div class="form-group col-lg-6">
                          <strong>결재자 : </strong><input type="text" class="form-control" value="박결재" >
                      </div>
                      <div class="form-group col-lg-6">
                        <strong>참조자 : </strong><input type="text" class="form-control" value="박참조" >
                      </div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="제목을 입력해주세요" autocomplete="off" required>
                      </div>
                    <div class="form-group">
                        <textarea class="form-control" id="summernote" maxlength="140" rows="7" autocomplete="off"></textarea>
                    </div><br>
                    <div class="filebox row justify-content-center">
                      <input class="upload-name" value="" disabled="disabled"> 
                      <label for="rwFilename" style="font-size: 11pt;">파일 첨부하기</label> 
                      <input type="file" id="rwFilename" name="rwFilename" class="upload-hidden" onchange="checkSize(this)"> 
                    </div>
                      <br>
                    <div class="row justify-content-center">
                      <button type="button" id="submitBtn" class="btn btn-primary">기안하기</button>
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